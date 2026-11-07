# Usage: paketle.py orig.apk replace_name replace_file key.pem cert.der out.apk
import sys, zipfile, struct, hashlib, io
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding
src, rname, rfile, keyf, certf, out = sys.argv[1:7]
# 1) rebuild zip, 4-byte align STORED entries
zi = zipfile.ZipFile(src)
buf = io.BytesIO()
zo = zipfile.ZipFile(buf, 'w')
for info in zi.infolist():
    data = open(rfile,'rb').read() if info.filename == rname else zi.read(info)
    ni = zipfile.ZipInfo(info.filename, date_time=info.date_time)
    ni.compress_type = info.compress_type; ni.external_attr = info.external_attr
    ni.create_system = info.create_system
    if ni.compress_type == zipfile.ZIP_STORED:
        hdr_len = 30 + len(info.filename.encode())
        pad = (-(buf.tell() + hdr_len)) % 4
        ni.extra = b'\x00' * pad if pad == 0 else struct.pack('<HH', 0xD935, pad-4) + b'\0'*(pad-4) if pad >= 4 else b'\0'*pad
        if pad and pad < 4:  # need >=4 bytes for a proper extra field; bump to pad+4
            pad += 4; ni.extra = struct.pack('<HH', 0xD935, pad-4) + b'\0'*(pad-4)
    zo.writestr(ni, data, compress_type=ni.compress_type, compresslevel=9 if ni.compress_type else None)
zo.close()
z = buf.getvalue()
# verify alignment
for info in zipfile.ZipFile(io.BytesIO(z)).infolist():
    if info.compress_type == 0:
        o = info.header_offset; n, e = struct.unpack('<HH', z[o+26:o+30])
        assert (o+30+n+e) % 4 == 0, info.filename
# 2) split
eocd = z.rfind(b'PK\x05\x06')
cd_off = struct.unpack('<I', z[eocd+16:eocd+20])[0]
s1, s3, s4 = z[:cd_off], z[cd_off:eocd], bytearray(z[eocd:])
def chunks(b):
    return [b[i:i+1048576] for i in range(0, len(b), 1048576)]
def digest(s4mod):
    ds = []
    for sec in (s1, s3, bytes(s4mod)):
        for c in chunks(sec):
            ds.append(hashlib.sha256(b'\xa5' + struct.pack('<I', len(c)) + c).digest())
    return hashlib.sha256(b'\x5a' + struct.pack('<I', len(ds)) + b''.join(ds)).digest()
lp = lambda b: struct.pack('<I', len(b)) + b
d = digest(s4)  # EOCD cd offset = start of signing block = cd_off (unchanged)
key = serialization.load_pem_private_key(open(keyf,'rb').read(), None)
cert = open(certf,'rb').read()
ALG = 0x0103
signed = lp(lp(struct.pack('<I', ALG) + lp(d))) + lp(lp(cert)) + lp(b'')
sig = key.sign(signed, padding.PKCS1v15(), hashes.SHA256())
pub = key.public_key().public_bytes(serialization.Encoding.DER, serialization.PublicFormat.SubjectPublicKeyInfo)
signer = lp(signed) + lp(lp(struct.pack('<I', ALG) + lp(sig))) + lp(pub)
v2 = lp(lp(signer))
pair = struct.pack('<Q', 4 + len(v2)) + struct.pack('<I', 0x7109871a) + v2
size = len(pair) + 8 + 16
block = struct.pack('<Q', size) + pair + struct.pack('<Q', size) + b'APK Sig Block 42'
struct.pack_into('<I', s4, 16, cd_off + len(block))
open(out, 'wb').write(s1 + block + s3 + bytes(s4))
print('ok', len(block))
