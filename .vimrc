set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'natduca/quickopen'
Bundle 'scrooloose/syntastic'

" vim-scripts repos
Bundle 'bufkill.vim'
Bundle 'Tabular'
Bundle 'argtextobj.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'
let g:CommandTMaxFiles=30000
let g:CommandTMatchWindowAtTop=1
let g:CommandTCancelMap='<Esc>'
let g:CommandTMaxHeight=25

Bundle 'FSwitch'
augroup ccfiles
  au!
  au BufEnter *.cpp let b:fswitchdst = 'h,inl'
  au BufEnter *.cpp let b:fswitchlocs = '.'
  au BufEnter *.cc let b:fswitchdst = 'h,inl'
  au BufEnter *.cc let b:fswitchlocs = '.'
  au BufEnter *.mm let b:fswitchdst = 'h,inl'
  au BufEnter *.mm let b:fswitchlocs = '.'
augroup END
augroup hfiles
  au!
  au BufEnter *.h let b:fswitchdst = 'c,cc,cpp,mm'
  au BufEnter *.h let b:fswitchlocs = '.'
augroup END
let fsnonewfiles=1


Bundle 'binji/lucius'
colorscheme lucius

filetype plugin indent on

set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set softtabstop=2
set incsearch
set hlsearch
set wildmode=list:longest
set list
set listchars=tab:>-,trail:-
set cursorline
set number
set nobackup
set nowb
set noswapfile

" python tabstop was broken in a recent upgrade... (Vim 7.4?)
augroup pyfiles
  au!
  au BufEnter *.py set shiftwidth=2
  au BufEnter *.py set softtabstop=2
augroup END


autocmd WinEnter,BufWinEnter * match ErrorMsg '\%>80v.\+'
" Change the current directory for the buffer to its file's directory.
autocmd BufEnter * silent! lcd %:p:h

set laststatus=2
set statusline=%<\ %n:%t\ %m%r%y%=%-28.(Line:\ %l/%L,\ Col:\ %c%V\ (%P)%)
hi StatusLine ctermfg=Green
hi StatusLineNC ctermfg=Red

nmap <C-left> :bp<CR>
nmap <C-right> :bn<CR>
nmap <Leader>n :noh<CR>
nmap <Leader>o :FSHere<CR>
nmap <Leader>h :FSLeft<CR>
nmap <Leader>l :FSRight<CR>
nnoremap <Leader>w :%s/\s\+$//<cr>:let @/=''<cr>
noremap <C-K> :pyf /usr/lib/clang-format/clang-format.py<CR>
inoremap <C-K> <C-O>:pyf /usr/lib/clang-format/clang-format.py<CR>

syntax enable
