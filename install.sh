#!/bin/bash

yay -S bspwm picom polybar dunst feh sxhkd \
       otf-font-awesome xcursor-breeze \
       clipmenu lightdm lightdm-slick-greeter \
       lxappearance xorg-xinput bluez bluez-utils \
       networkmanager brightnessctl libinput-gestures \
       kitty neovim rofi ranger maim seahorse

sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
systemctl enable --user clipmenud.service

sudo gpasswd -a $USER input

echo "Setup complete. Please restart your system."

