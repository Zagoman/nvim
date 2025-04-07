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

# Installing LSPs

go to nvim-lspconfig file
write the command

```vim
:help lspconfig-all
```
in there, you will be able to see a lot of lsps for many languages, choose the one for your language

### Golang LSP
```bash
go install golang.org/x/tools/gopls@latest
```

### Csharp LSP
You need to be on dotnet version 8, and have dotnet on the path. 
```bash
dotnet tool install --global csharp-ls
```
### Typescript LSP 

```bash
npm install -g typescript typescript-language-server
```
### Lua LSP

```bash
brew install lua-language-server
```
