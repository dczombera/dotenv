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
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Surround your code :)
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler.git'
" Good looking bottom :)
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'elixir-lang/vim-elixir'
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

call vundle#end()            " required

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set viminfo^=!
filetype plugin indent on       " load file type plugins + indentation
set shell=/bin/sh               " Getting rvm, vim and zsh to work 

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

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
"colorscheme gruvbox 
"let g:rehash256=1
"set t_Co=256

syntax enable
set background=dark
colorscheme solarized

" Use ack instead of grep
set grepprg=ack

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" ELIXIR
let g:alchemist#elixir_erlang_src = '/usr/local/share/src'

" Settings for gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" Airline config
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set laststatus=2  " Always show status line.

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

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
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
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_erlang_checkers = ['escript']
let g:syntastic_enable_erlang_checker = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_javascript_checker = 1

" Gutentags 
let g:gutentags_cache_dir = '~/.tags_cache'

" Key mappings
" ***********
let mapleader = ","

" Get rid of arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Rubocop Shortcut(s) 
nmap <Leader>r :RuboCop<CR>

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" NERDTree mappings
map <Leader>nd :NERDTree<cr>

" Toggle of Tagbar window
nmap <F8> :TagbarToggle<CR>

" bufexplorer specific settings
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

" improve vim's startup 
" ref. https://stackoverflow.com/questions/9341768/vim-response-quite-slow/12141458#12141458
let g:ruby_path = system('rvm current')

:cd %:p:h

" Switch between the last two files
nnoremap <leader><leader> <c-^>

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

