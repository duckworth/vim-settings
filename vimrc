" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

" Initialize vim-plug (replaces pathogen)
" Automatically install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins
call plug#begin('~/.vim/plugged')

" Syntax and language support
Plug 'sheerun/vim-polyglot'                 " Language pack that includes most languages

" File navigation and project management
Plug 'preservim/nerdtree'                   " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder
Plug 'junegunn/fzf.vim'                     " FZF integration

" Git integration
Plug 'tpope/vim-fugitive'                   " Git wrapper

" Ruby and Rails
Plug 'tpope/vim-rails'                      " Rails support

" Editing enhancements
Plug 'tpope/vim-repeat'                     " Repeat plugin maps
Plug 'tpope/vim-surround'                   " Surround text objects
Plug 'junegunn/vim-easy-align'              " Align text (maintained version)
Plug 'tomtom/tcomment_vim'                  " Comment code (maintained version)
Plug 'scrooloose/nerdcommenter'             " Code commenter

" Tab completion
Plug 'ervandew/supertab'                  " Tab completion (maintained version)

" Testing
Plug 'vim-test/vim-test'                    " Modern test runner for various languages

" Themes and colors
Plug 'tpope/vim-vividchalk'                 " Color scheme
Plug 'altercation/vim-colors-solarized'     " Solarized color scheme
Plug 'nanotech/jellybeans.vim'              " Jellybeans color scheme
Plug 'vim-scripts/twilight'                 " Twilight color scheme
Plug 'vim-scripts/vilight.vim'              " Vilight color scheme
Plug 'vim-airline/vim-airline'              " Status line enhancement
Plug 'vim-airline/vim-airline-themes'       " Themes for airline

" Programming utilities
Plug 'vim-scripts/dbext.vim'                " Database tool
Plug 'jlanzarotta/bufexplorer'              " Buffer explorer (maintained version)
Plug 'motus/pig.vim'                        " Pig Latin syntax (maintained)
Plug 'dln/avro-vim'                         " Avro support

" Additional utilities
Plug 'tpope/vim-unimpaired'                 " Paired mappings
Plug 'mattn/webapi-vim'                     " Web API client
Plug 'mattn/gist-vim'                       " Gist integration
Plug 'airblade/vim-gitgutter'               " Git diff in the gutter

" Modern additions
Plug 'jiangmiao/auto-pairs'                 " Auto-close brackets, quotes, etc.

" LSP Support - vim-lsp instead of CoC
Plug 'prabirshrestha/vim-lsp'               " Lightweight native LSP client
Plug 'prabirshrestha/asyncomplete.vim'      " Async completion
Plug 'prabirshrestha/asyncomplete-lsp.vim'  " LSP source for asyncomplete

" TypeScript and React
Plug 'leafgarland/typescript-vim'           " TypeScript syntax
Plug 'peitalin/vim-jsx-typescript'          " TSX/JSX syntax

" Enhanced Ruby support
Plug 'vim-ruby/vim-ruby'                    " Better Ruby support
Plug 'tpope/vim-bundler'                    " Bundler integration
Plug 'tpope/vim-endwise'                    " Auto-add end to Ruby blocks

" Python
Plug 'vim-python/python-syntax'             " Enhanced Python syntax
Plug 'Vimjas/vim-python-pep8-indent'        " PEP8 indentation

" Advanced Git
Plug 'tpope/vim-rhubarb'                    " GitHub integration
Plug 'junegunn/gv.vim'                      " Git commit browser

call plug#end()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showmode                      " Display the mode you're in.
set showcmd                       " Display incomplete commands.

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

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs (uncommented as per action plan)

set laststatus=2                  " Show the status line all the time

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

" Set colorscheme - safely handle first run before plugins are installed
set t_Co=256
try
  colorscheme jellybeans
catch /^Vim\%((\a\+)\)\=:E185/
  " If jellybeans isn't available, use a default color scheme
  colorscheme default
  " Add autocmd to apply jellybeans after the plugins are installed
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
endtry

"map leader to comma
let mapleader = ","

