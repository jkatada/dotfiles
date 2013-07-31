cd ..
del .vimrc
del .gvimrc
fsutil hardlink create .vimrc dotfiles/.vimrc
fsutil hardlink create .gvimrc dotfiles/.gvimrc

pause
