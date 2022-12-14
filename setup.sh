#!/bin/sh
# code by xydark
# script auto install
# contact telegram @xydark

# base introduction
# declare color for script

clear

echo -e ""
echo -e "${GREEN}
echo -e "                  ______   _______  _______  _    "
echo -e "( \   / )( \   / )| (  \  )| (   ) || (    )||  \  / /"
echo -e " \ (_) /  \ (_) / | |   ) || (___) || (____)||  (_/ / "
echo -e "  ) _ (    \   /  | |   | ||  ___  ||     __)|   _ (  "
echo -e "( /   \ )   | |   | (__/  )| )   ( || ) \ \__|  /  \ \"
echo -e "|/     \|   \_/   (______/ |/     \||/   \__/|_/    \/"
echo -e "${NC}
echo -e ""
echo -e ""
echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]                 COPYRIGHT BY XYDARK                   [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]                 TELEGRAM : @YRDARK                    [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
echo -e ""

sleep 3


clear

#root check

if [ "${EUID}" -ne 0]; then
  echo -e "[+]=======================================================[+]"
  echo -e "[+]                                                       [+]"
  echo -e "[+]                 please root your vps                  [+]"
  echo -e "[+]                                                       [+]"
  echo -e "[+]=======================================================[+]"
  echo -e ""
  sleep 3
  exit
fi

#perform update

clear
echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]             sedang meng UPDATE & UPGRADE              [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

apt update && apt upgrade -y

clear

#install Required Apps

clear
echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]             INSTALLING REQUIRED APPS bro              [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

apt install curl -y

clear

 apt install jq -y

 clear

# Get Server IP

webIP = $(curl -s ipinfo.io/ip)
# Remove Unused Apps (spam)

echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]             REMOVING UNUSED APPS  ya bro              [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

apt-get -y removed unscd

clear

# installing VPN package

echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]             iki LAGI INSTALL VPN e  ya bro            [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

cd
wget http://kafashop.net/ssh.
chmod +x ssh.sh
./ssh.sh
sleep 3
clear

# installing simple page

echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]       sabar!!iki LAGI INSTALL WEB page e  ya bro      [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

cd
wget http://kafashop.net/webpage.sh
chmod +x webpage.sh
./webpage.sh
sleep 3
clear

# installing webmin

echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]        sabar!!iki LAGI INSTALL WEBMIN APPS  bro       [+]"
echo -e "[+]                                                       [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
sleep 3
clear

cd
wget -0 webmin-current.deb "https://www.dropbox.com/s/pgdt19u7szg2vid/webmin_1.979_all.deb?dl=0"
dpkg -i --force-all webmin-current.deb
apt-get -y -f install
rm -rf /root/webmin-current.deb
sed -i 's/ssl=1/ssl=0/g' etc/webmin/miniserv.conf
sevice webmin restart
sleep 3
clear

# Removing All Installation download file

clear

cd

rm -rf *

clear

cat /dev/null > ~/.bash_history && history -c

echo -e "[+]=======================================================[+]"
echo -e "[+]                    alhamduliilah                      [+]"
echo -e "[+]              akhirnya sukses menginstall              [+]"
echo -e "[+]                   script e XYDARK                     [+]"
echo -e "[+]=======================================================[+]"
echo -e ""
echo -e "Auto script sudah behasil terpasang ya bro!!!"
echo -e "webpage : https://$webIP"
echo -e ""
echo -e "[+]=======================================================[+]"
echo -e "[+]                                                       [+]"
echo -e "[+]      info lebih lanjut chat en aq nang telegram       [+]"
echo -e "[+]                       @xydark                         [+]"
echo -e "[+]=======================================================[+]"
echo -e ""

read -p "Type X or Blank for Reboot or C for cancel:" press

if [[$press == 'X']]; then
  reboot
elif [[$press == 'x']]; then
  reboot
if [[$press == 'C']]; then
  exit 1
if [[$press == 'c']]; then
  exit 1
else
  reboot
fi
