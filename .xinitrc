# Import env variables required to proper work of apps in graphical session
dbus-update-activation-environment --all

# Connect to keyring
gnome-keyring-daemon --start --components=secrets,pkcs11,ssh

# Run USB auto-mounting daemon
udiskie &

# Run print screen application
flameshot &

# Run Nextcloud client
nextcloud &

# Run i3 Window Manager
i3
