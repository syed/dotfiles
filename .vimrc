" When started as "evim", evim.vim will already have done these settings.

nmap <F1> :ls <C-M>:e #<C-M>
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=eol,start

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
" set incsearch           " do incremental searching
set showmatch		" match (, [ and { with their closing counterparts
set smartindent
set softtabstop=4
set expandtab
set shiftwidth=4
set tabpagemax=15
set laststatus=2                                        
set statusline=\ %F%m%r%h\ %w\ \ Line:\ %l/%L:%c

echo v:fname_in

let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'
" if has("cscope")
" 	let cs_str = getcwd()
" 	let str_pos = match(cs_str, "usr.src")
" 	if str_pos == -1
" 		let str_pos = match(cs_str, "rs_")
" 	endif
" 	if str_pos != -1
" 		let dir_str = strpart(cs_str, str_pos, strlen(cs_str))
" 		let slash_pos = match(dir_str, "/")
" 		if slash_pos != -1
" 			let dir_str = strpart(dir_str, 0, slash_pos)
" 			let dir_str = dir_str . "/cscope.out"
" 			let cs_str = strpart(cs_str, 0, str_pos)
" 			let $CSCOPE_DB = cs_str . dir_str
" 			cs add $CSCOPE_DB
" 		endif
" 	endif
" endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
map ^O :!p4 edit %^[:set noro^[

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

au BufRead,BufNewFile *.dis set filetype=python 

syntax on
colorscheme delek
set number

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

"au CursorHold * call ShowBlockName('quiet')
"set foldmethod=indent 
nnoremap <space> za

vnoremap <space> zf

"double quote a word
nnoremap dq :silent! normal mpea"<Esc>bi"<Esc>`pl
