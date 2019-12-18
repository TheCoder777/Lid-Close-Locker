# Lid-Close-Locker

This simple script locks the screen with physlock (you can change that) when the laptop lid is closed!


For the script to work you need to install and enable the acpid service.

Example on Arch Linux (with systemd).
```bash
$ pacman -S acpid
$ systemctl enable --now acpid.service
```

