
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  "Switch on highlighting the last used search pattern.
  set hlsearch
endif

"Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"--------------------
"END DEFAULT SETTINGS
"--------------------


"turn on syntax highlighting
syntax on

"plugins via VimPlug
call plug#begin('~/.vim/plugged/plug.vim')
    
    Plug 'arzg/vim-colors-xcode'
    
    Plug 'junegunn/goyo.vim'
   
    Plug 'scrooloose/nerdtree'
    
    "Plug 'vim-airline/vim-airline'
   
    "Plug 'vim-airline/vim-airline-themes'
    
    Plug 'dracula/vim'
 
    Plug 'arcticicestudio/nord-vim'

    "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    Plug 'plasticboy/vim-markdown'

    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()


set number

"set colourscheme
colorscheme xcodelight

"turn off background colour
"hi Normal guibg=NONE ctermbg=NONE

let g:airline_theme='light'

set t_Co=256

set rnu

let g:goyo_width='80%'

set expandtab
set tabstop=4
set shiftwidth=4


"toggle NERDTree with <control>o
map <C-p> :NERDTreeToggle<CR>


"prevent automatic line wrapping in .txt documents
set textwidth=0
set linebreak


"markdown settings
"  turn on concealing
"  turn off folding
autocmd FileType markdown set conceallevel=1
let g:vim_markdown_folding_disabled = 1


"move file backups to a separate location
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
"
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-m>'

:set guitablabel=%t
