# Pure prompt setup
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit

# Colors must be set before `prompt pure`
source ~/.zsh/pure-colors.zsh

# Optional extras (uncomment to enable)
# zstyle :prompt:pure:git:dirty detailed yes
# zstyle :prompt:pure:git:stash show yes
# zstyle :prompt:pure:environment:node_version show yes

# Disable background `git fetch`
PURE_GIT_PULL=0

prompt pure
