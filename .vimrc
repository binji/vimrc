set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug '~/.fzf'
Plug 'airblade/vim-gitgutter'
Plug 'binji/lucius'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/FSwitch'

call plug#end()

set t_Co=256
colorscheme lucius

filetype plugin indent on

set number
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set backspace=indent,eol,start
set whichwrap=b,s
set shortmess=aiT
set hlsearch
set incsearch
set ignorecase smartcase
set wildmode=list:longest
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set list
set listchars=tab:>-,trail:-
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set nobackup
set nowb
set noswapfile
set clipboard=unnamed
set cursorline

set statusline=%<\ %n:%t\ %m%r%y\ %{fugitive#statusline()}%=%-28.(Line:\ %l/%L,\ Col:\ %c%V\ (%P)%)

set pastetoggle=<F9>
set ttymouse=xterm2
set mouse=a
set nostartofline

" python tabstop was broken in a recent upgrade... (Vim 7.4?)
augroup pyfiles
  au!
  au BufEnter *.py set tabstop=2
  au BufEnter *.py set shiftwidth=2
augroup END

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

autocmd WinEnter,BufWinEnter * match ErrorMsg '\%>80v.\+'

hi StatusLine ctermfg=Green
hi StatusLineNC ctermfg=Red

" qq to record, Q to replay
nmap Q @q

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>

" ----------------------------------------------------------------------------
" matchit.vim
" ----------------------------------------------------------------------------
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" Open files
" ----------------------------------------------------------------------------
nnoremap <silent> <Leader><Leader> :FZF -m<CR>

" ----------------------------------------------------------------------------
" Select buffer
" ----------------------------------------------------------------------------
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m --prompt="Buf> "',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" ------------------------------------------------------------------------------
nmap <C-left> :bp<CR>
nmap <C-right> :bn<CR>
nmap <Leader>n :noh<CR>
nmap <Leader>o :FSHere<CR>
nnoremap <Leader>w :%s/\s\+$//<cr>:let @/=''<cr>
noremap <C-K> :pyf ~/clang-format.py<CR>
inoremap <C-K> <C-O>:pyf ~/clang-format.py<CR>
nnoremap <Leader>c :silent make\|redraw!\|cw<CR>

syntax enable
