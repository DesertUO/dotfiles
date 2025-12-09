#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"

ln -s "$DOTFILES/zshrc.zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES/tmux" "$HOME/.config/tmux"

chsh -s /bin/zsh

