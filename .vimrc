set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Dependency managment
Plugin 'gmarik/Vundle.vim'
" Colorschemes
Plugin 'flazz/vim-colorschemes'
" Rails ftw
Plugin 'tpope/vim-rails'
" Rubocop
Plugin 'ngmy/vim-rubocop'
" Dependencies of snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Commenting and uncommenting stuff"
Plugin 'tomtom/tcomment_vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Surround your code :)
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler.git'
" RSpec runner
Plugin 'thoughtbot/vim-rspec'
" Good looking bottom :)
Plugin 'itchyny/lightline.vim'
" Git tools
Plugin 'tpope/vim-fugitive'
" Every one should have a pair (Autogenerate pairs for {[(  )]})
Plugin 'jiangmiao/auto-pairs'
" Tab completions
Plugin 'ervandew/supertab'
" CoffeeScript syntax
Plugin 'kchmck/vim-coffee-script'
" Fuzzu finder for vim (CTRL+P)
Plugin 'kien/ctrlp.vim'
" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
" Provides support for expanding abbreviations similar to emmet.
Plugin 'mattn/emmet-vim'
" Show documents in color
Plugin 'powerman/vim-plugin-AnsiEsc'
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
" Syntax highlighting and indenting for JSX
Plugin 'mxw/vim-jsx'
" Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plugin 'elzr/vim-json'
" Elixir Plugins
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
" Erlang Runtime
Plugin 'vim-erlang/vim-erlang-runtime'
" Erlang syntax checking and compiler
Plugin 'vim-erlang/vim-erlang-compiler'
" Syntax checking
Plugin 'vim-syntastic/syntastic'
" ctags
Plugin 'ludovicchabant/vim-gutentags'
" Browse the tags of the current file and get an overview of its structure
Plugin 'majutsushi/tagbar'
" Elixir Phoenix
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'
" Asynchronously runs programs using Neovim's or Vim's job-control functionality.
Plugin 'neomake/neomake'
" Wrapper for running tests on different granularities
Plugin 'janko-m/vim-test'
" A dark Vim/Neovim color schemeith colors inspired by the excellent One Dark
" syntax theme for the Atom text editor
Plugin 'joshdick/onedark.vim'
" Pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'
" Ruby syntax extensions for highlighting YARD documentation
Plugin 'sheerun/vim-yardoc'
" A vim plugin wrapper for prettier,
Plugin 'prettier/vim-prettier'
" Open and search devdocs
Plugin 'rhysd/devdocs.vim'
" Elm
Plugin 'elmcast/elm-vim' 
" Run your favorite search tool from vim
Plugin 'mileszs/ack.vim'

call vundle#end()            " required

set encoding=utf-8
set showcmd                     " display incomplete commands
set viminfo^=!
filetype plugin indent on       " load file type plugins + indentation
set shell=/bin/sh               " Getting rvm, vim and zsh to work 

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " by default a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
"" Custom indentation for javascript.jsx
autocmd Filetype javascript.jsx setlocal ts=4 sw=4 sts=0 expandtab 

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set number " Line numbers
set ruler  " Ruler on
set nowrap  " Line wrapping off
set smarttab
set autoindent
set showmatch
set mat=5  " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set visualbell t_vb=
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.

" Ruby Stuff
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" Backups & Files
set backup "Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

 autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

" Theme specific options 
" syntax enable
syntax on
colorscheme onedark 
" Colors for search highlight
" bg (background): magenta
" fg (foreground): black
" GUI 
hi Search guibg=#c678dd guifg=#282c34
" terminal
hi Search ctermfg=black ctermbg=magenta

"set background=dark
"colorscheme solarized

" Remove right scrollbar
set guioptions-=r 

" Use ack instead of grep
set grepprg=ack

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Elixir
let g:alchemist#elixir_erlang_src = '/usr/local/share/src'

" Settings for gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" Enable syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Airline config
"let g:airline_theme='onedark'
"let g:airline_powerline_fonts=1
"set laststatus=2  " Always show status line.
" Lightline config
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" Don't hide Json syntax.
"let g:vim_json_syntax_conceal = 0 
" Let vim-jsx handle JSX in `.js` files.
let g:jsx_ext_required = 0 
" Config for vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Recommended settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Rubocop config file
let g:vimrubocop_config = '/Users/dc/Developer/liqid/liqid-web-api/.rubocop.yml'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=0

" Line highlighting for Syntastic
"highlight SyntasticErrorLine guibg=#a00101 
"highlight SyntasticWarningLine guibg=#66653f

" Checker configuration for Syntastic 
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'rubylint']
let g:syntastic_enable_ruby_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_erlang_checkers = ['escript']
let g:syntastic_enable_erlang_checker = 1
let g:syntastic_javascript_checkers = []
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') !=# '' ? ['eslint'] : []
let g:syntastic_enable_javascript_checker = 1
let g:elm_syntastic_show_warnings = 1

" Disbale Syntastic by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Gutentags 
let g:gutentags_cache_dir = '~/.tags_cache'

" Key mappings
" ***********
let mapleader = ","

" YARD tags highlighting
hi link yardGenericTag rubyInstanceVariable

" Get rid of arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" NERDTree mappings
map <Leader>nd :NERDTree<cr>

" Toggle of Tagbar window
nmap <Leader>cv :TagbarToggle<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Clear last used search pattern
nmap <silent> <leader>c :let @/ = ""<CR>

" Rubocop Shortcut(s) 
nmap <Leader>r :RuboCop<CR>

" Error window for syntastic plugin
nmap <Leader>sc :lclose<CR>
nmap <Leader>sr :SyntasticCheck<CR> :lopen<CR>

" vim-test 
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" devdocs
nmap K <Plug>(devdocs-under-cursor)

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
" """"""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " " If you have .vim-swap in the current directory, it'll use that.
" " " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap/
set directory+=~/.vim/swap/
set directory+=~/tmp//
set directory+=.

" " viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  "" undofile - This allows you   to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " " :help undo-persistence
  " "     This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=.null/.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


" bufexplorer specific settings
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

" improve vim's startup 
" ref. https://stackoverflow.com/questions/9341768/vim-response-quite-slow/12141458#12141458
let g:ruby_path = system('rvm current')

:cd %:p:h

" ******************************
" Disable scrollbar in NERDtree
" ******************************
set guioptions-=L

"**************
" Font options 
" *************
set guifont=DejaVu\ Sans\ Mono:h13

" *****************************
" Shortcuts for switching tabs
" *****************************

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Set Initial Font Size when Window is Opened for the First Time
"function! FontChangeOnResize()
"    if &lines > 60 
"        set guifont=DejaVu\ Sans\ Mono:h18
"    else
"        set guifont=DejaVu\ Sans\ Mono:h12
"    endif
"endfunction
"autocmd VimResized * call FontChangeOnResize()
" Run Neomake on current file on every write.
autocmd! BufWritePost * Neomake

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ************
" * Grepping *
" ************

" bind K to grep word under cursor
noremap <Leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" ref: https://robots.thoughtbot.com/faster-grepping-in-vim#override-to-use-the-silver-searcher
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
