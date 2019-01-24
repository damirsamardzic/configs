echo Installing all packages...

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

cp -f vimrc ~/.vimrc

cp gitconfig ~/.gitconfig

cp -f ckermit-ttyUSB0 ~/.ckermit-ttyUSB0


echo Done.
echo "Now install oh-my-zsh from https://github.com/robbyrussell/oh-my-zsh/"
echo "and then perform: # cat aliases >> ~/.zshrc"
echo

