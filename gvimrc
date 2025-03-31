" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" Font - try JetBrains Mono first, fall back to Menlo if not available
if has("gui_macvim")
  set guifont=JetBrains\ Mono:h13,Menlo:h12
else
  set guifont=JetBrains\ Mono\ 13,Menlo\ 12
endif


" Color scheme - uncomment your preferred scheme
"colorscheme jellybeans
"colorscheme solarized

" No audible bell
set vb

" No toolbar
set guioptions-=T

set antialias                     " MacVim: smooth fonts.

" Remove scrollbars
set guioptions-=r                 " Don't show right scrollbar
set guioptions-=L                 " Don't show left scrollbar
set guioptions-=b                 " Don't show bottom scrollbar

set guioptions+=k " Keep the window size when adding/removing UI elements

"set guifont=Andale\ Mono:h14            " Font family and font size.
"set encoding=utf-8                " Use UTF-8 everywhere.
"set guioptions-=T                 " Hide toolbar.
" set background=light              " Background.
"set lines=60 columns=120          " Window dimensions.
