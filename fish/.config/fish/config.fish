######################################################################
# SETTINGS
######################################################################

# Disable fish greeting
set fish_greeting

# Enable aliases
aliases

# Enabled colored man pages
colored_man

# Set colors
fish_colors

#====================
# MINOR FUNCTIONS
#====================

# Replace a symlink with the file it's pointing to
function removelink 
  [ -L "$1" ] && cp --remove-destination (readlink "$1") "$1"
end

# Find a font using fc-list
function findfont
    fc-list | grep --color=never "$argv[1]" | awk -F "/" '{print $NF}'
end

function cheat
    curl cht.sh/"$argv[1]"
end

function fdesk
   fd "$argv[1]" /usr/share/applications
end

function bex
    "$argv[1]"&;disown
end

function covid
    curl https://corona-stats.online/"$argv[1]"'?top=30&source=2&minimal=true'
end

. ~/.config/fish/z-fish/z.fish
