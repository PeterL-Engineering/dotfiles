#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

ln -sf "$DOTFILES/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES/.bash_aliases" "$HOME/.bash_aliases"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zsh_aliases" "$HOME/.zsh_aliases"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES/.profile" "$HOME/.profile"
