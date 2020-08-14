#!/bin/bash
#my_battery.sh

acpi | awk '{printf( "BAT:%s\n", $4 ) }'
