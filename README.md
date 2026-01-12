# ZSH Configuration

My personal zsh configuration with detailed comments explaining each section.

## Features

- **Oh My Zsh** framework with git plugin
- **NVM** (Node Version Manager) support
- **pnpm** package manager configuration
- Custom aliases for quick access
- Detailed inline documentation for easy customization

## Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/Projects/zsh-config
   ```

2. Backup your existing `.zshrc`:
   ```bash
   mv ~/.zshrc ~/.zshrc.backup
   ```

3. Create a symlink to use this config:
   ```bash
   ln -s ~/Projects/zsh-config/.zshrc ~/.zshrc
   ```

   Or copy it directly:
   ```bash
   cp ~/Projects/zsh-config/.zshrc ~/.zshrc
   ```

4. Reload your shell:
   ```bash
   source ~/.zshrc
   ```

## Secrets Management

**Never commit API keys or secrets to this repository!**

To add secrets:
1. Create `~/.zsh_secrets` (or `~/.secrets`)
2. Add your keys: `export GEMINI_API_KEY="your-key-here"`
3. Uncomment the sourcing line in `.zshrc` if needed
4. Ensure `~/.zsh_secrets` is in your `.gitignore`

## Requirements

- zsh (usually pre-installed on macOS)
- Oh My Zsh (optional but recommended)
- NVM (if using Node.js version management)
- pnpm (if using pnpm package manager)

## License

Personal configuration - use as you wish!
