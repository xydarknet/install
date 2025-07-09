#!/bin/bash

# Warna
green='\e[92m'
nc='\e[0m'

echo -e "${green}◦•●◉✿script by xydark✿◉●•◦${nc}"
echo -e "${green}Telegram @xydark${nc}"
echo

# Cek permission root
[ "$(id -u)" != "0" ] && { echo "Script harus dijalankan sebagai root"; exit 1; }

# Update dan install paket dasar
apt update -y && apt upgrade -y
apt install git -y
apt install -y curl wget figlet lolcat jq net-tools

# Copy file menu
chmod +x menu.sh
cp menu.sh /usr/bin/menu
chmod +x /usr/bin/menu

# Simpan info versi
echo "1.2.5" > /etc/xydark-version

# Jalankan menu
clear
menu
