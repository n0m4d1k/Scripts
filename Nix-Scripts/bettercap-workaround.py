#!/usr/bin/env python3
import os

upgrade = 'sudo dpkg -i /home/kali/Documents/scripts/bettercap-workaround/libpcap0.8_1.10.0-2_armel.deb'
downgrade = 'sudo dpkg -i /home/kali/Documents/scripts/bettercap-workaround/libpcap0.8_1.9.1-4_armel.deb'
mode = input("Enable or Disable Bettercap?: ")

if mode.casefold() == 'enable':
    os.system(downgrade)
elif mode.casefold() == 'disable':
    os.system(upgrade)
