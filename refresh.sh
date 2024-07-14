cp bashrc ~/.bashrc
cp Xresources ~/.Xresources
cp libinput-gestures.conf ~/.config
cp -r ./bspwm ~/.config
cp -r ./sxhkd ~/.config
cp -r ./polybar ~/.config
cp -r ./kitty ~/.config
cp -r ./picom ~/.config


if [ "$EUID" == 0 ]; then
cp etc.X11.xorg.conf.d.30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp etc.ly.config.ini /etc/ly/config.ini
echo "For Ly DM run: systemctl restart ly.service"
fi
