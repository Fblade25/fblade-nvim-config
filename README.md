# fblade-nvim-config
Config files for tmux, nvim and zsh

Will write setup guide later

Note: also requires UV, create a .venv in the root folder of the repo.

## Setup
1. Install the repo in `~/`
2. Navigate into the repo
```bash
cd ~/fblade-nvim-config/
```
3. Give permission to run install script
```bash
chmod +x ./install.sh
```
4. Run the install script

**This script symlinks dotfiles for nvim, tmux, zsh and p10k. Back up your dotfiles before using this script.**
```bash
./install.sh
```

## Rebound Keybinds

### tmux
- prefix: `C-a`

### nvim
- Telescope `find_files`: `C-p`
- Telescope `live_grep`: `C-f`
