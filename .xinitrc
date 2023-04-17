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

# Run i3 Window Manager
i3
