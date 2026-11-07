#!/data/data/com.termux/files/usr/bin/bash
# Ubuntu Köşe kurulumu: Termux içinde Ubuntu 24.04 + XFCE ve Raspberry Pi OS masaüstü kurar.
# Tekrar çalıştırmak güvenli, kurulu olanları atlar.
set -e
echo -e "\e[1;33m== Ubuntu Köşe kurulumu başlıyor (15-30 dk, ~2 GB) ==\e[0m"
termux-wake-lock 2>/dev/null || true

# 1) Ubuntu Köşe uygulaması Termux'a komut gönderebilsin
mkdir -p ~/.termux
sed -i '/^[[:space:]]*allow-external-apps[[:space:]]*=/d' ~/.termux/termux.properties 2>/dev/null || true
printf '\nallow-external-apps = true\n' >> ~/.termux/termux.properties
termux-reload-settings 2>/dev/null || true

# 2) Termux paketleri
export DEBIAN_FRONTEND=noninteractive
pkg update -y -o Dpkg::Options::=--force-confold
pkg upgrade -y -o Dpkg::Options::=--force-confold
pkg install -y x11-repo
pkg install -y termux-x11-nightly proot-distro pulseaudio

# 3) Ubuntu
# rootfs klasörü proot-distro sürümüne göre değişiyor; dosyaları içeriden yaz
proot-distro login ubuntu -- true 2>/dev/null || proot-distro install ubuntu
# HEDEF=<dağıtım> icine <dosya>: stdin'i o dağıtımın içine yazar (varsayılan ubuntu)
icine() { proot-distro login "${HEDEF:-ubuntu}" -- bash -c "cat > $1"; }

icine /root/ic-kur.sh <<'IC'
#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y
apt install -y --no-install-recommends \
  xfce4 xfce4-terminal xfce4-whiskermenu-plugin xfce4-taskmanager thunar mousepad ristretto \
  dbus-x11 at-spi2-core yaru-theme-gtk yaru-theme-icon fonts-ubuntu ubuntu-wallpapers \
  plank sudo nano wget ca-certificates gpg pulseaudio-utils x11-xserver-utils yad xdotool xinput python3-gi gir1.2-gtk-3.0
# Firefox: Ubuntu'nun snap'i proot'ta çalışmaz, Mozilla'nın deb deposundan kur
if ! command -v firefox >/dev/null; then
  install -d -m 0755 /etc/apt/keyrings
  wget -qO /etc/apt/keyrings/packages.mozilla.org.asc https://packages.mozilla.org/apt/repo-signing-key.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" > /etc/apt/sources.list.d/mozilla.list \
  && printf 'Package: *\nPin: origin packages.mozilla.org\nPin-Priority: 1000\n' > /etc/apt/preferences.d/mozilla \
  && apt update && apt install -y firefox || echo "Firefox kurulamadı, geri kalanı tamam."
fi

# Ubuntu görünümü: Yaru tema/ikon, Ubuntu fontu, solda dock
X=/root/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir -p $X /root/.config/autostart
cat > $X/xsettings.xml <<'XML'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xsettings" version="1.0">
  <property name="Net" type="empty">
    <property name="ThemeName" type="string" value="Yaru-dark"/>
    <property name="IconThemeName" type="string" value="Yaru"/>
  </property>
  <property name="Gtk" type="empty">
    <property name="FontName" type="string" value="Ubuntu 10"/>
    <property name="MonospaceFontName" type="string" value="Ubuntu Mono 11"/>
  </property>
</channel>
XML
cat > /root/.config/autostart/plank.desktop <<'DT'
[Desktop Entry]
Type=Application
Name=Plank
Exec=plank
DT
mkdir -p /root/.config/plank/dock1/launchers
for a in firefox xfce4-terminal thunar mousepad; do
  printf '[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/%s.desktop\n' "$a" \
    > /root/.config/plank/dock1/launchers/$a.dockitem
done

