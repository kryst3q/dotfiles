# Touchpad

To enable tapping and natural scrolling below content must be added to `/etc/X11/xorg.conf.d/30-touchpad.conf`.

```txt
Section "InputClass"
    MatchIsTouchpad "on"
    Identifier "Elan Touchpad"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```
