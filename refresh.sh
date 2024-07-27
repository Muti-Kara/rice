cp bashrc /home/yuio/.bashrc
cp Xresources /home/yuio/.Xresources
cp libinput-gestures.conf /home/yuio/.config
cp -r ./bspwm /home/yuio/.config
cp -r ./sxhkd /home/yuio/.config
cp -r ./polybar /home/yuio/.config
cp -r ./kitty /home/yuio/.config
cp -r ./picom /home/yuio/.config
cp -r ./rofi /home/yuio/.config
cp -r ./dunst /home/yuio/.config


if [ "$EUID" == 0 ]; then
cp etc.X11.xorg.conf.d.30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp etc.ly.config.ini /etc/ly/config.ini
echo "For Ly DM run: systemctl restart ly.service"
fi
