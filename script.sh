#!/bin/bash

echo "Enter the IP address to scan:"
read ip_address

echo "Select a scanning option:"
echo "1. Normal scanning"
echo "2. Silent scanning"
echo "3. UDP scanning"
echo "4. Version scan"
echo "5. Complete and fast scanning"
echo "6. Vulnerability scanning"

read option

case $option in
    1)
        nmap $ip_address
        ;;
    2)
        nmap -sS $ip_address
        ;;
    3)
        nmap -sU $ip_address
        ;;
    4)
        nmap -sV $ip_address
        ;;
    5)
        nmap -T5 -p- -min-rate 5000 $ip_address
        ;;
    6)
        nmap -T5 --script vuln -p- $ip_address
        ;;
    *)
        echo "Opción no válida. Saliendo del script."
        ;;
esac
