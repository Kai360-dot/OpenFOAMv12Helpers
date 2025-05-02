#!/bin/bash
PRESSURE_FILE="postProcessing/pressureSensor/0/p"
TEMPERATURE_FILE="postProcessing/temperatureSensor/0/T"
awk 'NR==FNR {a[$1]=$2; next} $1 in a {print $1, a[$1], $2}' "$PRESSURE_FILE" "$TEMPERATURE_FILE" > pT.txt
