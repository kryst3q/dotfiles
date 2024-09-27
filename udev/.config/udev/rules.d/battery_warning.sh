#!/bin/sh

# Find all active user sessions
for user in $(who | awk '{print $1}' | sort | uniq); do
    # Find the active DISPLAY for each user (typically :0 or :1)
    DISPLAY=$(who | grep "$user" | awk '{print $5}' | grep -o ':[0-9]\+')

    # Send the notification using su to switch to the user
    if [ -n "$DISPLAY" ]; then
        su -c "DISPLAY=$DISPLAY XAUTHORITY=/home/$user/.Xauthority notify-send --urgency=critical --wait 'Uwaga: niski poziom baterii' 'Podłącz urządzenie do zasilania'" "$user"
    fi
done
