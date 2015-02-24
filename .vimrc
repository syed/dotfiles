" When started as "evim", evim.vim will already have done these settings.
call pathogen#incubate()
set t_Co=256
filetype off

syntax enable

filetype plugin indent on
set number
" Status line should appear all the time
set laststatus=2
" airline to use powerline fonts (note: install powerline fonts first)
" let g:airline_powerline_fonts = 1
let g:go_fmt_autosave = 0
" highlight search
set hlsearch
" better colors for highlight
hi Search ctermfg=black ctermbg=blue
