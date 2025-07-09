#!/bin/bash

# Warna
green='\e[92m'
nc='\e[0m'

# Branding
echo -e "${green}◦•●◉✿ script by xydark ✿◉●•◦${nc}"
echo -e "${green}Telegram @xydark${nc}"
echo

# Cek permission root
if [ "$(id -u)" != "0" ]; then
    echo "❌ Script harus dijalankan sebagai root"
    exit 1
fi

# Update dan install paket dasar
echo -e "${green}>> Update & Install Paket Dasar...${nc}"
apt update -y && apt upgrade -y
apt install -y git curl wget figlet lolcat jq net-tools

# Cek apakah file menu.sh ada
if [[ -f "menu.sh" ]]; then
    chmod +x menu.sh
    cp menu.sh /usr/bin/menu
    chmod +x /usr/bin/menu
    echo -e "${green}>> Menu berhasil dipasang di /usr/bin/menu${nc}"
else
    echo -e "${red}❌ File 'menu.sh' tidak ditemukan di direktori ini.${nc}"
    echo -e "Silakan pastikan file 'menu.sh' ada sebelum menjalankan script ini."
    exit 1
fi

# Simpan versi
echo "1.0.0" > /etc/xydark-version
echo -e "${green}>> Versi disimpan di /etc/xydark-version${nc}"

# Jalankan menu (opsional, uncomment jika mau langsung eksekusi)
# clear
# menu