IC
proot-distro login ubuntu -- bash /root/ic-kur.sh

# İki sistemde ortak: klavye tuşu (sağ üstteki sistem tepsisinde) ve sistem değiştirme komutları
cat > ~/.kose-ortak.sh <<'OR'
#!/bin/bash
# Termux tarafına istek: /tmp/kose-istek (Termux'taki kose-oturum.sh dinliyor, --shared-tmp ile ortak)
cat > /usr/local/bin/kose-istek <<'KI'
#!/bin/bash
[ -p /tmp/kose-istek ] && timeout 3 bash -c 'echo "$*" > /tmp/kose-istek' _ "$@"
KI
# klavye-tus: telefonun kendi klavyesini (Samsung Klavye) açar/kapatır
printf '#!/bin/bash\nexec kose-istek klavye\n' > /usr/local/bin/klavye-tus
# kose-dokunma fare|tikla|dokunmatik: dokunma modunu değiştirir
cat > /usr/local/bin/kose-dokunma <<'KD'
#!/bin/bash
case "$1" in fare|trackpad|tikla|dokunmatik) kose-istek mod "$1" ;;
  *) echo "Kullanım: kose-dokunma fare | tikla | dokunmatik"; exit 1 ;; esac
KD
# kose-gec xfce|raspi: bu masaüstünü kapatır, Termux tarafındaki döngü seçilen sistemi açar
cat > /usr/local/bin/kose-gec <<'KG'
#!/bin/bash
echo "$1" > /tmp/kose-gecis
pkill -x xfce4-session; pkill -x lxsession; true
KG
# Tepsi simgesi (beyaz klavye, koyu kenar: açık ve koyu panelde görünsün)
mkdir -p /usr/share/kose
cat > /usr/share/kose/klavye.svg <<'SV'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect x="1.5" y="5" width="21" height="14" rx="2.5" fill="#fff" stroke="#222" stroke-width="1.4"/><g fill="#222"><rect x="4" y="8" width="2.4" height="2.2" rx=".5"/><rect x="7.6" y="8" width="2.4" height="2.2" rx=".5"/><rect x="11.2" y="8" width="2.4" height="2.2" rx=".5"/><rect x="14.8" y="8" width="2.4" height="2.2" rx=".5"/><rect x="18" y="8" width="2.2" height="2.2" rx=".5"/><rect x="5.6" y="11.6" width="2.4" height="2.2" rx=".5"/><rect x="9.2" y="11.6" width="2.4" height="2.2" rx=".5"/><rect x="12.8" y="11.6" width="2.4" height="2.2" rx=".5"/><rect x="16.4" y="11.6" width="2.4" height="2.2" rx=".5"/><rect x="7" y="15.2" width="10" height="2" rx=".5"/></g></svg>
SV
# kose-tepsi: sağ üstteki tepside klavye simgesi. Dokun: klavye. Uzun bas / sağ tık: menü.
cat > /usr/local/bin/kose-tepsi <<'KY'
#!/bin/bash
[ -f /root/.config/kose/tepsi-kapali ] && exit 0
pkill -f 'yad --notification' 2>/dev/null
exec yad --notification --image=/usr/share/kose/klavye.svg --text="Klavye (uzun bas: menü)" \
  --command=klavye-tus \
  --menu="Klavye!klavye-tus|Köşe Ayarları!kose-ayarlar|Dokunma: Fare (trackpad)!kose-dokunma fare|Dokunma: Tıkla seç!kose-dokunma tikla|Dokunma: Dokunmatik (tek parmakla kaydır)!kose-dokunma dokunmatik|Ubuntu XFCE başlat!kose-gec xfce|Raspberry Pi OS başlat!kose-gec raspi"
