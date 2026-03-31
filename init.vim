syntax enable

set tabstop=4
set shiftwidth=4
set expandtab
set cindent

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 
" Dart/Flutter 기본 설정
autocmd FileType dart setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType dart setlocal colorcolumn=80 " 가이드라인 (Dart 권장 라인 길이)

" 저장 시 자동으로 flutter format 실행 (매우 중요)
" 외부 명령어를 활용해 코드를 깔끔하게 유지합니다.
autocmd BufWritePost *.dart silent! !dart format %

set number
filetype indent on
set autoindent
set grepprg=git\ grep\ -EHn\ $*

set undofile
set undodir=~/.vim/undodir
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), "p")
endif

set notermguicolors

if has("mac") || has("macunix")
  set clipboard=unnamed 
  colorscheme default
elseif has("unix")
  set clipboard=unnamedplus 
  colorscheme default
elseif has("win32") || has("win64")
  set background=dark
  colorscheme solarized
endif

