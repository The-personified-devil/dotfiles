# theme_gruvbox dark medium

fish_vi_key_bindings

# function gpb -d "Git commit and git push to origin/{current branch}"
# 	command git add . && git commit -S && git push origin HEAD
# end

# If running from tty1 start sway
# set TTY1 (tty)
# if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
#   exec sh -c "WLR_RENDERER=vulkan sway"
# end

abbr --add ls exa

set -Gx EDITOR nvim

zoxide init fish --cmd j | source
starship init fish | source
# navi widget fish | source
atuin init fish | source
