set tabstop=4 shiftwidth=4 expandtab
set noautoindent nocindent smartindent
set list listchars=tab:_\ ,trail:_
" set visualbell
" visualbell is too slow.
set number ruler
set hlsearch
set foldmethod=indent nofoldenable
set backspace=indent,eol,start
set equalprg=perltidy\ -l=0\ -pt=0
set keywordprg=say
colorscheme sand
syntax on

let mapleader = "\\"

" Insert mode
" Typo safety for JIS keymap.
inoremap <C-@> <Nop>

"" Normal mode
nnoremap <Leader>e :e $MYVIMRC<Cr>
nnoremap <Leader>b :ls<Cr>:b 
nnoremap <C-@> @@
nnoremap ZX :w<Cr>

"" vim
noremap <Esc><Esc> <Esc><Esc>:nohlsearch<Cr><Esc>

"" shell
nnoremap <Leader>ex :!./%<Cr>
nnoremap <Leader>ee :!chmod +x %<Cr>
nnoremap <Leader>fmkdir :!mkdir %:r<Cr>
nnoremap <Leader>fe :e %:h/
nnoremap <Leader>fce :e %:r/

"" Perl
nnoremap <Leader>pc :!perl -Ilib -wc %<Cr>
nnoremap <Leader>pe :!perl -Ilib %<Cr>
nnoremap <Leader>pd :!perl -Ilib -d %<Cr>
nnoremap <Leader>ph ggI#!/usr/bin/perl<Cr>use 5.10.0;<Cr>use utf8;<Cr>use strict;<Cr>use warnings;<Cr>use open qw( :utf8 :std );<Cr>use Data::Dumper;<Cr><Cr><Cr><Cr>exit;<Cr><C-g>k<C-g>k<C-g>k

" " Python
" noremap ,ye <Esc>:!python %<Cr>
" noremap ,yc <Esc>:!pyflakes %<Cr>
" 
" " PHP
" noremap ,he <Esc>:!php %<Cr>
" noremap ,hc <Esc>:!php -l %<Cr>
" 
" " Ruby
" noremap ,re <Esc>:!ruby -Ku %<Cr>
" noremap ,rc <Esc>:!ruby -Ku -c %<Cr>
" 
" " C
" noremap ,cd <Esc>:!gdb a.out<Cr>
" noremap ,ce <Esc>:!./a.out<Cr>
" 

" Help
" set rnu
" hl-LineNr
" i_ctrl-e
" i_ctrl-gj
" i_ctrl-gk
" i_ctrl-o
" i_ctrl-r
" i_ctrl-y
" [i
" [I

