#!/bin/bash

# Check if bluetooth is currently enabled or disabled
if bluetoothctl show | grep -q "Powered: yes"; then
  bluetoothctl power off
else
  bluetoothctl power on
fi

