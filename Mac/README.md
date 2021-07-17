# Mac

## Change keymap
* Change CapsLock key to command key.

## Configure some OS settings.
  ```
  init.sh
  ```

## Copy shell startup files
* ./zshrc
* ./bashrc
* ./bash_profile

## Install software manually
* homebrew
* sdkman
    * java
    * maven
* vscode (download package from web site)
* Docker desktop for Mac
* ansible
* Google Chrome
    * extensions
        * Octoree
        * Markdown Preview Plus
* Firefox
* Google日本語入力
    * Import `Google日本語入力/keymap.txt` as keymap

## Install packages by homebrew
```
./install_brew_packages.sh
```

## Setup vscode
```
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/dotfiles/vscode  ~/Library/Application\ Support/Code/User
```

Add `code` in PATH.  
Open command palette and input `>Shell Command: Install 'code' command in PATH`

Install vscode extensions.
```
~/dotfiles/vscode/install_extensions.sh
```

## Use Solarized color scheme in Mac OS X terminal
```
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized solarized.git
```
Set solarized as terminal color scheme from terminal preferences.

