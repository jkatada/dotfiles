PS1='\[\033[36m\][\u:\[\033[33m\]\w\[\033[36m\]]\[\033[0m\] \$ '

export EDITOR=vi

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias gvim='/Applications/MacVim.app/Contents/MacOS/gvim "$@"'

# for bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
