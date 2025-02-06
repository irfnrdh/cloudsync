# cloudsync
Based RClone for Linux


## Setup

```
sudo pacman -S rclone fuse zenity xclip xdg-utils
yay -S rclone-browser  # Optional GUI
rclone config
mkdir -p ~/Cloud/gdrive{1,2,3}
```


```
chmod +x mount_manager.sh
systemctl --user enable rclone@gdrive1.service
```

### Debug

```
journalctl --user-unit rclone@gdrive1.service  # Cek log service
lsblk  # Cek mount points
rclone ls gdrive1:  # Test koneksi
```