# Cleanup setup
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Install brew to be main package manager on wsl 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Install needed dependencies
```bash
brew install gcc ripgrep fd sqlfluff sqlite unzip fzf hq gnu-sed jq eza btop bat
```

# Install neovim
```bash
brew install neovim
```
