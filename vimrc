"molokai-----------------
syntax on
colorscheme molokai
set t_Co=256
hi Comment ctermfg=102
hi Visual ctermfg=236
"------------------------
set backspace=indent,eol,start
"ステータスライン関連---------------
set statusline=%F
set statusline+=%m
set statusline+=%r
"これ以降右寄せ
set statusline+=%=
set statusline+=(%l,%c)
set statusline+=\ \[%l/%L]\    
set statusline+=[ENC=%{&fileencoding}]
set laststatus=2
"-----------------------------------
set fileencoding=utf-8
set clipboard=unnamedplus
set noswapfile
set number
"<>もカッコとしてハイライトする
set matchpairs& matchpairs+=<:>
hi clear CursorLine
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
"カッコを自動で閉じる
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
"inoremap < <><Left>
inoremap ( ()<Left>
inoremap <C-k> <C-x><C-k>
nnoremap <C-l> $
nnoremap <C-h> 0
nnoremap <F3> :noh<CR>
inoremap jj  <ESC>
"ファイルタイプによって辞書を変える------------
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal dictionary=~/dict/pyword.dict
    autocmd BufNewFile,BufRead *.c setlocal dictionary=~/dict/cword.dict
    autocmd BufNewFile,BufRead *.cpp setlocal dictionary=~/dict/cppword.dict
augroup END
"---------------------------------------------
"
"ペーストが綺麗にできる----------------
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
"--------------------------------------------


"dein----------------------------------------
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
"プラグイン-------------------------------------
call dein#add('Shougo/dein.vim')
call dein#add('nelstrom/vim-visual-star-search')
call dein#add('nathanaelkane/vim-indent-guides')

call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
"-------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
hi CursorLine term=reverse cterm=none ctermbg=17
hi MatchParen ctermbg=1
set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!
