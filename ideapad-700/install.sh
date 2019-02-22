echo Installing all packages...

echo "HandleLidSwitch=ignore" >> sudo tee -a /etc/systemd/logind.conf
sudo pacman -S "$( cat pacman-installed )" || exit 1

echo Copying config files..

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

cp -ra screenlayout ~/.screenlayout

cp gitconfig ~/.gitconfig

cp -f i3tree ~/.i3tree
chmod +x ~/.i3tree

cp -f ckermit-ttyUSB0 ~/.ckermit-ttyUSB0

sudo cp disable-lid-wakeup.conf /etc/tmpfiles.d/

echo Done.
echo "Now install oh-my-zsh from https://github.com/robbyrussell/oh-my-zsh/"
echo "and then perform: # cat aliases >> ~/.zshrc"
echo
echo "Additional flags in /etc/default/grub (note: resume is swap partition uuid):"
echo " resume=UUID=b65f29dc-6bd8-46c4-ab9a-a493c5b3f1b2 i915.enable_guc=-1 i915.semaphores=1"
echo "and rebuild grub conf: # sudo grub-mkconfig -o /boot/grub/grub.cfg"
echo
echo "Add the following to /etc/environment when using just window manager:"
echo "NO_AT_BRIDGE=1"
echo
echo "Set keyboard layout with localectl, ie. localectl set-x11-keymap hr"
echo
echo "Check lightdm* configs and apply changes in /etc/lightdm/"
echo
