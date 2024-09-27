# Keyboard

## National characters

To have polish characters by pressing AltGr+<a,e,o,l,z,x,c,n> proper keyboard layout must be set as described [here](https://wiki.archlinux.org/title/Xorg/Keyboard_configuration).
It can be achieved by executing below command

```sh
sudo localectl set-x11-keymap pl
```

or putting below content in `/etc/X11/xorg.conf.d/00-keyboard.conf`

```txt
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "pl"
EndSection
```
