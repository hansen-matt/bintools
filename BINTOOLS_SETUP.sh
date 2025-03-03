#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Making symlink to bintools"
rm ~/bin
ln -s $SCRIPTPATH ~/bin

echo "Making symlink to bashrc"
rm ~/.bashrc
ln -s $SCRIPTPATH/.bashrc ~/.bashrc
source ~/.bashrc

echo "Making symlink to vimrc"
rm ~/.vimrc
ln -s $SCRIPTPATH/.vimrc ~/.vimrc

echo "Configuring git"
git config --global user.name "Matt Hansen"
echo "Enter email address for git"
read email
git config --global user.email $email
