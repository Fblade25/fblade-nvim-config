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

# Check if zsh-autosuggestions is installed
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "zsh-autosuggestions is already installed."
fi

# Make sure zsh-autosuggestions is enabled in .zshrc
if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
  echo "Enabling zsh-autosuggestions plugin in .zshrc..."
  sed -i '' '/^plugins=(/ s/)/ zsh-autosuggestions)/' "$HOME/.zshrc"
else
  echo "zsh-autosuggestions plugin is already enabled in .zshrc."
fi

# Check if zsh-syntax-highlighting is installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting is already installed."
fi

# Make sure zsh-syntax-highlighting is enabled in .zshrc
if ! grep -q "zsh-syntax-highlighting" "$HOME/.zshrc"; then
  echo "Enabling zsh-syntax-highlighting plugin in .zshrc..."
  sed -i '' '/^plugins=(/ s/)/ zsh-syntax-highlighting)/' "$HOME/.zshrc"
else
  echo "zsh-syntax-highlighting plugin is already enabled in .zshrc."
fi

# Check if powerlevel10k is installed
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "Powerlevel10k is already installed."
fi

# Make sure Powerlevel10k is enabled in .zshrc
if ! grep -q "POWERLEVEL10K" "$HOME/.zshrc"; then
  echo "Setting Powerlevel10k as the Zsh theme..."
  sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' "$HOME/.zshrc"
else
  echo "Powerlevel10k is already set as the Zsh theme."
fi

echo "All dotfiles linked successfully."