KY
# kose-ayarlar: Ayarlar (Preferences) menüsündeki Köşe Ayarları penceresi
cat > /usr/local/bin/kose-ayarlar <<'KA'
#!/bin/bash
A=/root/.config/kose; mkdir -p $A
mod=$(cat /tmp/kose-dokunma 2>/dev/null); sis=$(cat /tmp/kose-masaustu 2>/dev/null)
sec() { local o="" x; for x in "$@"; do [ "${x%%|*}" = "$SECILI" ] && o+="^"; o+="${x#*|}!"; done; echo "${o%!}"; }
SECILI=${mod:-tikla}; MODLAR=$(sec "fare|Fare (trackpad)" "tikla|Tıkla seç" "dokunmatik|Dokunmatik (tek parmakla kaydır)")
SECILI=${sis:-xfce};  SISLER=$(sec "xfce|Ubuntu XFCE" "raspi|Raspberry Pi OS")
[ -f $A/uclu-kapali ] && U=FALSE || U=TRUE
[ -f $A/tepsi-kapali ] && T=FALSE || T=TRUE
c=$(yad --form --title="Köşe Ayarları" --window-icon=/usr/share/kose/klavye.svg --width=460 --center \
  --text="<b>Ubuntu Köşe</b>  ·  dokunma, klavye ve sistem" \
  --field="Dokunma modu:CB" "$MODLAR" \
  --field="Üç kez dokununca tümünü seç ve Kopyala menüsü:CHK" "$U" \
  --field="Sağ üstte klavye tuşu:CHK" "$T" \
  --field="Açılışta başlayan sistem:CB" "$SISLER" \
  --field="Klavyeyi şimdi aç/kapat:FBTN" "klavye-tus" \
  --button="Vazgeç:1" --button="Kaydet:0") || exit 0
IFS='|' read -r m u t s _ <<< "$c"
case "$m" in Fare*) m=fare ;; Dokunmatik*) m=dokunmatik ;; *) m=tikla ;; esac
[ "$m" != "$mod" ] && kose-istek mod $m
[ "$u" = TRUE ] && rm -f $A/uclu-kapali || touch $A/uclu-kapali
if [ "$t" = TRUE ]; then rm -f $A/tepsi-kapali; pgrep -f 'yad --notification' >/dev/null || (kose-tepsi >/dev/null 2>&1 &)
else touch $A/tepsi-kapali; pkill -f 'yad --notification'; fi
case "$s" in Raspberry*) s=raspi ;; *) s=xfce ;; esac
if [ "$s" != "$sis" ]; then
  kose-istek sistem $s
  yad --question --title="Köşe Ayarları" --center --text="Şimdi $( [ $s = raspi ] && echo 'Raspberry Pi OS' || echo 'Ubuntu XFCE' )'a geçilsin mi?" \
    --button="Sonra:1" --button="Şimdi geç:0" && kose-gec $s
fi
KA
# kose-uclu: yazıya 3 kez dokununca hepsini seçer, üstte Android gibi Kes/Kopyala/Yapıştır çıkar
cat > /usr/local/bin/kose-uclu <<'PYU'
#!/usr/bin/env python3
import os, subprocess, threading, time, gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib

CSS = b'''
#kmenu { background: #2b2b2b; border-radius: 22px; padding: 4px 6px; }
#kmenu button { background: none; border: none; box-shadow: none; color: #fff;
  font-size: 15px; padding: 8px 14px; border-radius: 16px; }
#kmenu button:hover, #kmenu button:active { background: #4a4a4a; }
'''

def tus(k):
    subprocess.Popen(['xdotool', 'key', '--clearmodifiers', k])

