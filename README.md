# dotfiles

Cross-platform developer setup — macOS (zsh) and Windows (Cmder). Shared theme across Neovim, WezTerm, and VS Code.

## Structure

```
dotfiles/
├── nvim/                    # Neovim config (lazy.nvim, LSP, telescope, harpoon)
│   ├── colors/
│   │   └── forestdark.lua   # custom colorscheme
│   ├── lua/
│   │   ├── config/          # options, keymaps, lsp, lazy bootstrap
│   │   └── plugins/         # one file per plugin group
│   └── lazy-lock.json
├── wezterm/
│   └── wezterm.lua          # cross-platform: detects OS, sets shell accordingly
├── vscode/
│   └── forestdark-theme/    # VS Code extension (Forest Dark / Forest Light)
├── install.sh               # macOS installer
└── install.ps1              # Windows installer
```

## Install

### macOS

```bash
git clone https://github.com/DobrevDeyan/dotfiles.git ~/Development/dotfiles
cd ~/Development/dotfiles
./install.sh
```

Then open Neovim and run `:Lazy sync`.

### Windows

```powershell
# Allow scripts if not already done:
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

git clone https://github.com/DobrevDeyan/dotfiles.git "$env:USERPROFILE\dotfiles"
cd "$env:USERPROFILE\dotfiles"
.\install.ps1
```

Then open Neovim and run `:Lazy sync`.

## What each installer does

| Step | macOS | Windows |
|------|-------|---------|
| Neovim config | `~/.config/nvim/` | `%LOCALAPPDATA%\nvim\` |
| WezTerm config | `~/.config/wezterm/wezterm.lua` | `%USERPROFILE%\.config\wezterm\wezterm.lua` |
| Font | Mononoki Nerd Font → `~/Library/Fonts/` | Mononoki Nerd Font → system fonts |
| VS Code theme | — | `%USERPROFILE%\.vscode\extensions\forestdark-theme-1.0.0\` |

## WezTerm — Windows Cmder path

The WezTerm config launches Cmder as the default shell on Windows. The path is hardcoded in `wezterm/wezterm.lua`:

```lua
local cmder = 'D:\\cmder'
```

**Change this to match your actual Cmder installation before running the installer**, e.g.:

```lua
local cmder = 'C:\\tools\\cmder'
```

WezTerm detects the OS at runtime (`wezterm.target_triple`) so the same file works on both platforms — only the shell block is OS-specific.

## Theme

**forestdark** — dark green/teal palette on black background.

- Neovim: built-in colorscheme at `nvim/colors/forestdark.lua`
- WezTerm: full ANSI + tab bar palette in `wezterm/wezterm.lua`
- VS Code: install the extension from `vscode/forestdark-theme/` or activate via `install.ps1`

Font: **Mononoki Nerd Font** — installed automatically by both install scripts.
