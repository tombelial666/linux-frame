# Ubuntu Linux Setup Framework

## 1. Install goals

Target:
- Ubuntu 24.04 LTS
- separate SSD
- rapid internet access after first boot
- development-ready baseline
- stylish but useful terminal

## 2. Recommended disk layout for 110 GB SSD

Option A:
- EFI: 512 MB
- / : 48 GB
- /home : rest
- swap: file

Option B:
- EFI: 512 MB
- / : remaining space
- swap: file

Recommendation:
Use Option A if you want cleaner separation of system and user data.

## 3. Day-0 fast path after first boot

First priority: get internet.

Preferred fallback order:
1. Wi‑Fi
2. USB tethering from phone
3. Ethernet

Then run:

```bash
sudo apt update
sudo apt upgrade -y
sudo ubuntu-drivers autoinstall || true
sudo reboot
```

## 4. Core packages

```bash
sudo apt update
sudo apt install -y   git curl wget build-essential ca-certificates gnupg lsb-release   python3 python3-pip python3-venv pipx   tmux zsh fzf jq ripgrep fd-find bat eza btop unzip zip   make xclip tree fastfetch neovim
```

## 5. Workspace layout

```text
~/workspace/
  repos/
  sandboxes/
  artifacts/
  downloads/
  tmp/
```

Create it:

```bash
mkdir -p ~/workspace/{repos,sandboxes,artifacts,downloads,tmp}
```

## 6. Python baseline

```bash
python3 -m venv ~/.venvs/base
source ~/.venvs/base/bin/activate
python -m pip install --upgrade pip wheel setuptools
```

## 7. Node baseline

Use nvm:

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts
node -v
npm -v
```

## 8. Docker baseline

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER"
newgrp docker
docker --version
docker run hello-world
```

## 9. Git baseline

```bash
git config --global user.name "YOUR_NAME"
git config --global user.email "YOUR_EMAIL"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

## 10. Hacker terminal setup

This means:
- dark, clean, keyboard-driven
- informative prompt
- fast navigation
- searchable history
- readable file listings
- safe aliases only

### Install starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Make zsh default

```bash
chsh -s "$(which zsh)"
```

### Suggested stack
- zsh
- starship
- fastfetch
- tmux
- fzf
- zoxide
- bat
- eza
- btop

### Useful aliases
- `ll='eza -lah --git'`
- `lt='eza --tree --level=2'`
- `cat='bat --paging=never'`
- `gs='git status'`
- `v='nvim'`

Do **not** alias `rm`, `sudo`, or package commands in dangerous ways.

## 11. Minimal .zshrc approach

Keep it lean:
- PATH fixes
- history options
- starship init
- fzf init if present
- zoxide init if present
- safe aliases
- fastfetch only for interactive shells

## 12. Validation checklist

Critical:
- internet works
- apt update works
- git works
- python works
- venv works
- node works
- docker hello-world works
- zsh starts
- starship loads
- tmux opens
- workspace exists
- enough disk remains

## 13. Snapshot artifacts

Save:
- installed package list
- versions of key tools
- validation report
- copies of shell configs

Example:

```bash
mkdir -p ~/workspace/artifacts/bootstrap
dpkg -l > ~/workspace/artifacts/bootstrap/dpkg-list.txt
python3 --version > ~/workspace/artifacts/bootstrap/python-version.txt
node --version > ~/workspace/artifacts/bootstrap/node-version.txt
docker --version > ~/workspace/artifacts/bootstrap/docker-version.txt
```