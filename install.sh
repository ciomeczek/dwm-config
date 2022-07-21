#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo pacman -Syu --noconfirm noto-fonts feh zsh dunst pulseaudio pulseaudio-alsa xbindkeys neofetch picom
chsh -s /bin/zsh

REPO_PATH=$(pwd)

cd $REPO_PATH/dwm
sudo make install

cd $REPO_PATH/st
sudo make install

cd $REPO_PATH/dmenu
sudo make install

cd $HOME
mkdir -p Repositories Aur Pictures Downloads Videos Documents Desktop

cp -rf $REPO_PATH/Pictures/lain.jpg -r $HOME/Pictures/
cp -rf $REPO_PATH/.oh-my-zsh $REPO_PATH/.xbindkeysrc $REPO_PATH/.zshrc $REPO_PATH/.config $REPO_PATH/.xprofile $REPO_PATH/.local -r $HOME

echo "Reboot? y/n"
read yn

if [$yn == "y"]
then
	reboot
fi
