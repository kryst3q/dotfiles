# Import env variables required to proper work of apps in graphical session
dbus-update-activation-environment --all

# Connect to keyring
gnome-keyring-daemon --start --components=secrets,pkcs11,ssh

# Run notification system
dunst &

# Run network manager applet
nm-applet &

# Run blueman applet
blueman-applet &

# Run USB auto-mounting daemon
udiskie &

# Run print screen application
flameshot &

# Run Nextcloud client
nextcloud &

# Run screen locker on suspend, hibernate, lock-session, and unlock-session
xss-lock -- i3lock-fancy -n &

# Restore previous session background
~/.fehbg &

# Run xsettings daemon to be able to change system theme depending on time of day
xfsettingsd --daemon

# Run clipmenu deamon. NOTE: it already comes with systemd service unit. Remember when move everything to this solution.
clipmenud &

# Run i3 Window Manager
i3
