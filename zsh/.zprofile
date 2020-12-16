# GTK and QT settings
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Default application values
export EDITOR="nvim"
export TERM=xterm-256color

# Set the base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"

# Disable "less" history
export LESSHISTFILE=-

# Set bat as a manpager
export MANPAGER="bat -p"

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
# Custom scripts
export PATH="$HOME/.scripts:$PATH"
