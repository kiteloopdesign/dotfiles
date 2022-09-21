#/usr/bin/bash

# Install via
# curl -fsSL https://raw.githubusercontent.com/kiteloopdesign/dotfiles/master/rpi/raspi.sh | bash

sudo apt update  -y
sudo apt upgrade -y

git clone --depth=1 https://github.com/kiteloopdesign/dotfiles

if [ -d dotfiles ]; then
  echo "dotfiles cloned"
else
  echo "Could not find dotfiles directory"
	exit 5
fi


if [ -d .alias ]; then
  mv .alias  alias.back
fi

if [ -d .bashrc ]; then
  mv .bashrc  bashrc.back
fi

if [ -d .profile ]; then
  mv .profile profile.back
fi

# TODO : install stuff ...
# sudo apt install   -y

ln -s ./dotfiles/shell/alias.bash ~/.alias
ln -s ./dotfiles/shell/bashrc     ~/.bashrc
ln -s ./dotfiles/shell/inputrc    ~/.inputrc

