function univars --description "Set universal variables"
    # GTK and QT settings
    set -U QT_QPA_PLATFORMTHEME "qt5ct"
    set -U GTK2_RC_FILES "$HOME/.gtkrc-2.0"

    # Default application values
    set -U EDITOR "emacsclient -c -nw"
    set -U BROWSER "firefox"
    set -U TERMINAL "alacritty"
    set -U PASSWORD_STORE_ENABLE_EXTENSIONS true
    set -gx TERM "xterm-256color"

    # Set the default configuration file folder
    set -U XDG_CONFIG_HOME "$HOME/.config"

    #### PATH ####
    # ZSH path fix
    set -gx PATH $HOME/bin:/usr/local/bin $PATH
    # Ruby binaries
    set -gx PATH $HOME/.gem/ruby/2.6.0/bin $PATH
    # Haskell binaries
    set -gx PATH $HOME/.cabal/bin $PATH
    # Rust binaries
    set -gx PATH $HOME/.cargo/bin $PATH
    # Local binaries
    set -gx PATH $HOME/.local/bin $PATH
    # npm
    set -gx PATH $HOME/.npm-global/bin $PATH
    # go
    set -gx PATH $HOME/MyPrograms/go/bin $PATH
end
