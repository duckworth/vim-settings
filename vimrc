" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l/%L,%c-%v\ %)%P

set history=1000
set autoread
set fileformats+=mac
set tabpagemax=50
set nrformats-=octal


if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" soloarized options
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_degrade=1
"set background=dark

"colorscheme solarized
"colorscheme xoria256
"let g:jellybeans_use_lowcolor_black=1
set t_Co=256
colorscheme jellybeans

"map leader to comma
let mapleader = ","

" Tab mappings.
"map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
"imap <Tab> <C-N>
"imap <S-Tab> <C-P>
"vmap <Tab> >gv
"vmap <S-Tab> <gv
"nmap <S-Tab> <C-W><C-W>
" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec


"NERDTree settings
let g:NERDTreeWinPos = "left"
map <leader>nf :NERDTreeFind<cr>
map <F2> :NERDTreeToggle<CR>
"map <Leader>n :NERDTreeToggle<CR>
" don't open nerdtree on directory opens
let NERDTreeHijackNetrw=0 

nmap <silent> <leader>n :silent :nohlsearch<CR>

" dbext settings
let g:dbext_default_type   = 'MYSQL'

"let g:dbext_default_use_sep_result_buffer = 1

let g:sql_type_default = 'mysql'

" highlight tabs and trailing spaces
set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<,nbsp:+
" set list

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"syntax
au BufRead,BufNewFile *.pig set filetype=pig

au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl
au BufRead,BufNewFile *.template setfiletype json
"
" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"output the :g/pattern/ results to a new window. explanation:
":redir @a         redirect output to register a
":g//              repeat last global command
":redir END        end redirection
":new              create new window
":put! a           paste register a into new window
"nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>
" Turn off line numbers, do g//, restore previous state.
nmap <F3> :let @b=&number<CR>:set nonumber<CR>:redir @a<CR>:g//<CR>:redir END<CR>:let &number=@b<CR>:new<CR>:put! a<CR><CR>

" fuzzy finder
nmap <leader>f :FufFile<CR>  
nmap <leader>o :FufCoverageFile<CR>
nmap <leader>d :FufFileWithCurrentBufferDir<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>t :FufTaggedFile<CR>
noremap <leader>j :FufLine<CR>
nmap <S-F2>  :FufRenewCache<CR>


" pretty print format json
"Run this command in shell 
"sudo cpan JSON::XS
map <leader>pj2  <Esc>:%!json_xs -f json -t json-pretty<CR>:set filetype=json<CR>
" alternative format JSON
map <Leader>pj <Esc>:%!python -m json.tool<CR>:set filetype=json<CR>

"pretty format xml
map <Leader>px <Esc>:%!ruby ~/.vim/xmlformat.rb<CR>:set filetype=xml<CR>
"prety html
map <Leader>ph <Esc>:%!tidy -q -i --wrap 120 --show-errors 0<CR>:set filetype=html<CR>
"map <Leader>ph <Esc>:%!tidy -q -i --show-errors 0 2>/dev/null<CR>:set filetype=html<CR>


" operations such as yy, D, and P work with the OS clipboard
set clipboard=unnamed
"command abbreviations
:ca W w

"highlight current line
:set cursorline
":set cursorcolumn

"man in vim (Type :Man foo)
runtime! ftplugin/man.vim
