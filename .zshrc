# ============================================================================
# ZSH CONFIGURATION FILE
# ============================================================================
# This file configures your zsh shell environment.
# Each section below is explained with comments indicating:
# - What it does
# - Whether to keep or remove it
# - Alternative options if applicable
# ============================================================================

# ============================================================================
# PATH CONFIGURATION
# ============================================================================
# Adds custom directories to your PATH environment variable
# - $HOME/bin: Your personal bin directory (if it exists)
# - /usr/local/bin: Common location for user-installed programs on macOS
# - $HOME/.composer/vendor/bin: PHP Composer global packages (if you use PHP)
# - $HOME/.npm-global/bin: Global npm packages (if you use npm with --global flag)
# KEEP IF: You use any of these tools
# REMOVE IF: You don't use PHP/Composer or npm global packages
export PATH=$HOME/bin:/usr/local/bin:$HOME/.composer/vendor/bin:$HOME/.npm-global/bin:$PATH

# ============================================================================
# OH MY ZSH CONFIGURATION
# ============================================================================
# Path to your Oh My Zsh installation directory
# KEEP IF: You use Oh My Zsh (most users do)
# REMOVE IF: You don't have Oh My Zsh installed
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# EXPLANATION: Sets your terminal prompt theme. "robbyrussell" is the default.
# KEEP IF: You like the current theme
# CHANGE IF: You want a different theme (popular: "agnoster", "powerlevel10k", "pure")
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# EXPLANATION: Makes tab completion case-sensitive (default is case-insensitive)
# KEEP COMMENTED: Unless you specifically need case-sensitive completion
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# EXPLANATION: Makes underscores and hyphens interchangeable in tab completion
# KEEP COMMENTED: Unless you have issues with completion
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# EXPLANATION: Loads Oh My Zsh plugins. "git" provides git aliases and shortcuts.
# KEEP IF: You use git (most developers do)
# ADD MORE IF: You want features like "docker", "kubectl", "node", "npm", "z", etc.
# Popular plugins: git, z (jump to directories), docker, kubectl, npm, node
plugins=(git)

# EXPLANATION: Loads Oh My Zsh framework (required if using Oh My Zsh)
# KEEP: This is essential if you use Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ============================================================================
# USER CONFIGURATION
# ============================================================================

# export MANPATH="/usr/local/man:$MANPATH"

# EXPLANATION: Sets system language/locale (usually auto-detected on macOS)
# UNCOMMENT IF: You have locale issues or want to force a specific language
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# EXPLANATION: Sets your default editor (used by git, crontab, etc.)
# UNCOMMENT IF: You want to use a specific editor
# Popular choices: 'vim', 'nvim', 'code' (VS Code), 'nano', 'emacs'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# EXPLANATION: Opens .zshrc in PhpStorm/PyCharm/WebStorm (pstorm command)
# KEEP IF: You use JetBrains IDEs and have the "pstorm" command installed
# REMOVE IF: You don't use JetBrains IDEs or prefer a different editor
# ALTERNATIVE: Use "code ~/.zshrc" for VS Code, "vim ~/.zshrc" for vim, etc.
alias zshconfig="pstorm ~/.zshrc"
# EXPLANATION: Opens Oh My Zsh directory in PhpStorm
# KEEP IF: You want to customize Oh My Zsh themes/plugins
# REMOVE IF: You don't customize Oh My Zsh
alias ohmyzsh="pstorm ~/.oh-my-zsh"

# ============================================================================
# NVM (NODE VERSION MANAGER) CONFIGURATION
# ============================================================================
# EXPLANATION: Sets up NVM (Node Version Manager) to manage multiple Node.js versions
# KEEP IF: You use Node.js and want to switch between versions
# REMOVE IF: You don't use Node.js or use a different version manager (n, fnm, etc.)
# NOTE: This is loaded before myzshrc.sh because that file might use npm
export NVM_DIR="$HOME/.nvm"
# EXPLANATION: Loads NVM if it's installed (checks if nvm.sh exists)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# EXPLANATION: Loads NVM tab completion for faster command typing
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ============================================================================
# CUSTOM CONFIGURATION FROM DROPBOX
# ============================================================================
# EXPLANATION: Sources a custom config file from Dropbox (if it exists)
# KEEP IF: You have custom settings in ~/Dropbox/myzshrc.sh that you want to use
# REMOVE IF: The file doesn't exist or you want to consolidate everything here
# NOTE: Consider moving the contents of myzshrc.sh into this file for better portability
# ADDED BY GROM
if [ -r ~/Dropbox/myzshrc.sh ]; then
    source ~/Dropbox/myzshrc.sh
else
    print "404: ~/Dropbox/myzshrc.sh not found."
fi

# ============================================================================
# PNPM CONFIGURATION
# ============================================================================
# EXPLANATION: Adds pnpm (fast Node.js package manager) to your PATH
# KEEP IF: You use pnpm as your package manager
# REMOVE IF: You only use npm or yarn
# NOTE: The case statement prevents adding pnpm to PATH multiple times
# pnpm
export PNPM_HOME="/Users/grom/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ============================================================================
# API KEYS / SECRETS
# ============================================================================
# ⚠️  SECURITY: Never commit API keys or secrets to version control!
# 
# To add API keys or secrets:
# 1. Create a separate file: ~/.zsh_secrets (or ~/.secrets)
# 2. Add your keys there: export GEMINI_API_KEY="your-key-here"
# 3. Source it here: [ -r ~/.zsh_secrets ] && source ~/.zsh_secrets
# 4. Add ~/.zsh_secrets to your .gitignore
#
# Example:
# [ -r ~/.zsh_secrets ] && source ~/.zsh_secrets
