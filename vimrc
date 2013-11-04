set tabstop=4 shiftwidth=4 expandtab
set noautoindent nocindent smartindent
set list listchars=tab:_\ ,trail:_
set number ruler
set hlsearch
set wildmode=list,full
set foldmethod=indent nofoldenable
set backspace=indent,eol,start
set equalprg=perltidy\ -l=0\ -pt=0
set keywordprg=say
set hidden
set complete+=k
set dictionary=
colorscheme sand
syntax on
filetype on
filetype plugin indent on

let mapleader="\\"

" Typo safety for JIS keymap.
inoremap <C-@> <Nop>

nnoremap ZS :w<Cr>
nnoremap ZX :w<Cr>:sus<Cr>
nnoremap ZD :w<Cr>:make<Cr><Cr>

noremap <Esc><Esc> <Esc><Esc>:nohlsearch<Cr><Esc>

"" Perl
nnoremap <Leader>pc :!perl -Ilib -wc %<Cr>
nnoremap <Leader>pe :!perl -Ilib %<Cr>
nnoremap <Leader>pd :!perl -Ilib -d %<Cr>
nnoremap <Leader>ph ggI#!/usr/bin/perl<Cr>use 5.10.0;<Cr>use utf8;<Cr>use strict;<Cr>use warnings;<Cr>use open qw( :utf8 :std );<Cr>use Data::Dumper;<Cr><Cr><Cr><Cr>exit;<Cr><C-g>k<C-g>k<C-g>k

"" R
"" following let way needs newer version than 7.3.762
"" let g:filetype_r="R"
au filetypedetect BufRead,BufNewFile *.R set ft=R

function! UnixMode()
    set tabstop=8 shiftwidth=8 noexpandtab
endfunction

function! CodingMode()
    set tabstop=4 shiftwidth=4 expandtab
endfunction

call CodingMode()

"" NeoBundle
"" https://github.com/Shougo/neobundle.vim
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'https://github.com/jimenezrick/vimerl.git'
NeoBundleCheck

" Help
" i_ctrl-r
" [i
" [I
" map-operator, omap-info
" i_ctrl-k

" Plugin
" https://github.com/tpope/vim-unimpaired
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
