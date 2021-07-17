# dotfiles

## How to install

### Prepare
Install git.

Set autoCRLF false.
```
git config --global core.autocrlf false
```

### Windows 10
Clone dotfiles.
```
cd %HOMEPATH%
git clone https://github.com/jkatada/dotfiles
```

Clone dein.vim.
```
cd dotfiles
git submodule init
git submodule update
```

Create symbolic link (Use command prompt as an administrator)
```
cd %HOMEPATH%
mklink ".vimrc" "dotfiles\.vimrc"
mklink ".gvimrc" "dotfiles\.gvimrc"
mkdir .config\git
mklink ".config\git\ignore" "..\..\dotfiles\.config\git\ignore"
```

Refer to [Windows directory](./Windows).

### Mac/Ubuntu

Clone dotfiles.
```
cd
git clone https://github.com/jkatada/dotfiles
```

Clone dein.vim.
```
cd dotfiles
git submodule init
git submodule update
```

Create synbolic link.
```
cd
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
mkdir -p .config/git
ln -s ~/dotfiles/.config/git/ignore .config/git/ignore
```

Refer to [Mac directory](./Mac) or [Ubuntu directory](./Ubuntu).

## Update

### dein.vim

#### Update and Push
Execute the following command. (For Windows use Git Bash)
```
cd ~/dotfiles
git submodule foreach git pull origin master
```

After execution of the above command, execute "git add", "git commit" and "git push".

### Pull and Update (on other repository)
Execute the following command. (For Windows use Git Bash)
```
cd ~/dotfiles
git pull
git submodule update
```


### dein.vim plugins
Execute the following command on vim.
```
:call dein#update()
```

### vscode extensions list
Execute the following command. (For Windows use Git Bash)
```
code --list-extensions > ~/dotfiles/vscode/extensions
```


