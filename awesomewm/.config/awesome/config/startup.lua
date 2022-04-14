local awful = require("awful")

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({
      -- "pipewire",
      -- "wireplumber",
      -- "pipewire-pulse",
      -- "emacs --daemon",
      "picom",
      "pasystray",
      "nm-applet",
      -- "udiskie",
      -- "setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle -option ctrl:nocaps",
      -- "xset r rate 260 32",
      "/usr/libexec/polkit-gnome-authentication-agent-1"
})
