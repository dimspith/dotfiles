#
#===================

# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
# command: git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

#===================

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#=== ZGEN ===

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  zgen oh-my-zsh

  # plugins
  zgen load "zdharma/fast-syntax-highlighting"
  zgen load "MichaelAquilina/zsh-you-should-use"
  zgen load "wting/autojump"

  # theme
  zgen oh-my-zsh themes/kolo

  # save to init script
  zgen save

fi

#=============
# Aliases.
alias v="nvim" # Save time by typing v instead of nvim
alias la="ls -gGAh" # List hidden files in a simple format
alias ls="ls --color=always"
alias rm="rm -I" # Promt on multiple file deletion
alias aliases="alias|less"
alias pupg="sudo pacman -Syu"
alias vf="nvim \$(fzf)"

alias rlconf="source ~/.zshrc"

alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config"
alias vtm="nvim $HOME/.config/termite/config"

alias youtube="toilet -f mono9 --rainbow Youtube;youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(xclip -o)"
alias diskspace="df -h | grep /dev/sda | awk {'print \$4'}"
alias open="xdg-open"
alias pdf="setsid zathura"
alias repulse="pulseaudio --kill && pulseaudio --start"

# Keybindings
bindkey -v

# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

# Command autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

