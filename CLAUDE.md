# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository with configurations for multiple shells (Zsh, Fish, Bash), editors (Vim, Emacs), and development tools. The repository uses a make-based installation system for managing symlinks.

## Common Commands

### Installation and Management
```bash
# Install dotfiles (creates symlinks)
make install

# Uninstall dotfiles (removes symlinks)
make uninstall

# After installation, add private git configuration
echo "email = your-email@example.com" >> ~/.secretrc
```

### Testing Changes
```bash
# Test Fish shell configuration
fish -c "source ~/.config/fish/config.fish"

# Test Zsh configuration
zsh -c "source ~/.zshrc"

# Reload tmux configuration
tmux source-file ~/.tmux.conf
```

## Architecture and Organization

### Directory Structure Pattern
- **Direct dotfiles**: Files prefixed with `.` go directly to home directory (e.g., `.gitconfig` → `~/.gitconfig`)
- **Config directory items**: Non-dotfiles go to `~/.config/` (e.g., `fish/` → `~/.config/fish/`)
- **Shell-specific helpers**: `zsh.d/` contains modular Zsh functions and configurations

### Key Components

1. **Shell Configurations**
   - `config.fish` and `fish/`: Fish shell with custom functions for git, navigation, and prompts
   - `.zshrc` and `zsh.d/`: Zsh with extensive helper functions and FZF integration
   - `.bashrc` and `.bash_profile`: Basic Bash configuration

2. **Editor Configurations**
   - `.vimrc` and `vim/`: Comprehensive Vim setup with language-specific configurations
   - `.emacs` and `emacs/`: Emacs configuration with custom modes

3. **Terminal and Tools**
   - `kitty.conf`: Kitty terminal with Intel One Mono font and Afterglow theme
   - `.tmux.conf`: Tmux configuration for session management
   - `.gitconfig`: Extensive git aliases and interactive branch selection

### Important Patterns

1. **Optional Sourcing**: Uses `[ -f file ] && source file` pattern for optional configurations
2. **Secret Management**: Private settings (git email) stored in `~/.secretrc`, not in repository
3. **Interactive Git Helpers**: Custom functions for branch selection using FZF/peco
4. **Language Support**: Dedicated configurations for Perl, R, and Erlang development

### Customization Points

- **Git email**: Set in `~/.secretrc` after installation
- **Shell prompt**: Customizable in `fish/functions/fish_prompt.fish`
- **Path additions**: Modified in respective shell configuration files
- **FZF/peco preference**: Functions check for availability and use preferred tool

## Development Notes

- Fish functions are individual files in `fish/functions/`
- Zsh helpers are modular files in `zsh.d/`
- Git configuration uses `[include]` directive for private settings
- Makefile handles all symlink creation and cleanup operations