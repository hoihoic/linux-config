syntax enable

set tabstop=4
set shiftwidth=4
set expandtab
set cindent

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 

function! OscYank()
    let b64 = system('base64', getreg('"'))
    let b64 = substitute(b64, '\n', '', 'g') " 줄바꿈 제거
    let osc52 = "\e]52;c;" . b64 . "\x07"
    call writefile([osc52], '/dev/tty', 'b') " 터미널로 직접 전송
endfunction

autocmd TextYankPost * if v:event.operator is 'y' | call OscYank() | endif

set number
filetype indent on
set autoindent
set grepprg=git\ grep\ -EHn\ $*
colorscheme default

set undofile
set undodir=~/.vim/undodir
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), "p")
endif

if has("mac") || has("macunix")
  set clipboard=unnamed 
elseif has("unix")
  set clipboard=unnamedplus 
elseif has("win32") || has("win64")
  set background=dark
  colorscheme solarized
endif
