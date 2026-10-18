#!/usr/bin/env bash
# Installs the Pure prompt, zsh plugins, and links the Pure config.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.zsh"

# zsh + plugins (the .zshrc sources these from /usr/share)
if command -v apt >/dev/null 2>&1; then
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
else
    echo "apt not found: install zsh, zsh-autosuggestions and zsh-syntax-highlighting manually" >&2
fi

# Pure itself (clone, or update if already there)
if [ -d "$HOME/.zsh/pure/.git" ]; then
    git -C "$HOME/.zsh/pure" pull --ff-only
else
    git clone --depth 1 https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# Link the config files from the repo
for f in pure.zsh pure-colors.zsh; do
    ln -sf "$DOTFILES/zsh/$f" "$HOME/.zsh/$f"
done

echo "Pure installed. Run: exec zsh"
