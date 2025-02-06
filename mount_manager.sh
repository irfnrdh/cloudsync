#!/bin/bash

REMOTES=("gdrive1" "gdrive2" "gdrive3")
PATHS=("$HOME/Cloud/gdrive1" "$HOME/Cloud/gdrive2" "$HOME/Cloud/gdrive3")

ACTION=$(zenity --list --title="Rclone Manager" --column="Action" "Mount" "Unmount" --height=150)

REMOTE_CHOICE=$(zenity --list --title="Pilih Akun" --column="Remote" "${REMOTES[@]}")

for i in "${!REMOTES[@]}"; do
  if [[ "${REMOTES[$i]}" == "$REMOTE_CHOICE" ]]; then
    SELECTED_REMOTE=${REMOTES[$i]}
    SELECTED_PATH=${PATHS[$i]}
  fi
done

case $ACTION in
  "Mount")
    rclone mount --vfs-cache-mode writes --daemon $SELECTED_REMOTE: $SELECTED_PATH
    notify-send "Rclone" "$SELECTED_REMOTE mounted successfully!"
    ;;
  "Unmount")
    fusermount -uz $SELECTED_PATH
    notify-send "Rclone" "$SELECTED_REMOTE unmounted!"
    ;;
esac
