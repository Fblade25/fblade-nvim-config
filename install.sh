#!/bin/bash

DOTFILES_DIR="fblade-nvim-config/src"
echo "Symlinking dotfiles..."

# Check that the files exist before creating symlinks
if [ -f "$HOME/$DOTFILES_DIR/zsh/.zshrc" ]; then
  echo "Found .zshrc, creating symlink..."
  ln -sf "$HOME/$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
else
  echo "Error: .zshrc not found!"
fi

if [ -f "$HOME/$DOTFILES_DIR/tmux/.tmux.conf" ]; then
  echo "Found .tmux.conf, creating symlink..."
  ln -sf "$HOME/$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
else
  echo "Error: .tmux.conf not found!"
fi

if [ -d "$HOME/$DOTFILES_DIR/nvim" ]; then
  echo "Found Neovim config, creating symlink..."
  mkdir -p "$HOME/.config"
  rm -rf "$HOME/.config/nvim"
  ln -sf "$HOME/$DOTFILES_DIR/nvim/." "$HOME/.config/nvim"
else
  echo "Error: Neovim config not found!"
fi

if [ -f "$HOME/$DOTFILES_DIR/p10k/.p10k.zsh" ]; then
  echo "Found .p10k.zsh, creating symlink..."
  ln -sf "$HOME/$DOTFILES_DIR/p10k/.p10k.zsh" "$HOME/.p10k.zsh"
else
  echo "Error: .p10k.zsh not found!"
fi

echo "All dotfiles linked successfully."

