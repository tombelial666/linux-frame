#!/usr/bin/env bash
set -euo pipefail

echo "[1/7] Updating package lists..."
sudo apt update

echo "[2/7] Installing base packages..."
sudo apt install -y   git curl wget build-essential ca-certificates gnupg lsb-release   python3 python3-pip python3-venv pipx   tmux zsh fzf jq ripgrep fd-find bat eza btop unzip zip   make xclip tree fastfetch neovim

echo "[3/7] Creating workspace..."
mkdir -p "$HOME"/workspace/{repos,sandboxes,artifacts,downloads,tmp}
mkdir -p "$HOME"/.venvs

echo "[4/7] Bootstrapping Python venv..."
python3 -m venv "$HOME/.venvs/base"
"$HOME/.venvs/base/bin/python" -m pip install --upgrade pip wheel setuptools

echo "[5/7] Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

echo "[6/7] Installing Docker..."
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER" || true

echo "[7/7] Done. Re-login may be required for docker group and default shell changes."
