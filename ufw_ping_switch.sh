#!/bin/bash

while true; do
    echo "Switch ping (ICMP) on or off?"
    echo "Enter 'on' to allow ping or 'off' to deny ping:"
    read press
    case $press in
        on)
            echo "=============================="
            echo "         You chose ON         "
            echo "=============================="
            iptables -D INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null
            iptables -I INPUT -p icmp --icmp-type echo-request -j ACCEPT
            if [ $? -eq 0 ]; then
                echo "Ping has been allowed."
            else
                echo "Failed to allow ping. Please check iptables for more details."
            fi
            break
            ;;
        off)
            echo "=============================="
            echo "         You chose OFF        "
            echo "=============================="
            iptables -D INPUT -p icmp --icmp-type echo-request -j ACCEPT 2>/dev/null
            iptables -I INPUT -p icmp --icmp-type echo-request -j DROP
            if [ $? -eq 0 ]; then
                echo "Ping has been denied."
            else
                echo "Failed to deny ping. Please check iptables for more details."
            fi
            break
            ;;
        *)
            echo "Invalid input. Please enter 'on' or 'off':"
            ;;
    esac
done
