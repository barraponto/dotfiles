" master option for vim features
set nocompatible

" panaggio: enable pathogen features
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" janus: allow backspacing over everything in insert mode
set backspace=indent,eol,start 

" barraponto: some regular options
set number        " show line numbers
set ruler         " show line,column
set wrap          " visually wrap lines
set linebreak     " wrap only on word boundaries
set hidden        " allows hiding buffers with changes
set expandtab     " turn tabs into spaces
set autoindent    " automatic indenting
set smartindent   " smart indenting 
set shiftwidth=2  " indent size on autoindent or >>
set tabstop=2     " tab display size 
set softtabstop=2 " tab size in insert mode (not indent)
set mouse=a       " enable mouse usage 

" debian: set lower priority suffixes
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" janus: search options
set hlsearch      " highlights search results
set incsearch     " incremental search results
set ignorecase    " ignores case when searching 
set smartcase     " only ignores cases on smallcaps

" enable syntax for the win
syntax on         " enable syntax highlighting

" panaggio: load filetype indents
if has("autocmd")
  filetype plugin indent on

  " archlinux: jump to last known cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" enable sql and html inside php
let php_sql_query = 1
let php_htmlInStrings = 1
