# Keyring

To securely store secrets, certificates and passwords use [GNOME/Keyring](https://wiki.archlinux.org/title/GNOME/Keyring) and it's GUI `seahorse`.
The keyring is especially convenient when using Nextcloud Client.
After first login the credentials will be saved in the keyring automatically and will be retrieved on each boot when the client will start.
To achieve such functionality the default keyring must be opened on the login.
To make it happen below two lines must be added to `/etc/pam.d/login` as described [here](https://wiki.archlinux.org/title/GNOME/Keyring#PAM_step).

```txt
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```
