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
" highlight search
set hlsearch
" better colors for highlight
hi Search ctermfg=black ctermbg=blue
map <F5> /<C-r><C-w> <CR> :vim /<C-r><C-w>/g % \| copen <CR>


if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Spell check
  autocmd BufNewFile,BufRead *.tex setlocal spell
  hi clear SpellBad
  hi SpellBad cterm=underline

  let g:gofmt_command = ‘goimports‘
  autocmd BufWritePre *.go Fmt


endif
