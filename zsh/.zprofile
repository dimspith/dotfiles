# GTK and QT settings
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Default application values
export EDITOR="nvim"
export BROWSER=/usr/bin/firefox
export TERMINAL=usr/bin/termite
export TERM=xterm-256color
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Set the base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share"

# Disable "less" history
export LESSHISTFILE=-

# Set bat as a manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ZSH path fix
export PATH="$HOME/bin:/usr/local/bin:$PATH"
# cabal binaries
export PATH="$HOME/.cabal/bin:$PATH"
# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
# npm
export PATH="$HOME/.npm-global/bin:$PATH"
# lua
export PATH="$HOME/.luarocks/bin:$PATH"
# nim
export PATH="$HOME/.nimble/bin:$PATH"
# go
export PATH="$HOME/progs/go/bin:$PATH"
# raku
export PATH="$HOME/progs/rakudo/share/perl6/site/bin:$PATH"
export PATH="$HOME/progs/rakudo/bin:$PATH"
# Custom scripts
export PATH="$HOME/.scripts:$PATH"
