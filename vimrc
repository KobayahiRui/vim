set nobackup
" 挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
autocmd FileType python setlocal includeexpr=FormatPyImport(v:fname) | setlocal path+=;/
function! FormatPyImport(str)
  return substitute(substitute(substitute(a:str, '^from \|^import ', '', ''), 'import \a\+', '', ''), '\.', '\/', 'g')
endfunction
" 「日本語入力固定モード」切り替えキー
inoremap <silent> <C-j> <C-^>
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set list listchars=tab:»-,extends:»,precedes:«,nbsp:%
set autoindent
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
set statusline+=[%l,%v]

" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
set noswapfile
" カーソルを自動的に()の中へ
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap // //<left>
imap /// ///<left>
set smartindent
set number
set ruler
set incsearch
set hlsearch
set showmatch
set tabstop=4
set paste
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast='normal'
"let g:solarized_visibility='normal'
syntax on
filetype plugin indent on
set background=dark
colorscheme molokai
set t_Co=256

