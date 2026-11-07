#!/data/data/com.termux/files/usr/bin/bash
# Ubuntu Köşe kurulumu: Termux içinde Ubuntu 24.04 + XFCE masaüstü kurar.
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
icine() { proot-distro login ubuntu -- bash -c "cat > $1"; }

icine /root/ic-kur.sh <<'IC'
#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y
apt install -y --no-install-recommends \
  xfce4 xfce4-terminal xfce4-whiskermenu-plugin xfce4-taskmanager thunar mousepad ristretto \
  dbus-x11 at-spi2-core yaru-theme-gtk yaru-theme-icon fonts-ubuntu ubuntu-wallpapers \
  plank sudo nano wget ca-certificates gpg pulseaudio-utils x11-xserver-utils onboard
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

# Klavye tuşu: üst panelin sağ ucunda, dokununca ekran klavyesi (Onboard) açılır/kapanır
cat > /usr/local/bin/klavye-tus <<'KT'
#!/bin/bash
if pgrep -x onboard >/dev/null; then
  dbus-send --type=method_call --dest=org.onboard.Onboard /org/onboard/Onboard/Keyboard \
    org.onboard.Onboard.Keyboard.ToggleVisible || { pkill -x onboard; }
else
  onboard >/dev/null 2>&1 &
fi
KT
chmod +x /usr/local/bin/klavye-tus
mkdir -p /root/.config/xfce4/panel/launcher-90
cat > /root/.config/xfce4/panel/launcher-90/klavye.desktop <<'KD'
[Desktop Entry]
Type=Application
Name=Klavye
Comment=Ekran klavyesini aç/kapat
Exec=klavye-tus
Icon=input-keyboard
Terminal=false
KD
IC
proot-distro login ubuntu -- bash /root/ic-kur.sh

icine /root/masaustu.sh <<'MS'
#!/bin/bash
export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1 XDG_RUNTIME_DIR=/tmp/runtime-root
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
# Klavye tuşunu üst panelin en sağına ekle (bir kez; varsa atla)
P=/panels/panel-1/plugin-ids
if ! xfconf-query -c xfce4-panel -p $P | grep -qx 90; then
  xfconf-query -c xfce4-panel -p /plugins/plugin-90 -n -t string -s launcher
  xfconf-query -c xfce4-panel -p /plugins/plugin-90/items -n -a -t string -s klavye.desktop
  set --
  for i in $(xfconf-query -c xfce4-panel -p $P | grep -E '^[0-9]+$') 90; do set -- "$@" -t int -s $i; done
  xfconf-query -c xfce4-panel -p $P -n -a "$@"
fi
# Onboard ekranın altına yapışık açılsın, kendi yüzen simgesi çıkmasın
gsettings set org.onboard.window docking-enabled true 2>/dev/null
gsettings set org.onboard.icon-palette in-use false 2>/dev/null
# Ubuntu düzeni: tek dock solda (Plank), XFCE'nin alttaki ikinci paneli kalksın
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a && xfce4-panel -r
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ position left
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ icon-size 40
DV
exec dbus-launch --exit-with-session bash -c '(bash /tmp/duvar.sh &); exec startxfce4'
MS

# 4) Uygulamanın çalıştırdığı başlatıcı
cat > ~/ubuntu-baslat.sh <<'BS'
#!/data/data/com.termux/files/usr/bin/bash
# Ubuntu Köşe: masaüstünü başlatır, zaten açıksa sadece ayarları uygular.
# Arka planda çalıştığı için çıktı görünmüyor; çökme sebebi için ~/ubuntu.log'a yaz.
exec >> ~/ubuntu.log 2>&1
echo "=== $(date) başlat ==="
# Termux:X11 ayarı pencere açıkken yazılabiliyor, o yüzden biraz bekleyip arka planda.
# Yazım anahtar:değer; anahtar=değer sessizce yok sayılıyor.
# hideCutout: kamera deliği şeridini de kullan; ek tuş çubuğu gizli (geri tuşu açar/kapatır)
( sleep 3; timeout 20 termux-x11-preference forceOrientation:landscape fullscreen:true \
    displayResolutionMode:scaled displayScale:150 hideCutout:true additionalKbdVisible:false \
    >/dev/null 2>&1 ) &
pgrep -f 'com.termux.x11 :0' >/dev/null && { wait; exit 0; }
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1 >/dev/null 2>&1
export XDG_RUNTIME_DIR=$TMPDIR
exec termux-x11 :0 -xstartup "proot-distro login ubuntu --shared-tmp -- bash /root/masaustu.sh"
BS
chmod +x ~/ubuntu-baslat.sh
termux-wake-unlock 2>/dev/null || true
echo -e "\e[1;32m== Kurulum bitti! Ubuntu Köşe uygulamasına dön. ==\e[0m"
