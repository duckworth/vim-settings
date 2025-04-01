#!/bin/bash

# Cleanup script for Vim configuration reset
# This script removes all plugin data and settings while preserving Git structure

set -e  # Exit on any error

# Check if --full flag is provided
FULL_CLEANUP=0
if [ "$1" == "--full" ]; then
  FULL_CLEANUP=1
  echo "Performing full cleanup (including vim-plug and all plugins)..."
else
  echo "Performing standard cleanup (use --full for complete reset)..."
fi

echo "Starting cleanup process..."

# Create backup of critical files
BACKUP_DIR=~/.vim_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"
echo "Created backup directory: $BACKUP_DIR"

# Backup vimrc and gvimrc
if [ -f ~/.vimrc ]; then
  cp ~/.vimrc "$BACKUP_DIR/vimrc.backup"
  echo "Backed up ~/.vimrc"
fi

if [ -f ~/.gvimrc ]; then
  cp ~/.gvimrc "$BACKUP_DIR/gvimrc.backup"
  echo "Backed up ~/.gvimrc"
fi

# Remove existing symlinks
if [ -L ~/.vimrc ]; then
  rm ~/.vimrc
  echo "Removed ~/.vimrc symlink"
fi

if [ -L ~/.gvimrc ]; then
  rm ~/.gvimrc
  echo "Removed ~/.gvimrc symlink"
fi

# Clean up bundle directory (old Pathogen plugins)
if [ -d bundle ]; then
  rm -rf bundle
  mkdir -p bundle
  echo "Cleaned up bundle directory"
fi

# Remove Pathogen
if [ -f autoload/pathogen.vim ]; then
  rm autoload/pathogen.vim
  echo "Removed Pathogen"
fi

# Clean up vim-plug plugins if full cleanup requested
if [ $FULL_CLEANUP -eq 1 ] && [ -d plugged ]; then
  rm -rf plugged
  echo "Removed vim-plug plugins directory"
fi

# Clean up vim-plug if full cleanup requested
if [ $FULL_CLEANUP -eq 1 ] && [ -f autoload/plug.vim ]; then
  rm -f autoload/plug.vim
  echo "Removed vim-plug"
fi

# Clean up temporary files
rm -f .netrwhist
rm -rf tmp/*
echo "Removed temporary files"

# Create necessary directories
mkdir -p autoload plugged tmp
echo "Created necessary directories"

# Download vim-plug
curl -fLo autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Downloaded vim-plug to autoload/plug.vim"

# Create symlinks for vimrc and gvimrc
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
echo "Created new symlinks for vimrc and gvimrc"

echo ""
echo "Cleanup complete! Your Vim configuration has been reset."
echo "Your old configuration files were backed up to $BACKUP_DIR"
echo ""
echo "Next steps:"
echo "1. Run 'vim' to start Vim with the new configuration"
echo "2. Vim-plug will automatically install the plugins on first launch"
echo "" 