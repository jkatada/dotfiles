# Windows10

## Change keymap
Double click `Windows/Swap_RCtrl_Caps-Win.reg` file and install.

## Install software manually
* vim-kaoriya
* java
* maven
* vscode (download package from web site)
* Docker Desktop for Windows
* vagrant
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
* LibreOffice
* Google日本語入力
    * Import `Google日本語入力/keymap.txt` as keymap

## Setup vim

### for VimFiler (rm.exe, cp.exe, etc...)
Add path of Git /usr/bin directory to PATH environment variable.

### gvim shortcut

gvim option for shortcut

```
-p
```

gvim option for `shell:sendto` shortcut

```
-p --remote-tab-silent
```

gvim option for file association shortcut
(change from regedit. key: `HKEY_CLASSES_ROOT/Applications/gvim.exe/shell/open/command`)

```
-p --remote-tab-silent "%1"
```

## Setup vscode
```
mklink /d "%AppData%\Code\User" "c:%HOMEPATH%\dotfiles\vscode"
```

Install vscode extensions. (Execute on Git Bash)
```
~/dotfiles/vscode/install_extensions.sh
```

