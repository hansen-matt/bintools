set nocompatible

"map F1 to toggle search highlighting on and off
map <F6> :set hlsearch!<CR>
imap <F6> <ESC>:set hlsearch!<CR>a

map <F7> :set syntax=c<CR>
imap <F7> <ESC>:set syntax=c<CR>a

set pastetoggle=<F2>

map <F3> :cp<CR> 
map <F4> :cn<CR> 


" Enable 'in-column' up and down motion in INSERT mode on wrapped lines
imap <silent> <Up>   <C-o>gk
imap <silent> <Down> <C-o>gj

" Enable 'in-column' up and down motion on wrapped lines
map <silent> <Up>   gk
map <silent> <Down> gj

syntax on

" make the window title reflect the file being edited
set title
set titlestring=VIM:\ %F

set laststatus=2

set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time

" 3 characters for tabs
set tabstop=2
set shiftwidth=2

" backspace should delete
set backspace=2

" Set backup location and enable
set backupdir=/home/matt/.vim/backup//,/tmp
set backup
set writebackup

" Set swap directory
set directory=/home/matt/.vim/swap//,/tmp

" Save undu history
set undofile
set undodir=/home/matt/.vim/undo//,/tmp
set undolevels=1000
set undoreload=10000

" filename tab complete
set wildmode=longest,list,full

" Set searching preferences
set incsearch		" do incremental searching
set ignorecase
set smartcase
set showmatch
set nohlsearch

" Detect files that have changed
set autoread
au FocusGained,BufEnter * :checktime

set showcmd		" display incomplete commands
set comments=n:#,:%,fb:-,n:>nn:)
set comments+=b:\"
set esckeys
set fileformat=unix
set report=0
set shell=bash
set showmode
set nostartofline
set linebreak
set so=3
set nospell
set nofoldenable 
set foldmethod=syntax
set foldlevel=0
set foldlevelstart=0
set foldnestmax=6
set expandtab

"save/load fold state
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

set autoindent

colorscheme elflord

"" Only do this part when compiled with support for autocommands.
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

	set autoindent		" always set autoindenting on

endif " has("autocmd")


