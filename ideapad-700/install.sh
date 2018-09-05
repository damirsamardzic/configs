echo Installing all packages...

echo "HandleLidSwitch=ignore" >> sudo tee -a /etc/systemd/logind.conf
sudo pacman -S "$( cat pacman-installed )" || exit 1

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

cp -ra screenlayout ~/.screenlayout

cp gitconfig ~/.gitconfig

cp -f i3tree ~/.i3tree
chmod +x ~/.i3tree

sudo cp disable-lid-wakeup.conf /etc/tmpfiles.d/

echo Done.
echo "Now install oh-my-zsh from https://github.com/robbyrussell/oh-my-zsh/"
echo "and then perform: # cat aliases >> ~/.zshrc"
echo
echo "Additional flags in /etc/default/grub (note: resume is swap partition uuid):"
echo " resume=UUID=b65f29dc-6bd8-46c4-ab9a-a493c5b3f1b2 i915.enable_guc=-1 i915.semaphores=1"
echo "and rebuild grub conf: # sudo grub-mkconfig -o /boot/grub/grub.cfg"
echo

