" master option for vim features
set nocompatible

" panaggio: enable pathogen features
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" some regular options
set number        " show line numbers
set ruler         " show line,column
set hidden        " allows hiding buffers with changes
set expandtab     " turn tabs into spaces
set autoindent    " automatic indenting
set smartindent   " smart indenting 
set shiftwidth=2  " indent size on autoindent or >>
set tabstop=2     " tab display size 
set softtabstop=2 " tab size in insert mode (not indent)

syntax on         " enable syntax highlighting

" load filetype indents
if has("autocmd")
  filetype plugin indent on
endif
