#!/bin/bash
# setup.sh - Autoscript Installer by xydark

clear
echo -e "\e[92mStarting Auto Setup Tunnel Script...\e[0m"

# Cek akses root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[91mScript ini harus dijalankan sebagai root!\e[0m"
    exit 1
fi

# Detect OS
source /etc/os-release
OS=$ID
VERSION_ID=$VERSION_ID

# Update & Install Dependency
echo -e "\e[93mUpdating system & installing dependencies...\e[0m"
apt update -y && apt upgrade -y
apt install -y curl wget gnupg lsb-release net-tools socat \
    cron screen unzip git nginx dropbear stunnel4 openvpn \
    python3 python3-pip qrencode figlet lolcat lolcat toilet jq

# Install Xray-core
echo -e "\e[92mInstalling Xray-core...\e[0m"
wget -O /usr/bin/xray https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip Xray-linux-64.zip -d /usr/bin/xray
chmod +x /usr/bin/xray/xray

# Install Telegram Python dependencies
echo -e "\e[92mInstalling Python Bot requirements...\e[0m"
pip3 install requests telethon pytelegrambotapi

# Copy semua script ke /usr/bin/
echo -e "\e[92mCopying scripts to /usr/bin/...\e[0m"
chmod +x add* del* renew* cek* menu*
cp add* del* renew* cek* menu* /usr/bin/

# Copy menu bot Telegram jika ada
if [ -f "bot/telegram-bot.py" ]; then
    cp bot/telegram-bot.py /usr/bin/telegram-bot.py
    chmod +x /usr/bin/telegram-bot.py
fi

# Buat menu utama bisa diakses dari command 'menu'
echo -e "\e[92mCreating command 'menu'...\e[0m"
ln -sf /usr/bin/menu /usr/local/bin/menu

# Setup Cron: Restart layanan setiap 30 menit
echo "*/30 * * * * root service ssh restart; service dropbear restart; service stunnel4 restart; systemctl restart xray" > /etc/cron.d/autorestart

# Setup autorun Telegram Bot (jika diaktifkan)
if [ -f /usr/bin/telegram-bot.py ]; then
    cat > /etc/systemd/system/telegrambot.service <<EOF
[Unit]
Description=Telegram Bot Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /usr/bin/telegram-bot.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
    systemctl daemon-reexec
    systemctl enable telegrambot
    systemctl start telegrambot
    echo -e "\e[92mTelegram Bot service installed and started.\e[0m"
fi

# Finish
echo -e "\e[92mSetup selesai! Jalankan perintah \e[93mmenu\e[0m untuk mulai.\e[0m"
