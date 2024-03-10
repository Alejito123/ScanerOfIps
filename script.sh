#!/bin/bash

echo "Ingrese la dirección IP a escanear:"
read ip_address

echo "Seleccione una opción de escaneo:"
echo "1. Escaneo normal"
echo "2. Escaneo silencioso"
echo "3. Escaneo por UDP"
echo "4. Escaneo de versión"
echo "5. Escaneo completo y rápido"
echo "6. Escaneo de vunerabilidades"

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
