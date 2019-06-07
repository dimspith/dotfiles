#
#===================

# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
# command: git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

#===================

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Haskell ghcup
source $HOME/.ghcup/env

#=== ZGEN ===

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # Enable oh-my-zsh support
  zgen oh-my-zsh

  zgen load "zdharma/fast-syntax-highlighting"
  zgen load "MichaelAquilina/zsh-you-should-use"

  # Execute install.py in it's directory to install it.
  zgen load "wting/autojump"

  # theme
  zgen oh-my-zsh themes/gentoo

  # save to init script
  zgen save

fi

# Autojump plugin configuration
[[ -s /home/dimitris/.autojump/etc/profile.d/autojump.sh ]] && source /home/dimitris/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
#=============

# Aliases.
alias v="nvim" # Save time by typing v instead of nvim
alias la="ls -gGAh" # List hidden files in a simple format
alias ls="ls --color=always -X --group-directories-first"
alias rm="rm -I" # Promt on multiple file deletion
alias aliases="alias|less"
alias gotop="gotop -c monokai"
alias rlconf="source ~/.zshrc"
alias rlprof="source ~/.zprofile"
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:alt_shift_toggle ; xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"

alias vf="nvim \$(fzf)"
alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config"
alias vtm="nvim $HOME/.config/termite/config"

alias youtube="toilet -f mono9 --rainbow YoutubeDL;youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(xclip -o)"
alias youtubev="toilet -f mono9 --rainbow YoutubeDL;youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --format webm \$(xclip -o)"
alias youtubepl="toilet -f mono9 --rainbow YoutubeDL;echo \"[Playlist Mode]\";youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(xclip -o)"
alias open="setsid xdg-open"
alias pdf="setsid zathura"
alias repulse="pulseaudio --kill && sleep 2 && pulseaudio --start"
alias gitlog="git log --all --decorate --oneline --graph"
alias bro="bro 2>/dev/null"

# Keybindings
bindkey -v

# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

# Command autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

