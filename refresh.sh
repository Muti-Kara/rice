#!/bin/bash

USER_HOME="/home/yuio"
USER_NAME="yuio"

rm -f "$USER_HOME/.bashrc"
rm -f "$USER_HOME/.Xresources"
rm -f "$USER_HOME/.config/libinput-gestures.conf"

rm -rf "$USER_HOME/.config/bspwm"
rm -rf "$USER_HOME/.config/sxhkd"
rm -rf "$USER_HOME/.config/polybar"
rm -rf "$USER_HOME/.config/kitty"
rm -rf "$USER_HOME/.config/picom"
rm -rf "$USER_HOME/.config/rofi"
rm -rf "$USER_HOME/.config/dunst"
rm -rf "$USER_HOME/.config/btop"
rm -rf "$USER_HOME/.config/nvim"

cp bashrc "$USER_HOME/.bashrc"
cp Xresources "$USER_HOME/.Xresources"
cp libinput-gestures.conf "$USER_HOME/.config/libinput-gestures.conf"

cp -r ./bspwm "$USER_HOME/.config/bspwm"
cp -r ./sxhkd "$USER_HOME/.config/sxhkd"
cp -r ./polybar "$USER_HOME/.config/polybar"
cp -r ./kitty "$USER_HOME/.config/kitty"
cp -r ./picom "$USER_HOME/.config/picom"
cp -r ./rofi "$USER_HOME/.config/rofi"
cp -r ./dunst "$USER_HOME/.config/dunst"
cp -r ./btop "$USER_HOME/.config/btop"
cp -r ./nvim "$USER_HOME/.config/nvim"

chown -R $USER_NAME:$USER_NAME "$USER_HOME/.bashrc"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.Xresources"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/libinput-gestures.conf"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/bspwm"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/sxhkd"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/polybar"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/kitty"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/picom"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/rofi"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/dunst"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/nvim"
chown -R $USER_NAME:$USER_NAME "$USER_HOME/.config/btop"

if [ "$EUID" -eq 0 ]; then
  echo "Script is running as root."
  cp etc.X11.xorg.conf.d.30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
fi

bspc wm -r

echo "Configuration files and directories have been updated."
