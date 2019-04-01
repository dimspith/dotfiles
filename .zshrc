#
#===================

# THIS CONFIG IS USED WITH OH-MY-ZSH,
# INSTALL IT BEFORE USING IT

#===================

# The theme that zsh is using.
ZSH_THEME="clean"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Source file.
source $ZSH/oh-my-zsh.sh

# The list of plugins to load.
plugins=(
git
)


# Change shell variables
export EDITOR=/usr/bin/nvim

# Aliases.
alias v="nvim"
alias la="ls -gGAh"
alias rm="rm -I"
alias aliases="alias|less"
alias pupg="sudo pacman -Syu"
alias vf="nvim \$(fzf)"

alias rlconf="source ~/.zshrc"

alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config"

alias youtube="toilet -f mono9 --rainbow Youtube;youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(xclip -o)"
alias diskspace="df -h | grep /dev/sdc | awk {'print \$4'}"
alias open="xdg-open"
alias pdf="setsid zathura"
alias cdf="cd \$(fzf) -d"

# Keybindings
bindkey -v

# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

# Command autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

