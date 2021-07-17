# Ubuntu

## Change keymap
* TODO

## Configure some OS settings.
* TODO

## Copy shell startup files
* TODO

## Install software manually
* sdkman
    * maven
* vscode (download package from web site)
* Docker (Install using the repository)
* vagrant
* ansible
* Google Chrome
    * extensions
        * smartUp Gestures
            * import `~/dotfiles/settings/chrome/smartup_gestures/smartup.config`
        * Octoree
        * Markdown Preview Plus
* Firefox
    * extensions
        * Gesturefy
            * import `~/dotfiles/settings/firefox/Gesturefy.json`
* Remmina
* LibreOffice

## Install packages by apt
```
./install_apt_packages.sh
```

## Setup Mozc keymap
* TODO

## Install xkeysnail
* TODO

## Install xrdp
* TODO

## Setup vscode
```
rm -rf .config/Code/User
ln -s ~/dotfiles/vscode .config/Code/User
```

Install vscode extensions.
```
~/dotfiles/vscode/install_extensions.sh
```

