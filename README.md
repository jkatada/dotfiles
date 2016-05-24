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

### for VimFiler (rm.exe, cp.exe, etc...)
    
1. Install Cygwin.
2. Add path of Cygwin bin directory to PATH environment variable.

### gvim shortcut

gvim option for shortcut

	-p

gvim option for SentTo shortcut

	-p --remote-tab-silent
 
gvim option for file association shortcut

	-p --remote-tab-silent "%1"

### Change keyboard mapping

Double click `Windows/Swap_RCtrl_Caps-Win7.reg` file and install.


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
----------

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

