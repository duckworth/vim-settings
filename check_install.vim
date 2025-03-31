" Check Installation Script
" Run with: vim -u check_install.vim

" Verify vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  echohl ErrorMsg
  echo "ERROR: vim-plug is not installed"
  echohl None
else
  echohl MoreMsg
  echo "vim-plug: OK"
  echohl None
endif

" Check if configuration files are properly linked
if !filereadable(expand('~/.vimrc'))
  echohl ErrorMsg
  echo "ERROR: ~/.vimrc does not exist"
  echohl None
else
  if resolve(expand('~/.vimrc')) != resolve(expand('~/.vim/vimrc'))
    echohl ErrorMsg
    echo "ERROR: ~/.vimrc is not linked to ~/.vim/vimrc"
    echohl None
  else
    echohl MoreMsg
    echo "vimrc symlink: OK"
    echohl None
  endif
endif

if !filereadable(expand('~/.gvimrc'))
  echohl WarningMsg
  echo "WARNING: ~/.gvimrc does not exist"
  echohl None
else
  if resolve(expand('~/.gvimrc')) != resolve(expand('~/.vim/gvimrc'))
    echohl WarningMsg
    echo "WARNING: ~/.gvimrc is not linked to ~/.vim/gvimrc"
    echohl None
  else
    echohl MoreMsg
    echo "gvimrc symlink: OK"
    echohl None
  endif
endif

" Check if temp directory exists
if !isdirectory(expand('~/.vim/tmp'))
  echohl WarningMsg
  echo "WARNING: ~/.vim/tmp directory does not exist"
  echohl None
else
  echohl MoreMsg
  echo "tmp directory: OK"
  echohl None
endif

" Check for common tools
let has_git = executable('git')
let has_curl = executable('curl')

if !has_git
  echohl ErrorMsg
  echo "ERROR: git is not available in PATH"
  echohl None
else
  echohl MoreMsg
  echo "git: OK"
  echohl None
endif

if !has_curl
  echohl ErrorMsg
  echo "ERROR: curl is not available in PATH"
  echohl None
else
  echohl MoreMsg
  echo "curl: OK"
  echohl None
endif

echo "\nConfiguration check complete."
echo "If you see any errors above, please fix them before continuing."
echo "If everything looks good, you can exit this screen and start Vim normally." 