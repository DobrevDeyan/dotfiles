#!/usr/bin/env bash
# macOS installer — run from repo root: ./install.sh
set -e

REPO="$(cd "$(dirname "$0")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"
WEZTERM_CONFIG="$HOME/.config/wezterm"

echo "==> Neovim config..."
if [[ -d "$NVIM_CONFIG" && ! -L "$NVIM_CONFIG" ]]; then
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
    echo "    Backed up to ${NVIM_CONFIG}.bak"
fi
mkdir -p "$NVIM_CONFIG"
rsync -a --exclude='.git' "$REPO/nvim/" "$NVIM_CONFIG/"

echo "==> WezTerm config..."
mkdir -p "$WEZTERM_CONFIG"
cp "$REPO/wezterm/wezterm.lua" "$WEZTERM_CONFIG/wezterm.lua"
if [[ -f "$HOME/.wezterm.lua" ]]; then
    mv "$HOME/.wezterm.lua" "$HOME/.wezterm.lua.bak"
    echo "    Moved ~/.wezterm.lua -> ~/.wezterm.lua.bak"
fi

echo "==> Mononoki Nerd Font..."
if fc-list | grep -qi "Mononoki"; then
    echo "    Already installed, skipping."
else
    TMP=$(mktemp -d)
    curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.zip" -o "$TMP/Mononoki.zip"
    unzip -q "$TMP/Mononoki.zip" -d "$TMP/mononoki"
    cp "$TMP"/mononoki/*.ttf "$HOME/Library/Fonts/"
    rm -rf "$TMP"
    echo "    Installed to ~/Library/Fonts/"
fi

echo ""
echo "Done. Open nvim and run :Lazy sync to install plugins."
echo "WezTerm picks up the new config on next launch."
