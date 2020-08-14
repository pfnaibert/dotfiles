#!/bin/sh

cat /proc/uptime | awk '{printf ( "TOTAL em secs: %2.2f\n", $1 ) }'
cat /proc/uptime | awk '{printf ( "TOTAL em mins: %2.2f\n", $1/60 ) }'
cat /proc/uptime | awk '{printf ( "TOTAL em horas: %2.2f\n", $1/3600 ) }'

cat /proc/uptime | awk '{printf ( "hora inteira: %2.2f \n", int( $1 / 3600) ) }'
cat /proc/uptime | awk '{printf ( "minuto inteiro: %2.2f \n", int( ( $1 % 3600 )/60 ) ) }'
cat /proc/uptime | awk '{printf ( "segundo inteiro: %2.2f \n", int( $1 % 60 ) ) }'


cat /proc/uptime | awk '{printf ( "TOTAL: %2.0f:%2.0f:%2.0f \n", int( $1 / 3600), int( ( $1 % 3600 )/60 ) , int( $1 % 60 )) }'

cat /proc/uptime | awk '{printf ( "TOTAL: %0.2d:%0.2d:%0.2d \n", int( $1 / 3600), int( ( $1 % 3600 )/60 ) , int( $1 % 60 )) }'

