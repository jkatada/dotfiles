Install
=======

Prepare
--------

```
# [git] set autoCRLF false
git config --global core.autocrlf false
```

Windows 10
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
	# after installing vscode
	mklink /d "%AppData%\Code\User" "c:%HOMEPATH%\dotfiles\vscode"

### for VimFiler (rm.exe, cp.exe, etc...)
    
1. Install Cygwin or Git for Windows.
2. Add path of Cygwin bin directory or Git /usr/bin directory to PATH environment variable.

### for browser-sync
    
1. Install Node.js
2. Install browser-sync

		npm install -g browser-sync

### gvim shortcut

gvim option for shortcut

	-p

gvim option for SentTo shortcut

	-p --remote-tab-silent
 
gvim option for file association shortcut
(change from regedit. key: `HKEY_CLASSES_ROOT/Applications/gvim.exe/shell/open/command`)

	-p --remote-tab-silent "%1"

### Change keyboard mapping

Double click `Windows/Swap_RCtrl_Caps-Win.reg` file and install.


Mac/Ubuntu
---------

(Mac) Install MacVim by Homebrew

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

    # global .gitignore
    cd
    mkdir -p .config/git
    ln -s ~/dotfiles/.config/git/ignore .config/git/ignore

    # after setup vim, make vimproc library
    cd ~/dotfiles/vimfiles/dein/repos/github.com/Shougo/vimproc.vim
    make

### Ubuntu

    # after installing vscode
    rm -rf .config/Code/User
    ln -s ~/dotfiles/vscode .config/Code/User
    ~/dotfiles/vscode/install_extensions.sh


Update
=======

dein.vim
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


dein.vim plugins
-----------------

vim command

    :call dein#update()

vscode extensions list
----------------------

    code --list-extensions > ~/dotfiles/vscode/extensions

