# Modern Vim Configuration

A modernized Vim configuration with carefully selected plugins and sensible defaults.

## Features

- **Modern Plugin Management**: Uses [vim-plug](https://github.com/junegunn/vim-plug) for efficient plugin management
- **Fuzzy Finding**: Integrated [FZF](https://github.com/junegunn/fzf) for fast file and buffer navigation
- **Git Integration**: Includes git support with fugitive and gitgutter
- **Syntax Highlighting**: Comprehensive language support via vim-polyglot
- **File Navigation**: Enhanced NERDTree setup with convenient mappings
- **Advanced Editing**: Text manipulation and code formatting
- **Beautiful UI**: Modern color schemes and airline status bar
- **Language Server Protocol**: Code intelligence via vim-lsp (lightweight native LSP client)
- **Modern Language Support**: Enhanced support for Ruby, TypeScript, React, and Python

## Quick Installation

```bash
# Change to your home directory
cd ~/

# Clone the repository
git clone https://github.com/duckworth/vim-settings.git ~/.vim

# Create symlinks for vimrc and gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Launch vim - plugins will be automatically installed on first startup
vim
```

## Migration from Old Setup

If you're updating from an older version of this configuration, you can use the included cleanup script:

```bash
cd ~/.vim
chmod +x cleanup.sh
./cleanup.sh
```

This script will:
1. Back up your existing configuration
2. Remove old Pathogen plugins and settings
3. Configure vim-plug and create necessary symlinks
4. Set up the directory structure for the new configuration

For a complete reset (including all vim-plug plugins), use:

```bash
./cleanup.sh --full
```

After running the script, simply start Vim and the plugins will be installed automatically.

## Manual Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/duckworth/vim-settings.git ~/.vim
   ```

2. Create symlinks:
   ```bash
   ln -s ~/.vim/vimrc ~/.vimrc
   ln -s ~/.vim/gvimrc ~/.gvimrc
   ```

3. Launch Vim. Vim-plug will automatically install itself and download all plugins on first startup.

## Setting up Language Servers

After installing the plugins, you need to install language servers for your development stack:

```bash
# For Ruby
gem install solargraph

# For Python
pip install 'python-language-server[all]'

# For JavaScript/TypeScript
npm install -g typescript typescript-language-server
```

These language servers provide support for:
- **solargraph**: Ruby
- **pyls**: Python
- **typescript-language-server**: JavaScript and TypeScript

The vim-lsp plugin will automatically detect and use these language servers when you open files of the corresponding types.

## Verifying Your Installation

To check if your installation is working correctly:

```bash
vim -u ~/.vim/check_install.vim
```

This will run a diagnostic script that verifies all components are properly installed.

## Key Mappings

Leader key is mapped to `,` (comma)

### File Navigation
- `,f` - Find files
- `,o` - Find Git files
- `,b` - List buffers
- `,d` - Files in current directory
- `F2` - Toggle NERDTree
- `,nf` - Find current file in NERDTree

### Tab Management
- `,te` - Tab edit
- `,tc` - Tab close
- `,to` - Tab only (close others)
- `,tn` - Next tab
- `,tp` - Previous tab
- `,tf` - First tab
- `,tl` - Last tab

### Code Intelligence (vim-lsp)
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation 
- `gr` - Find references
- `K` - Show documentation
- `,rn` - Rename symbol
- `,qf` - Code action
- `]g` - Next diagnostic
- `[g` - Previous diagnostic

### Code Formatting
- `,pj` - Format JSON
- `,py` - Format YAML
- `,px` - Format XML
- `,ph` - Format HTML

## Updating Plugins

To update all plugins, run this command in Vim:
```
:PlugUpdate
```

## Requirements

- Vim 8.0+ or Neovim
- Git
- curl
- Language servers for your development stack

## macOS Specific Setup

For macOS users, installing MacVim is recommended:
```bash
brew install macvim
```
