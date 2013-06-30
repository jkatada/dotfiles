Install
=======

Linux, Mac, etc
---------------

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


Windows XP
----------

 # git clone
 cd
 git clone https://github.com/jkatada/dotfiles
 
 # git clone NeoBundle
 cd dotfiles
 git submodule init
 git submodule update

 # create .vimrc hard link
 cd %HOMEPATH%
 fsutil hardlink create .vimrc dotfiles/.vimrc

