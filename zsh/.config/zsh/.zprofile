if [ $(uname) = "Linux" ] && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec bluetoothctl power off
	exec ssh-agent startx
fi
