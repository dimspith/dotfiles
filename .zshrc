#
#===================

# THIS CONFIG IS USED WITH OH-MY-ZSH,
# INSTALL IT BEFORE USING IT

#===================

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Home directory script path. 
export PATH=$PATH:$HOME/bin/

# The theme that zsh is using.
ZSH_THEME="nebirhos"

# Change shell variables
export EDITOR=/usr/bin/nvim

# The list of plugins to load.
plugins=(git)

# Source file.
source $ZSH/oh-my-zsh.sh

# Aliases.
alias v="vim"
alias nv="nvim"
alias la="ls -gGAh"
alias rm="rm -I"
alias aliases="alias|less"
alias pupg="sudo pacman -Syu"

alias rlconf="source ~/.zshrc"
alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.vimrc"
alias nvrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config"
alias youtube="toilet -f mono9 --rainbow Youtube;youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(xclip -o)"
alias diskspace="df -h | grep /dev/sdc | awk {'print \$4'}"
alias open="xdg-open"

# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

