# ============================================================================
# PATH CONFIGURATION
# ============================================================================
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.local/bin:$PATH

# ============================================================================
# OH MY ZSH CONFIGURATION
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
# Completions: Homebrew (brew, gh, ...) and own tools. Must be set before compinit runs.
fpath=(/opt/homebrew/share/zsh/site-functions ${${(%):-%x}:A:h}/completions $fpath)
ZSH_THEME="robbyrussell"
plugins=(
  git
  docker
  docker-compose
)
source $ZSH/oh-my-zsh.sh

# ============================================================================
# NVM CONFIGURATION
# ============================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Default Node = newest installed version (same as nvm alias "node"), set without running nvm
() {
  setopt local_options numeric_glob_sort
  local latest=("$NVM_DIR"/versions/node/v*(N[-1]))
  [[ -n $latest ]] && path=("$latest/bin" $path)
}

# Switch Node version only when the current folder has a .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -f .nvmrc ]] || return
  nvm use --silent || nvm install
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ============================================================================
# PNPM CONFIGURATION
# ============================================================================
export PNPM_HOME="/Users/grom/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# KEY BINDINGS
# ============================================================================
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# ============================================================================
# SECRETS
# ============================================================================
[ -r ~/Projects/zsh-config/.zsh_secrets ] && source ~/Projects/zsh-config/.zsh_secrets

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/grom/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/grom/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/grom/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/grom/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

devenv() {
  case "$1" in
    cd)
      local __devenv_dir
      __devenv_dir="$(command devenv path "${2:-}")" || return $?
      cd "$__devenv_dir"
      ;;
    *) command devenv "$@" ;;
  esac
}

# export CLAUDE_CODE_USE_BEDROCK=1
# export AWS_REGION=us-east-1

# Disable Fallow Claude code hook
# FALLOW_POSTCOMMIT_ENABLED=0
export HARNESS_REQUIRED_TOOLS=fallow,jq


export PW_TEST_CONNECT_WS_ENDPOINT="$DEVENV_BROWSER_WS"
# export STG_TOKEN_TMP=

# Aliases
alias hs=harness
alias dt='code /Users/grom/code/grom/devtools.code-workspace'
alias lr='open -a MarkEdit ~/.cache/claude/last-reply.md'
# local decision model for the clean-code post-commit hook (stop: pkill llama-server)
alias cc-llm='llama-server -m ~/models/h2o-lightning-4b-Q4_K_M.gguf --host 127.0.0.1 --port 8091 -c 8192 -ngl 99'

# eza aliases
alias ls='eza --icons'
alias ll='eza -l --icons --git --header'
alias la='eza -la --icons --git --header'
alias lt='eza --icons --tree --level=2'

# zoxide: smarter cd (z, zi)
eval "$(zoxide init zsh)"

# fzf: fuzzy finder key bindings (Ctrl-R history, Ctrl-T files, Alt-C folders)
# Alt-C lists folders with fd: faster, and skips node_modules and .gitignore entries
export FZF_ALT_C_COMMAND='fd --type d --exclude node_modules'
source <(fzf --zsh)
