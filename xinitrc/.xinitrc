# Start keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
eval $(ssh-agent)
pipewire &
pipewire-pulse &
udiskie &
setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle -option ctrl:nocaps &
xset r rate 260 32 &
/usr/libexec/polkit-gnome-authentication-agent-1 &
emacs --daemon &


exec dbus-launch --sh-syntax --exit-with-session awesome
