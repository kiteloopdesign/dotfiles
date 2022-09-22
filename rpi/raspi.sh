#/usr/bin/bash

# Install via
# curl -fsSL https://raw.githubusercontent.com/kiteloopdesign/dotfiles/master/rpi/raspi.sh | bash

sudo apt update  -y
sudo apt upgrade -y

#########################################
# dotfiles
#########################################
# Can't use this clone until we create and install keys!
# TODO: so you may want to do that at the very beginning ...
# It all depends whether you plan to commit stuff to it or not (cloning via
# http allows to download the repo but later can't commit to it, as I 
# have disabled non-ssh login)
# git clone --depth=1 ssh://git@github.com/kiteloopdesign/dotfiles

git clone --depth=1 https://github.com/kiteloopdesign/dotfiles

if [ -d dotfiles ]; then
  echo "dotfiles cloned"
else
  echo "Could not find dotfiles directory"
	exit 5
fi

if [ -d .alias ]; then
  echo "[W*]: .alias found, backing it up"
  mv .alias  alias.back
fi

if [ -d .bashrc ]; then
  echo "[W*]: .bashrc found, backing it up"
  mv .bashrc  bashrc.back
fi

if [ -d .profile ]; then
  echo "[W*]: .profile found, backing it up"
  mv .profile profile.back
fi

if [ -d .gitconfig ]; then
  echo "[W*]: .gitconfig found, backing it up"
  mv .gitconfig gitconfig.back
fi

# TODO : install stuff ...
# sudo apt install   -y

ln -s ./dotfiles/shell/alias.bash ~/.alias
ln -s ./dotfiles/shell/bashrc     ~/.bashrc
ln -s ./dotfiles/shell/inputrc    ~/.inputrc
ln -s ./dotfiles/git/gitconfig    ~/.gitconfig

#########################################
# Vi
#########################################

# TODO
# update-alternatives --display vim
# update-alternatives --config  vim

# Default version on Raspberry is a basic vi. See it with:
# readlink -f $( which vi )

sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime

if [ -d .vim ]; then
  echo "ERROR .vim already exists"
	exit 5
else
mkdir -p .vim
  echo "Created .vim folder"
fi

mkdir -p .vim/bundle
mkdir -p .vim/undo


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installs vim plugins from CLI !
\vim +PluginInstall +qall

#########################################
# Create SSH key and send it over to github
#########################################
# Lets first install git cli so all the clone operations are done via ssh and not https
# We want cli so we can automatically copy the public key into the github repo
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
| sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# TODO: cehck for existing keys
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys
# Assuming we DO NOT have them ...
# ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-keygen -t ed25519

# Add the key do the agent
ssh-add ~/.ssh/id_ed25519

# Run gh auth login to authenticate with your GitHub account
# USE the "Login with a web browser" option when asked for it

# Note the "\" as gh may be aliased alraedy to "git history"
# TODO: maybe use "hub" as name for "gh" tool? ("hub" is the unofficial git cli tool)
\gh auth login
