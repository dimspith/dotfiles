function aliases --description "Alias configuration"
    #QOL
    alias v="nvim"
    alias ls="exa --group-directories-first --color always"
    alias la="ls -a"
    alias lal="la -l"
    alias ll="ls -1"
    alias rm="rm -I"
    alias mexec="chmod +x"
    alias purge="rm -rf"
    alias open="setsid xdg-open"
    alias pdf="setsid zathura"
    alias grepc="grep --color=auto"
    alias grep="grep -i"

    # git
    alias g="git"
    alias gb="git branch -a"
    alias gc="git checkout"
    alias gcb="git checkout -b"
    alias gdbr="git branch -d"
    alias gd="git diff"
    alias gac="git add -A && git commit -m "
    alias glog="git log --all --decorate --oneline --graph"
    alias gls="git log --stat"
    alias gr="git remote"
    alias grv="git remote -v"
    alias gss="git status -u -s"

    # CONFIGS
    alias rlconf="source ~/.config/fish/config.fish7"
    alias rlprof="source ~/.zprofile"
    alias vzc="nvim $HOME/.zshrc"
    alias vfc="nvim $HOME/.config/fish/config.fish"
    alias vrc="nvim $HOME/.config/nvim/init.vim"
    alias vpol="nvim $HOME/.config/polybar/config"
    alias vi3="nvim $HOME/.config/i3/config"
    alias vrf="nvim $HOME/.config/rofi/config"
    alias val="nvim $HOME/.config/alacritty/alacritty.yml"

    # MISCELLANEOUS
    alias bro="bro 2>/dev/null"
    alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle ; setxkbmap -option ctrl:nocaps"
    alias clip="xclip -selection clipboard"

    #Inits
    alias itray="stalonetray -c ~/.xmonad/stalonetrayrc &;disown"
    alias ipicom="picom --config ~/.xmonad/picom.conf -b"
    alias rlmacs="pkill emacs && emacs --daemon"
end
