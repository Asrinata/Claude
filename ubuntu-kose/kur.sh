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
  plank sudo nano wget ca-certificates gpg pulseaudio-utils x11-xserver-utils onboard xvkbd yad
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
# klavye-tus: ekran klavyesini aç/kapat. Onboard açılmazsa daha basit olan xvkbd'ye düşer.
cat > /usr/local/bin/klavye-tus <<'KT'
#!/bin/bash
if pgrep -x onboard >/dev/null; then
  dbus-send --type=method_call --dest=org.onboard.Onboard /org/onboard/Onboard/Keyboard \
    org.onboard.Onboard.Keyboard.ToggleVisible || pkill -x onboard
elif pgrep -x xvkbd >/dev/null; then
  pkill -x xvkbd
else
  onboard >/tmp/onboard.log 2>&1 &
  sleep 4
  pgrep -x onboard >/dev/null || xvkbd -compact >/dev/null 2>&1 &
fi
KT
# kose-gec xfce|raspi: bu masaüstünü kapatır, Termux tarafındaki döngü seçilen sistemi açar
cat > /usr/local/bin/kose-gec <<'KG'
#!/bin/bash
echo "$1" > /tmp/kose-gecis
pkill -x xfce4-session; pkill -x lxsession; true
KG
# kose-tepsi: sağ üstteki tepside klavye simgesi. Dokun: klavye. Uzun bas / sağ tık: sistem değiştir.
cat > /usr/local/bin/kose-tepsi <<'KY'
#!/bin/bash
pkill -f 'yad --notification' 2>/dev/null
exec yad --notification --image=onboard --text="Klavye (uzun bas: sistem değiştir)" \
  --command=klavye-tus \
  --menu="Klavye!klavye-tus|Ubuntu XFCE başlat!kose-gec xfce|Raspberry Pi OS başlat!kose-gec raspi"
KY
chmod +x /usr/local/bin/klavye-tus /usr/local/bin/kose-gec /usr/local/bin/kose-tepsi
mkdir -p /root/.config/autostart
printf '[Desktop Entry]\nType=Application\nName=Klavye tuşu\nExec=kose-tepsi\n' > /root/.config/autostart/kose-tepsi.desktop
# Menüde de dursunlar
yaz() { printf '[Desktop Entry]\nType=Application\nName=%s\nExec=%s\nIcon=%s\nCategories=System;Utility;\n' "$2" "$3" "$4" > /usr/share/applications/$1.desktop; }
yaz kose-klavye "Ekran Klavyesi" klavye-tus onboard
yaz kose-xfce "Ubuntu XFCE'ye geç" "kose-gec xfce" system-reboot
yaz kose-raspi "Raspberry Pi OS'a geç" "kose-gec raspi" system-reboot
OR
icine /root/ortak.sh < ~/.kose-ortak.sh
proot-distro login ubuntu -- bash /root/ortak.sh

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
# Onboard ekranın altına yapışık açılsın, kendi yüzen simgesi çıkmasın
gsettings set org.onboard.window docking-enabled true 2>/dev/null
gsettings set org.onboard.icon-palette in-use false 2>/dev/null
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
( sleep 3; timeout 20 termux-x11-preference forceOrientation:landscape fullscreen:true \
    displayResolutionMode:scaled displayScale:150 hideCutout:true additionalKbdVisible:false \
    >/dev/null 2>&1 ) &
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
while true; do
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
  sudo nano wget ca-certificates gpg pulseaudio-utils x11-xserver-utils onboard xvkbd yad || exit 1
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
export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1 XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR
cat > /tmp/raspi-ayar.sh <<'RA'
sleep 6
img=$(ls /usr/share/rpd-wallpaper/*.jpg /usr/share/rpd-wallpaper/*.png 2>/dev/null | head -1)
[ -n "$img" ] && pcmanfm --set-wallpaper="$img" --wallpaper-mode=crop
gsettings set org.onboard.window docking-enabled true 2>/dev/null
gsettings set org.onboard.icon-palette in-use false 2>/dev/null
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
