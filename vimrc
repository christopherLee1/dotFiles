" for solarized colors
syntax enable
let g:solarized_termtrans=1
let  g:solarized_termcolors=256
set background=dark
colorscheme solarized

" settings I like
set ruler
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
" taken from
" https://unix.stackexchange.com/questions/104901/how-to-find-out-which-file-is-
" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%
" Change the highlighting so it stands out
hi statusline ctermbg=white ctermfg=black
set laststatus=2

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
