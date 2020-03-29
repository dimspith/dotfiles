# GTK and QT settings
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Default application values
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=usr/bin/termite
export TERM=xterm-256color
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

# Set the base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Disable "less" history
export LESSHISTFILE=-

# ZSH path fix
export PATH="$HOME/bin:/usr/local/bin:$PATH"
# Ruby binaries
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
# cabal binaries
export PATH="$HOME/.cabal/bin:$PATH"
# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
# npm
export PATH="$HOME/.npm-global/bin:$PATH"
# go
export PATH="$HOME/MyPrograms/go/bin:$PATH"

# load nix
. ~/.nix-profile/etc/profile.d/nix.sh
