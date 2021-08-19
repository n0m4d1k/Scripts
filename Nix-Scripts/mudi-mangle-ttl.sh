#!/bin/sh

# Script to mangle TTL on Mudi router.
# Run on initial setup or after update.

# Appends rule to firewall.user file for persistance after power cycles.
echo 'iptables -t mangle -I POSTROUTING 1 -j TTL --ttl-set 66' >> /etc/firewall.user

# Applys rule to router.
iptables -t mangle -I POSTROUTING 1 -j TTL --ttl-set 66