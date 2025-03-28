set tabstop=4 shiftwidth=4 expandtab
set noautoindent nocindent smartindent
set list listchars=tab:_\ ,trail:_
set number ruler
set hlsearch
set wildmode=list,full
set foldmethod=indent nofoldenable
set backspace=indent,eol,start
set keywordprg=say
set hidden
"set complete+=k
"colorscheme sorbet
syntax on

let mapleader="\\"

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"

" open a file, create new if no file exists
map gf :e <cfile><CR>

" Typo safety for JIS keymap.
inoremap <C-@> <Nop>

" Enable delete key on Warp terminal
inoremap  <c-h>
cnoremap  <c-h>

nnoremap ZS :w<Cr>
nnoremap ZX :w<Cr>:sus<Cr>
nnoremap ZD :w<Cr>:make<Cr><Cr>

noremap <Esc><Esc> <Esc><Esc>:nohlsearch<Cr><Esc>

" *note* need more smart way.
function! ResetAutoCmd()
    set dictionary=
    set equalprg=
    set path=.,/usr/include,,
    set iskeyword-=:
endfunction

"" Perl
autocmd FileType perl call PerlStyle()
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl.template

function! PerlStyle()
    call ResetAutoCmd()
    nnoremap <Leader>c :!perl -Ilib -wc %<Cr>
    nnoremap <Leader>e :!perl -Ilib %<Cr>
    nnoremap <Leader>d :!perl -Ilib -d %<Cr>
    nnoremap <Leader>h ggI#!/usr/bin/perl<Cr>use 5.10.0;<Cr>use utf8;<Cr>use strict;<Cr>use warnings;<Cr>use open qw( :utf8 :std );<Cr>use Data::Dumper;<Cr><Cr><Cr><Cr>exit;<Cr><C-g>k<C-g>k<C-g>k
    set dictionary=~/.vim/dictionary/perl.dict
    set equalprg=perltidy\ -l=0\ -pt=0
    set path+=lib/**,t/**
    " *note* this will not restore when leave from perl filetype.
    set iskeyword+=:
    setlocal spellfile=~/.vim/spell/perl.add
    abbr fori for ( my $i = 0; $i < TODO; ++$i ) {<CR>} <c-o>:normal! xO<cr>
    abbr forj for ( my $j = 0; $j < TODO; ++$j ) {<CR>} <c-o>:normal! xO<cr>
    abbr fork for ( my $k = 0; $k < TODO; ++$k ) {<CR>} <c-o>:normal! xO<cr>
endfunction

"" R
"" following let way needs newer version than 7.3.762
"" let g:filetype_r="R"
autocmd filetypedetect BufRead,BufNewFile *.R set filetype=R
autocmd FileType R call RStyle()

function! RStyle()
    call ResetAutoCmd()
    set dictionary=~/.vim/dictionary/R.dict
    setlocal spellfile=~/.vim/spell/R.add
endfunction

"" Erlang
autocmd filetypedetect BufRead,BufNewFile *.hrl set filetype=erlang
autocmd filetypedetect BufRead,BufNewFile *.dtl set filetype=erlang
autocmd filetypedetect BufRead,BufNewFile *.app.src set filetype=erlang
autocmd FileType erlang call ErlangStyle()

function! ErlangStyle()
    call ResetAutoCmd()
    set dictionary=~/.vim/dictionary/erlang.dict
    set path+=src/**,include/**
    setlocal spellfile=~/.vim/spell/erlang.add
endfunction

function! UnixMode()
    set tabstop=8 shiftwidth=8 noexpandtab
endfunction

function! CodingMode()
    set tabstop=4 shiftwidth=4 expandtab
endfunction

call CodingMode()

filetype on
filetype plugin indent on

" Help
" i_ctrl-r
" [i
" [I
" map-operator, omap-info
" i_ctrl-k
" v_o
" @:
" i_ctrl-n, i_ctrl-p
" path+=
" auto marks
"   jumped: ''
"   modified: ',
"   inserted: '^
"   yanked: '[  ']
"   selected: '<    '>
" register
"   "%
"   "#
"   ".
"   ":
"   "/
" '<,'> normal @a
" i ctrl-x ctrl-l
" i ctrl-x ctrl-k
" i ctrl-x s
" zg, zw, z=, ]s, [s
