# ~/.zshrc — lean hacker terminal style

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY

export PATH="$HOME/.local/bin:$PATH"

alias ll='eza -lah --git'
alias la='eza -la'
alias lt='eza --tree --level=2'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias v='nvim'
alias cat='bat --paging=never'

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v fastfetch >/dev/null 2>&1 && [[ -o interactive ]]; then
  fastfetch
fi
