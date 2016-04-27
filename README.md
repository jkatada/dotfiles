Install
=======

Prepare
--------

	# [git] set autoCRLF false
	git config --global core.autocrlf false

Windows 7
----------

	# clone dotfiles
	cd %HOMEPATH%
	git clone https://github.com/jkatada/dotfiles
	
	# clone NeoBundle
	cd dotfiles
	git submodule init
	git submodule update
	
	# create symbolic link
	# command prompt as an Administrator
	cd %HOMEPATH%
	mklink ".vimrc" "dotfiles\.vimrc"
	mklink ".gvimrc" "dotfiles\.gvimrc"


Windows XP
----------

	# clone dotfiles
	cd %HOMEPATH%
	git clone https://github.com/jkatada/dotfiles
	
	# clone NeoBundle
	cd dotfiles
	git submodule init
	git submodule update
	
	# create hard link
	cd %HOMEPATH%
	fsutil hardlink create .vimrc dotfiles/.vimrc
	fsutil hardlink create .gvimrc dotfiles/.gvimrc

### gvim shortcut

gvim option for shortcut

	-p

gvim option for SentTo shortcut

	-p --remote-tab-silent
 
gvim option for file association shortcut

	-p --remote-tab-silent "%1"


Linux, Mac, etc
---------------

	# clone dotfiles
	cd
	git clone https://github.com/jkatada/dotfiles
	
	# clone NeoBundle
	cd dotfiles
	git submodule init
	git submodule update
	
	# create synbolic link
	cd
	ln -s dotfiles/.vimrc .vimrc
	ln -s dotfiles/.gvimrc .gvimrc

Update
=======

NeoBundle
<<<<<<< HEAD
---------
=======
----------
>>>>>>> 3fc7c994d7986caf2801150adafd1b5949e5058d

### Windows

	cd %HOMEPATH%
	cd dotfiles
	git submodule foreach git pull origin master

### Linux, Mac, etc

	cd
	cd dotfiles
	git submodule foreach git pull origin master


NeoBundle Plugins
-----------------

vim command

    :NeoBundleUpdate

