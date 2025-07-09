#!/bin/bash

OS_INFO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
CPU=$(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed -e 's/^[ \t]*//')
RAM=$(free -h | awk '/Mem:/ {print $2 " Total / " $3 " Used"}')
IP=$(curl -s ifconfig.me)
REGION=$(curl -s ipinfo.io/country)
