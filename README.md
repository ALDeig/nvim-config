## 🛠️ Installation

#### Install dependencies
- ripgrep
- npm
##### For MacOS
```bash
brew install ripgrep
brew install npm
```

#### Make a backup of your current nvim folder
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

#### Clean neovim folders (Optional but recommended)
```bash
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository
```bash
git clone https://github.com/ALDeig/nvim-config.git ~/.config/nvim
nvim
```

## Uninstall

> Recommended make it before installing

```bash
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## 📦 Setup
#### Install LSP
Enter :LspInstall followed by the name of the server you want to install

Example: `:LspInstall pyright`

#### Install language parser
Enter :TSInstall followed by the name of the language you want to install

Example: `:TSInstall python`

#### For my configuration install in Mason

◍ lua-language-server
◍ pyright
◍ ruff-lsp
◍ stylua


