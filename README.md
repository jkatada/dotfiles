Install
=======

# git clone
cd
git clone https://github.com/jkatada/dotfiles

# git clone NeoBundle
cd dotfiles
git submodule init
git submodule update

# create .vimrc synbolic link
cd
ln -s dotfiles/.vimrc .vimrc