" Tab mappings.
"map <leader>tt :tabnew<cr>
map <leader>te :tabedit<CR>
map <leader>tc :tabclose<CR>
map <leader>to :tabonly<CR>
map <leader>tn :tabnext<CR>
map <leader>tp :tabprevious<CR>
map <leader>tf :tabfirst<CR>
map <leader>tl :tablast<CR>
map <leader>tm :tabmove<CR>
"imap <Tab> <C-N>
"imap <S-Tab> <C-P>
"vmap <Tab> >gv
"vmap <S-Tab> <gv
"nmap <S-Tab> <C-W><C-W>

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
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
"map <Leader>n :NERDTreeToggle<CR>
" don't open nerdtree on directory opens
let NERDTreeHijackNetrw=0 

nnoremap <silent> <leader>n :silent :nohlsearch<CR>

" dbext settings
let g:dbext_default_type   = 'MYSQL'

"let g:dbext_default_use_sep_result_buffer = 1

let g:sql_type_default = 'mysql'

" highlight tabs and trailing spaces
"set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<,nbsp:+
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
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
nnoremap <F3> :let @b=&number<CR>:set nonumber<CR>:redir @a<CR>:g//<CR>:redir END<CR>:let &number=@b<CR>:new<CR>:put! a<CR><CR>

" FZF mappings (replaces FuzzyFinder)
nnoremap <leader>f :Files<CR>  
nnoremap <leader>o :GFiles<CR>
nnoremap <leader>d :Files %:h<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>j :Lines<CR>

" pretty print format json
"Run this command in shell 
"sudo cpan JSON::XS
nnoremap <leader>pj2  <Esc>:%!json_xs -f json -t json-pretty<CR>:set filetype=json<CR>
nnoremap <leader>pj3  <Esc>:%!jq '.'<CR>:set filetype=json<CR>
nnoremap <Leader>pj4444 <Esc>:%!python2 -m json.tool<CR>:set filetype=json<CR>
" alternative format JSON
nnoremap <Leader>pj <Esc>:%!ruby -rjson -e 'puts JSON.pretty_generate(JSON.load($<))'<CR>:set filetype=json<CR>
nnoremap <Leader>py <Esc>:%!ruby -ryaml -e 'puts YAML.load($<).to_yaml'<CR>:set filetype=yaml<CR>

"pretty format xml
nnoremap <Leader>px <Esc>:%!ruby -W0 ~/.vim/xmlformat.rb<CR>:set filetype=xml<CR>
nnoremap <Leader>px2 <Esc>:%!~/.vim/xmlformat.pl<CR>:set filetype=xml<CR> 
"prety html
nnoremap <Leader>ph <Esc>:%!tidy -q -i --wrap 120 --show-errors 0<CR>:set filetype=html<CR>
"map <Leader>ph <Esc>:%!tidy -q -i --show-errors 0 2>/dev/null<CR>:set filetype=html<CR>
" disable json conceal quotes
let g:vim_json_syntax_conceal = 0

" operations such as yy, D, and P work with the OS clipboard
set clipboard=unnamed


"highlight current line
:set cursorline
":set cursorcolumn

"man in vim (Type :Man foo)
runtime! ftplugin/man.vim

" Make sure directory for vim temp files exists
if !isdirectory($HOME.'/.vim/tmp')
  call mkdir($HOME.'/.vim/tmp', 'p')
endif

" vim-easy-align configuration
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-test configuration
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>

" Airline configuration
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" If you still see strange characters, uncomment these lines:
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" vim-lsp configuration
" Enable lsp status in airline 
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1

" Register language servers

" Ruby (Solargraph)
if executable('solargraph')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->['solargraph', 'stdio']},
        \ 'whitelist': ['ruby'],
        \ })
endif

" Python (pyls)
if executable('pyls')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" JavaScript/TypeScript (typescript-language-server)
if executable('typescript-language-server')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'],
        \ })
endif

" LSP Keybindings
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition)
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> K <Plug>(lsp-hover)
nmap <silent> <leader>rn <Plug>(lsp-rename)
nmap <silent> <leader>qf <Plug>(lsp-code-action)
nmap <silent> ]g <Plug>(lsp-next-diagnostic)
nmap <silent> [g <Plug>(lsp-previous-diagnostic)

" asyncomplete configuration
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" Use SuperTab for completion navigation
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Enhanced Python syntax
let g:python_highlight_all = 1
