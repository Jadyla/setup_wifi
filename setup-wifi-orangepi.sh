#!/bin/bash
# This script was made for usb-wifi module.
# To setup wifi you need to pass as argument the SSID and PASSWORD.
# Example: ./setup-wifi-orangepi.sh mySSID myPassword
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=
# FIRST RUN
# When you run the script for the first time, the board will reboot to
# reconize the usb-wifi driver.
# After reboot, you need to run the script again.
sudo apt-get install build-essential git dkms linux-headers-current-sunxi
git clone --depth=1 https://github.com/kelebek333/rtl8188fu
apt-get install dkms
sudo dkms install ./rtl8188fu
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
device=`ifconfig | grep wlx | cut -c 1-15`
if [ -z $device ]
then
    reboot
else
    echo "CONNECTING to wifi: '$1' password '$2' ifname $device"
    sudo nmcli device wifi list
    sudo nmcli device wifi connect "$1" password "$2" ifname $device
fi
