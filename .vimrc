set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/restore_view.vim'
call vundle#end()
filetype plugin indent on

set viewoptions=cursor,folds,slash,unix

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
let g:UltiSnipsSnippetsDir="/home/nava/.vim/mysnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ ]
let g:ycm_autoclose_preview_window_after_completion=1

let g:vimtex_fold_enabled=1

syntax enable

colorscheme elflord

set pastetoggle=<F8>
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set cursorline
"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline

au BufRead,BufNewFile *.tex setlocal textwidth=74 wrap iskeyword+=:,- spell
augroup vimrc_autocmds
    autocmd BufEnter *.tex highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter *.tex match OverLength /\%74v.*/
augroup END

command CEWS %s/\s\+$//e
command CEWSS s/\s\+$//e
nmap tt {V}gq

