cp -f ~/.config/i3/config ~/.config/i3/config.orig
cp -f i3-config ~/.config/i3/config

mkdir -p ~/.config/dunst
cp -f ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.orig
cp -f dunstrc ~/.config/dunst/dunstrc

cp -f ~/.i3status.conf ~/.i3status.conf.orig
cp -f i3status.conf ~/.i3status.conf

cp -f Xdefaults ~/.Xdefaults

cp -f Xresources ~/.Xresources

cp -f xinitrc ~/.xinitrc

echo Entering sudo...
sudo -i
echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf

exit


