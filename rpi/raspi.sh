#/usr/bin/bash

# Install via
# curl -fsSL https://github.com/kiteloopdesign/dotfiles/rpi/raspi.sh

sudo apt update  -y
sudo apt upgrade -y

git clone --depth=1 https://github.com/kiteloopdesign/dotfiles/rpi/raspi.sh
cd dotfiles

if [ $? -eq 0 ]; then
  echo "dotfiles cloned"
else
  echo "Could not find dotfiles directory"
	exit 5
fi


# sudo apt install   -y

cd shell/

ln -s alias.bash ~/.alias
ln -s bashrc     ~/.bashrc
ln -s inputrc    ~/.inputrc

