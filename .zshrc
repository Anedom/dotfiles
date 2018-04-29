# MISC:
export PATH=$HOME/bin:/usr/local/bin:$PATH export ZSH=/home/anedom/.oh-my-zsh
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
bindkey -v

# UI:
ZSH_THEME="mh"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# VARIABLES:
export LANG=en_US.UTF-8
export EDITOR='/usr/bin/vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export UPDATE_ZSH_DAYS=14
export ARCHFLAGS="-arch x86_64"
export GMAIL='marco100tno@gmail.com'
export MAIL='marco.modena@protonmail.com'

# ALIAS:
alias tmux="tmux -2"
alias ll="ls -l"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sp="sudo pacman"
alias rr="rm -r"

# PLUGINS:
plugins=(archlinux extract git git-extras svn tmux vi-mode)
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. .oh-my-zsh/z/z.sh

# DOTFILES:
alias config='/usr/bin/git --git-dir=/home/anedom/.cfg/ --work-tree=/home/anedom'
