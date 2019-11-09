echo Installing all packages...

echo "HandleLidSwitch=ignore" >> sudo tee -a /etc/systemd/logind.conf
sudo pacman -S --needed "$( cat pacman-installed )" || exit 1

echo Copying config files..

mkdir -p ~/.config/i3
cp -f ~/.config/i3/config ~/.config/i3/config.orig
cp -f i3-config ~/.config/i3/config
cp -f pavolume ~/.config/i3/
cp -f brightness ~/.config/i3/

mkdir -p ~/.config/dunst
cp -f ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.orig
cp -f dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/i3status
cp -f i3status-config ~/.config/i3status/config
cp -f i3status.sh ~/.config/i3status/
chmod +x ~/.config/i3status/i3status.sh

mkdir -p ~/.config/termite
cp -f termite-config ~/.config/termite/config

cp -f Xresources ~/.Xresources
ln -sf ~/.Xresources ~/.Xdefaults

cp -f xinitrc ~/.xinitrc
cp -f xprofile ~/.xprofile

cp -f vimrc ~/.vimrc

mkdir -p ~/.screenlayout
cp -f screenlayout/* ~/.screenlayout/

cp gitconfig ~/.gitconfig

cp -f i3tree ~/.i3tree
chmod +x ~/.i3tree

cp -f ckermit-ttyUSB0 ~/.ckermit-ttyUSB0
cp -f ckermit-command ~/.ckermit-command
sudo cp ckermit-usb /usr/local/bin/

sudo cp disable-lid-wakeup.conf /etc/tmpfiles.d/

cp -f compton.conf ~/.config/

echo Done.
echo "Now install oh-my-zsh from https://github.com/robbyrussell/oh-my-zsh/"
echo "and then perform: # cat aliases >> ~/.zshrc"
echo
echo "Additional flags in /boot/loader/entries/Arch.conf (note: resume is swap partition uuid):"
echo " resume=UUID=b65f29dc-6bd8-46c4-ab9a-a493c5b3f1b2"
echo
echo "Add the following to /etc/environment when using just window manager:"
echo "NO_AT_BRIDGE=1"
echo
echo "Optionally add TERMINAL=termite to /etc/environment or other term if needed"
echo
echo "Set keyboard layout with localectl, ie. localectl set-x11-keymap hr"
echo
echo "Check lightdm* configs and apply changes in /etc/lightdm/"
echo
