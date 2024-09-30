#!/bin/bash

while true; do
    echo "Switch ping (ICMP) on or off?"
    echo "Enter 'on' to allow ping or 'off' to deny ping:"
    read press
    case $press in
        on)
            echo "=============================="
            echo "         You chose ON         "
            echo "     Ping has been allowed    "
            echo "=============================="
            iptables -D INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null
            iptables -I INPUT -p icmp --icmp-type echo-request -j ACCEPT
            break
            ;;
        off)
            echo "=============================="
            echo "         You chose OFF        "
            echo "     Ping has been denied     "
            echo "=============================="
            iptables -D INPUT -p icmp --icmp-type echo-request -j ACCEPT 2>/dev/null
            iptables -I INPUT -p icmp --icmp-type echo-request -j DROP
            break
            ;;
        *)
            echo "Invalid input. Please enter 'on' or 'off':"
            ;;
    esac
done
