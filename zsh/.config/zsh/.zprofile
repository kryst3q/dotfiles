if [ $(uname) = "Linux" ] && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec ssh-agent startx
fi
