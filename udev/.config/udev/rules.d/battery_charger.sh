#!/bin/sh

COMMAND='dunstctl close all -p "niski poziom baterii"'

# Find all active user sessions
for user in $(who | awk '{print $1}' | sort | uniq); do
    # Find the active DISPLAY for each user (typically :0, :1, etc.)
    DISPLAY=$(who | grep "$user" | awk '{print $5}' | grep -o ':[0-9]\+')

    # Check if a DISPLAY was found for the user
    if [ -n "$DISPLAY" ]; then
        # Execute the command in the user's session by using su and XAUTHORITY
        su -c "DISPLAY=$DISPLAY XAUTHORITY=/home/$user/.Xauthority $COMMAND" "$user"
    fi
done
