if [[ $(tty | grep tty) != "" ]]; then
  # sway
  dbus-launch --exit-with-session sway
fi
