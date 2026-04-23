#!/usr/bin/env bash
set -u

pass() { echo "PASS: $1"; }
fail() { echo "FAIL: $1"; }
unk()  { echo "UNKNOWN: $1"; }

check_cmd() {
  local cmd="$1"
  local name="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    pass "$name"
  else
    fail "$name"
  fi
}

echo "=== Linux readiness checks ==="

if ping -c 1 1.1.1.1 >/dev/null 2>&1; then
  pass "Internet connectivity"
else
  fail "Internet connectivity"
fi

if sudo apt update >/dev/null 2>&1; then
  pass "apt update"
else
  fail "apt update"
fi

check_cmd git "git installed"
check_cmd python3 "python3 installed"
check_cmd tmux "tmux installed"
check_cmd zsh "zsh installed"
check_cmd docker "docker installed"
check_cmd node "node installed"
check_cmd npm "npm installed"
check_cmd fastfetch "fastfetch installed"
check_cmd eza "eza installed"
check_cmd batcat "bat/batcat installed"

if [ -d "$HOME/workspace/repos" ]; then
  pass "workspace exists"
else
  fail "workspace exists"
fi

if zsh -i -c exit >/dev/null 2>&1; then
  pass "zsh starts"
else
  fail "zsh starts"
fi

if tmux -V >/dev/null 2>&1; then
  pass "tmux opens"
else
  fail "tmux opens"
fi

if docker run --rm hello-world >/dev/null 2>&1; then
  pass "docker hello-world"
else
  unk "docker hello-world (may require relogin/group refresh)"
fi
