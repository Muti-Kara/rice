#!/bin/bash

yay -S bspwm picom polybar dunst feh sxhkd \
       otf-font-awesome xcursor-breeze polkit-gnome \
       clipmenu brave-bin libinput-gestures \
       lxappearance xorg-xinput bluez tree breeze \
       networkmanager brightnessctl bluez-utils \
       kitty neovim rofi ranger maim seahorse \
       ripgrep unzip npm xorg-xinit btop powertop \
       sddm sddm-conf-git sddm-theme-sugar-candy-git \
       visual-studio-code-bin localepurge

sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service

sudo gpasswd -a $USER input

echo "Setup complete. Please restart your system."
