#!/bin/bash
#Welcome to my first bash script more than 10 lines long!

echo "Do you want to install the Mint ISO? (y/n)"
read mintanswer

#vscodium, installed in the big bunch
echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| sudo tee /etc/apt/sources.list.d/vscodium.sources

#the big bunch
apt update && apt upgrade
apt install aria2 ark blender btop curl ffmpeg git gimp inkscape kdeconnect mint-artwork mpv rclone rsync wireguard-tools vnstat uptimed codium qbittorrent thunderbird konsole okular obs-studio -y

#onlyoffice
aria2c https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
dpkg -i onlyoffice-desktopeditors_amd64.deb

#brave
curl -fsS https://dl.brave.com/install.sh | sh


if [ "$mintanswer" = "y" ] || [ "$mintanswer" = "Y" ]; then
    aria2c https://mirror.koddos.net/linuxmint/iso/stable/22.3/linuxmint-22.3-cinnamon-64bit.iso
fi
