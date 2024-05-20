syntax enable

let lang_used = 'Python'
let platform_used = 'Linux'

set tabstop=4
set shiftwidth=4

if lang_used == 'Python'
  set expandtab
elseif lang_used == 'C++'
  set cindent

set number
filetype indent on
set autoindent
set grepprg=git\ grep\ -EHn\ $*
colorscheme default

colorscheme default
if platform_used == 'Windows'
  set background=dark
  colorscheme solarized
endif

