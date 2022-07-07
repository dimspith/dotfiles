# Setup fzf

# Default fzf command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git .pnpm .wine'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --height 40% --exclude .git node_modules .pnpm .wine --hidden'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.config/zsh/modules/fzf-completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.config/zsh/modules/fzf-key-bindings.zsh"
