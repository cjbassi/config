rm -f arch3.sh

mkdir Downloads

sudo pip install glances

git clone https://github.com/cjbassi/config
bash config/installation/config_files.sh
bash config/installation/pacaur.sh

pacaur -y\
discord\
gitflow-avh\
gitflow-zshcompletion-avh\
google-chrome\
i3lock-color-git\
neofetch\
polybar\
unclutter-xfixes-git\
universal-ctags-git

echo "
###########################################
# 1) :PlugInstall
# 2) edit /boot/loader/entries/arch.conf
# 3) systemctl enable ...
###########################################"

# clone urxvt-vim-scrollback
# install vim mardown preview

#i3-gaps
#zsh-fast-syntax-highlighting
#gitflow-avh vs gitflow-avh-git
