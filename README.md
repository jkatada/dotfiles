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
	
	# create symbolic link (Use command prompt as an administrator)
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


Mac
---

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

	# copy bash setting
	cd ~/dotfiles/Mac
	cp ./.bashrc ./.bash_profile ~/
	source ~/.bash_profile


Update
=======

NeoBundle
----------

### Update and Push

	# move to home directory (Windows: cd %HOMEPATH% )
	cd
	
	cd dotfiles
	git submodule foreach git pull origin master
	
After execution of the above command, execute "git add", "git commit" and "git push".

### Pull and Update (on other repository)

	# move to home directory (Windows: cd %HOMEPATH% )
	cd
	
	cd dotfiles
	git pull
	git submodule update


NeoBundle Plugins
-----------------

vim command

    :NeoBundleUpdate

