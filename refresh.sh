cp bashrc ~/.bashrc
cp -r ./hypr ~/.config
cp -r ./waybar ~/.config
cp -r ./kitty ~/.config
cp -r ./wofi ~/.config


if [ "$EUID" == 0 ]; then
cp etc.ly.config.ini /etc/ly/config.ini
echo "For Ly DM run: systemctl restart ly.service"
fi
