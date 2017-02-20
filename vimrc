set backspace=indent,eol,start
"molokai-----------------
syntax on
colorscheme molokai
set t_Co=256
"------------------------

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
set number
set cursorline
hi clear CursorLine
set autoindent
set noswapfile
set dictionary=/home/kr/dict/words
set tabstop=4
hi SpecialKey ctermfg=133
set list listchars=tab:>-
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap ( ()<Left>
inoremap <C-k> <C-x><C-k>
nnoremap <C-L> $
nnoremap <C-H> 0
"inoremapとset pasteの相性がよくないので注意

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