class Menu(Gtk.Window):
    def __init__(self):
        # POPUP: pencere yöneticisi dokunmaz, odağı çalmaz; kısayol tuşları alttaki uygulamaya gider
        super().__init__(type=Gtk.WindowType.POPUP)
        self.set_name('kmenu')
        scr = self.get_screen()
        kutu = Gtk.Box(spacing=2); self.add(kutu)
        for ad, k in (('Kes', 'ctrl+x'), ('Kopyala', 'ctrl+c'), ('Yapıştır', 'ctrl+v'), ('Tümünü seç', 'ctrl+a')):
            d = Gtk.Button(label=ad); d.connect('clicked', self.bas, k); kutu.pack_start(d, False, False, 0)
        p = Gtk.CssProvider(); p.load_from_data(CSS)
        Gtk.StyleContext.add_provider_for_screen(scr, p, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
        self.zaman = None

    def bas(self, _d, k):
        self.hide()
        GLib.timeout_add(120, lambda: (tus(k), False)[1])

    def goster(self):
        tus('ctrl+a')
        ekran = Gdk.Display.get_default()
        _, x, y = ekran.get_default_seat().get_pointer().get_position()
        self.show_all()
        w, h = self.get_size()
        sw = self.get_screen().get_width()
        self.move(max(4, min(x - w // 2, sw - w - 4)), max(4, y - h - 40))
        if self.zaman: GLib.source_remove(self.zaman)
        self.zaman = GLib.timeout_add(6000, lambda: (self.hide(), False)[1])
        return False

menu = Menu()

def dinle():
    # XInput2 ham olayları: fare tıklaması (RawButtonPress, sol tuş) ya da parmak (RawTouchBegin)
    while True:
        try:
            pr = subprocess.Popen(['stdbuf', '-oL', 'xinput', 'test-xi2', '--root'], stdout=subprocess.PIPE, text=True)
        except Exception:
            time.sleep(5); continue
        bekle, son, dokunuslar = None, 0, []
        for satir in pr.stdout:
            if '(RawButtonPress)' in satir: bekle = 'tus'; continue
            if '(RawTouchBegin)' in satir: bekle = None; olay = True
            elif bekle == 'tus' and satir.strip().startswith('detail:'):
                olay = satir.split()[1] == '1'; bekle = None
            else: continue
            if not olay: continue
            t = time.monotonic()
            if t - son < 0.05: continue      # aynı dokunuşun hem touch hem tık hâli
            son = t
            dokunuslar = [d for d in dokunuslar if t - d < 0.75] + [t]
            if len(dokunuslar) >= 3:
                dokunuslar = []
                if not os.path.exists('/root/.config/kose/uclu-kapali'):
                    GLib.timeout_add(200, menu.goster)
        time.sleep(2)

threading.Thread(target=dinle, daemon=True).start()
Gtk.main()
PYU
chmod +x /usr/local/bin/kose-ayarlar /usr/local/bin/kose-istek /usr/local/bin/klavye-tus /usr/local/bin/kose-dokunma /usr/local/bin/kose-gec /usr/local/bin/kose-tepsi /usr/local/bin/kose-uclu
mkdir -p /root/.config/autostart
printf '[Desktop Entry]\nType=Application\nName=Klavye tuşu\nExec=kose-tepsi\n' > /root/.config/autostart/kose-tepsi.desktop
printf '[Desktop Entry]\nType=Application\nName=Üç dokunuşla seç\nExec=kose-uclu\n' > /root/.config/autostart/kose-uclu.desktop
# Firefox dokunmayla (tek parmak) kaysın
grep -q MOZ_USE_XINPUT2 /etc/environment 2>/dev/null || echo MOZ_USE_XINPUT2=1 >> /etc/environment
# Menüde de dursunlar
rm -f /usr/share/applications/kose-*.desktop
yaz() { printf '[Desktop Entry]\nType=Application\nName=%s\nExec=%s\nIcon=%s\nCategories=%s\n' "$2" "$3" "$4" "${5:-System;Utility;}" > /usr/share/applications/$1.desktop; }
# Raspberry Pi OS'ta Menü > Preferences, XFCE'de Ayarlar Yöneticisi ve Menü > Ayarlar
yaz kose-ayarlar "Köşe Ayarları" kose-ayarlar /usr/share/kose/klavye.svg "Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-PersonalSettings;GTK;"
yaz kose-klavye "Klavye (telefonun)" klavye-tus /usr/share/kose/klavye.svg
yaz kose-xfce "Ubuntu XFCE'ye geç" "kose-gec xfce" system-reboot
yaz kose-raspi "Raspberry Pi OS'a geç" "kose-gec raspi" system-reboot
OR
icine /root/ortak.sh < ~/.kose-ortak.sh
proot-distro login ubuntu -- bash /root/ortak.sh

icine /root/masaustu.sh <<'MS'
#!/bin/bash
export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1 XDG_RUNTIME_DIR=/tmp/runtime-root MOZ_USE_XINPUT2=1
mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR
# duvar kağıdı DBus oturumunun İÇİNDE ayarlanmalı, dışarıdan xfconf-query boşa gider.
# xfdesktop ayarı monitör adına bağlı, adı açıldıktan sonra xrandr'dan öğren.
cat > /tmp/duvar.sh <<'DV'
sleep 6
img=$(ls /usr/share/backgrounds/*.png /usr/share/backgrounds/*.jpg 2>/dev/null | grep -iv dimmed | head -1)
for m in $(xrandr --listmonitors 2>/dev/null | awk 'NR>1{print $NF}') screen 0; do
  for w in 0 1 2 3; do
    xfconf-query -c xfce4-desktop -n -t string -p /backdrop/screen0/monitor$m/workspace$w/last-image -s "$img"
    xfconf-query -c xfce4-desktop -n -t int -p /backdrop/screen0/monitor$m/workspace$w/image-style -s 5
  done
done
# Ubuntu düzeni: tek dock solda (Plank), XFCE'nin alttaki ikinci paneli kalksın
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a && xfce4-panel -r
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ position left
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ icon-size 40
# Panel yeniden başlayınca tepsi simgesi düşebiliyor, garanti olsun diye tekrar aç
sleep 3; (kose-tepsi >/dev/null 2>&1 &)
DV
exec dbus-launch --exit-with-session bash -c '(bash /tmp/duvar.sh &); exec startxfce4'
MS

# 4) Uygulamanın çalıştırdığı başlatıcı (adı değişmiyor, uygulama bu dosyayı çağırıyor)
cat > ~/ubuntu-baslat.sh <<'BS'
#!/data/data/com.termux/files/usr/bin/bash
# Ubuntu Köşe: seçili masaüstünü (XFCE ya da Raspberry Pi OS) başlatır, zaten açıksa sadece ayarları uygular.
# Arka planda çalıştığı için çıktı görünmüyor; çökme sebebi için ~/ubuntu.log'a yaz.
exec >> ~/ubuntu.log 2>&1
echo "=== $(date) başlat ($(cat ~/.kose-masaustu 2>/dev/null || echo xfce)) ==="
# Termux:X11 ayarı pencere açıkken yazılabiliyor, o yüzden biraz bekleyip arka planda.
# Yazım anahtar:değer; anahtar=değer sessizce yok sayılıyor.
# hideCutout: kamera deliği şeridini de kullan; ek tuş çubuğu gizli (geri tuşu açar/kapatır)
# touchMode: 1 fare (trackpad), 2 tıkla seç, 3 dokunmatik. Son seçilen ~/.kose-dokunma'da.
# swipeUpAction: üç parmakla yukarı kaydır = telefonun klavyesi; tepsideki tuş da bu eylemi tetikliyor.
case "$(cat ~/.kose-dokunma 2>/dev/null)" in fare|trackpad) TM=1 ;; dokunmatik) TM=3 ;; *) TM=2 ;; esac
( sleep 3; timeout 20 termux-x11-preference forceOrientation:landscape fullscreen:true \
    displayResolutionMode:scaled displayScale:150 hideCutout:true additionalKbdVisible:false \
    touchMode:$TM "swipeUpAction:toggle soft keyboard" >/dev/null 2>&1 ) &
pgrep -f 'com.termux.x11 :0' >/dev/null && { wait; exit 0; }
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1 >/dev/null 2>&1
export XDG_RUNTIME_DIR=$TMPDIR
exec termux-x11 :0 -xstartup "bash $HOME/kose-oturum.sh"
BS
# Termux:X11 içinde dönen oturum: seçili sistemi açar; içeriden "geç" denirse kapatıp diğerini açar
cat > ~/kose-oturum.sh <<'KO'
#!/data/data/com.termux/files/usr/bin/bash
R=$(cat ~/.kose-raspi-ad 2>/dev/null || echo raspi)
# Masaüstünden gelen istekler (/tmp/kose-istek): klavye aç/kapat, dokunma modu
F=$TMPDIR/kose-istek; rm -f "$F"; mkfifo "$F"
# Ayarlar penceresi şu anki seçimleri görsün (/tmp ortak)
cp ~/.kose-dokunma "$TMPDIR/kose-dokunma" 2>/dev/null
( while true; do
    while read -r k a; do
      case "$k" in
        klavye) am broadcast -a com.termux.x11.ACTION_CUSTOM --es what swipeUp -p com.termux.x11 >/dev/null 2>&1 ;;
        mod) case "$a" in fare|trackpad) m=1 ;; dokunmatik) m=3 ;; *) m=2 ;; esac
             echo "$a" > ~/.kose-dokunma; echo "$a" > "$TMPDIR/kose-dokunma"
             timeout 20 termux-x11-preference touchMode:$m >/dev/null 2>&1 ;;
        sistem) case "$a" in raspi|xfce) echo "$a" > ~/.kose-masaustu; echo "$a" > "$TMPDIR/kose-masaustu" ;; esac ;;
      esac
    done < "$F"
  done ) &
DINLE=$!
trap 'kill $DINLE 2>/dev/null; rm -f "$F"' EXIT
while true; do
  cp ~/.kose-masaustu "$TMPDIR/kose-masaustu" 2>/dev/null
  rm -f "$TMPDIR/kose-gecis"
  if [ "$(cat ~/.kose-masaustu 2>/dev/null)" = raspi ] && proot-distro login "$R" -- test -f /root/masaustu.sh; then
    proot-distro login "$R" --shared-tmp -- bash /root/masaustu.sh
  else
    proot-distro login ubuntu --shared-tmp -- bash /root/masaustu.sh
  fi
  [ -s "$TMPDIR/kose-gecis" ] || break
  cat "$TMPDIR/kose-gecis" > ~/.kose-masaustu
done
KO
# Termux'tan seçim: kose-sec xfce | kose-sec raspi (açıksa hemen geçer, değilse bir sonraki açılışta)
cat > $PREFIX/bin/kose-sec <<'KS'
#!/data/data/com.termux/files/usr/bin/bash
case "$1" in
  xfce|ubuntu) s=xfce ;;
  raspi|pi|raspberry) s=raspi ;;
  *) echo "Kullanım: kose-sec xfce | kose-sec raspi   (şu an: $(cat ~/.kose-masaustu 2>/dev/null || echo xfce))"; exit 1 ;;
esac
echo $s > ~/.kose-masaustu
if pgrep -f 'com.termux.x11 :0' >/dev/null; then
  echo $s > "$TMPDIR/kose-gecis"; pkill -x xfce4-session; pkill -x lxsession
fi
echo "Seçildi: $s"
KS
chmod +x ~/ubuntu-baslat.sh ~/kose-oturum.sh $PREFIX/bin/kose-sec
[ -f ~/.kose-masaustu ] || echo xfce > ~/.kose-masaustu

# 5) Raspberry Pi OS: Debian + Raspberry Pi'nin kendi deposundan masaüstü görünümü.
# Bir hata Ubuntu'yu bozmasın diye ayrı ve hataya dayanıklı.
raspi_kur() {
  R=raspi
  if ! proot-distro login raspi -- true 2>/dev/null; then
    proot-distro install --override-alias raspi debian || {
      R=debian; proot-distro login debian -- true 2>/dev/null || proot-distro install debian; }
  fi
  echo $R > ~/.kose-raspi-ad
  HEDEF=$R icine /root/ic-raspi.sh <<'RI'
#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y
apt install -y --no-install-recommends \
  lxde-core lxterminal lxappearance mousepad dbus-x11 at-spi2-core firefox-esr \
  sudo nano wget ca-certificates gpg pulseaudio-utils x11-xserver-utils yad xdotool xinput python3-gi gir1.2-gtk-3.0 || exit 1
# Raspberry Pi deposu (PIXEL masaüstü, tema, ikon, duvar kağıdı). Ulaşılamazsa sade LXDE kalır.
. /etc/os-release
if wget -qO- https://archive.raspberrypi.com/debian/raspberrypi.gpg.key | gpg --dearmor --yes -o /usr/share/keyrings/raspberrypi.gpg; then
  echo "deb [signed-by=/usr/share/keyrings/raspberrypi.gpg] https://archive.raspberrypi.com/debian $VERSION_CODENAME main" \
    > /etc/apt/sources.list.d/raspi.list
  apt update || { rm -f /etc/apt/sources.list.d/raspi.list; apt update; }
fi
# Paketleri tek tek dene: biri yoksa ya da proot'ta kurulamazsa geri al, devam et
for p in rpd-wallpaper rpd-icons rpd-theme pixflat-icons pixflat-theme lxpanel-pi lxde-pi-rc; do
  apt install -y --no-install-recommends $p || { apt purge -y $p; dpkg --configure -a; } || true
done
# Raspberry Pi gibi: panel üstte. lxde-pi yoksa LXDE panelini üste taşı.
mkdir -p /root/.config/lxpanel/LXDE/panels /root/.config/gtk-3.0
[ -f /etc/xdg/lxpanel/LXDE/panels/panel ] && sed 's/edge=bottom/edge=top/' /etc/xdg/lxpanel/LXDE/panels/panel \
  > /root/.config/lxpanel/LXDE/panels/panel
for t in PiXflat PiXnoir; do
  if [ -d /usr/share/themes/$t ]; then
    printf '[Settings]\ngtk-theme-name=%s\ngtk-icon-theme-name=PiXflat\n' $t > /root/.config/gtk-3.0/settings.ini; break
  fi
done
exit 0
RI
  proot-distro login $R -- bash /root/ic-raspi.sh || return 1
  HEDEF=$R icine /root/ortak.sh < ~/.kose-ortak.sh
  proot-distro login $R -- bash /root/ortak.sh
  HEDEF=$R icine /root/masaustu.sh <<'RM'
#!/bin/bash
export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1 XDG_RUNTIME_DIR=/tmp/runtime-root MOZ_USE_XINPUT2=1
mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR
cat > /tmp/raspi-ayar.sh <<'RA'
sleep 6
img=$(ls /usr/share/rpd-wallpaper/*.jpg /usr/share/rpd-wallpaper/*.png 2>/dev/null | head -1)
[ -n "$img" ] && pcmanfm --set-wallpaper="$img" --wallpaper-mode=crop
RA
# Gerçek Raspberry Pi oturumu varsa onu, yoksa LXDE'yi aç
if command -v startlxde-pi >/dev/null; then OT=startlxde-pi; else OT=startlxde; fi
exec dbus-launch --exit-with-session bash -c "(bash /tmp/raspi-ayar.sh &); exec $OT"
RM
}
echo -e "\e[1;33m== Raspberry Pi OS kuruluyor (~1 GB daha) ==\e[0m"
if raspi_kur; then
  echo -e "\e[1;32mRaspberry Pi OS hazır. Geçmek için: kose-sec raspi\e[0m"
else
  echo -e "\e[1;31mRaspberry Pi OS kurulamadı, Ubuntu XFCE yine çalışır. Tekrar denemek için kurulumu yeniden çalıştır.\e[0m"
fi

termux-wake-unlock 2>/dev/null || true
echo -e "\e[1;32m== Kurulum bitti! Ubuntu Köşe uygulamasına dön. ==\e[0m"
