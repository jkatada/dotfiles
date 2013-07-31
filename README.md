Install
=======

Prepare
--------

	# [git] set autoCRLF false
	git config --global core.autocrlf false


Windows XP
----------

	# git clone
	cd %HOMEPATH%
	git clone https://github.com/jkatada/dotfiles
	
	# git clone NeoBundle
	cd dotfiles
	git submodule init
	git submodule update
	
	# create hard link
	cd %HOMEPATH%
	fsutil hardlink create .vimrc dotfiles/.vimrc
	fsutil hardlink create .gvimrc dotfiles/.gvimrc

### gvim shortcut

gvim option for shortcut

	-p --remote-tab-silent FILE

gvim option for SentTo shortcut

	-p --remote-tab-silent
 
gvim option for file association shortcut

	-p --remote-tab-silent "%1"


Linux, Mac, etc
---------------

	# git clone
	cd
	git clone https://github.com/jkatada/dotfiles
	
	# git clone NeoBundle
	cd dotfiles
	git submodule init
	git submodule update
	
	# create synbolic link
	cd
	ln -s dotfiles/.vimrc .vimrc
	ln -s dotfiles/.gvimrc .gvimrc

