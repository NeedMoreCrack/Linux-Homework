#!/bin/bash

while true; do
    echo "Switch ping, on or off?"
    echo "Enter 'on' to allow ping or 'off' to deny ping:"
    read press

    case $press in
        on)
            echo "=============================="
            echo "         You chose on         "
            echo "     Ping has been allowed    "
            echo "=============================="
            sudo iptables -D INPUT -p icmp --icmp-type echo-request -j DROP
            sudo iptables-save | sudo tee /etc/iptables/rules.v4
            break
            ;;
        off)
            echo "=============================="
            echo "         You chose off        "
            echo "     Ping has been denied     "
            echo "=============================="
            sudo iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
            sudo iptables-save | sudo tee /etc/iptables/rules.v4
            break
            ;;
        *)
            echo "Invalid input. Please enter 'on' or 'off':"
            ;;
    esac
done
