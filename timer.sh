#!/bin/bash
# This script calculates the fraction of time simulated towards 
# the completion of the simulation (endTime)
# Please ensure this file is located in the top level of the case directory
# Author: Kai Ruth

. $WM_PROJECT_DIR/bin/tools/RunFunctions
APP=$(getApplication)
endT=$(grep '^endTime' system/controlDict) # ^: line must start with endTime
endT=$(echo $endT | awk '{gsub(";", "", $2); print $2}')
time=$(grep "Time =" log.${APP} | tail -n 1 | awk '{print $3}' | sed 's/s//' )
frac=$(printf "%.2f" $(echo "$time / $endT" | bc -l ))
echo FractionOfTime: $frac
clockT=$(grep "ClockTime =" log.${APP} | tail -n 1 | awk '{print $7 }' | sed 's/s//' )
fullT=$(printf "%.2f" $(echo "$clockT / ($frac * 3600)" | bc -l ))
echo fullTimeEst. $fullT
