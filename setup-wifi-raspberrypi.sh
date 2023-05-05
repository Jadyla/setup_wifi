#!/bin/bash
# To setup wifi you need to pass as argument the SSID and PASSWORD.
# Example: ./setup-wifi-raspberrypi.sh mySSID myPassword
echo "CONNECTING to wifi: '$1' password '$2' ifname wlan0"
nmcli device wifi list
nmcli device wifi connect "$1" password "$2" ifname wlan0
