echo Installing all packages...

echo Entering sudo...
sudo -i
  echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf
  pacman -Sy
  pacman -S $( cat pacman-installed )

exit

echo Copying config files..

cp -f ~/.config/i3/config ~/.config/i3/config.orig
cp -f i3-config ~/.config/i3/config

mkdir -p ~/.config/dunst
cp -f ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.orig
cp -f dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/i3status
cp -f i3status-config ~/.config/i3status/config

cp -f Xdefaults ~/.Xdefaults

cp -f Xresources ~/.Xresources

cp -f xinitrc ~/.xinitrc

cp -ra screenlayout ~/.screenlayout

cp gitconfig ~/.gitconfig

echo Done.

