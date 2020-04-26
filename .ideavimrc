"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

" Use Vim settings, rather then Vi settings
" This must be first because it changes other options as a side effect.
set nocompatible

" Enabling fzf to be used within vim.
set rtp+=~/.fzf

" Automatic installation of vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================PLUGINS====================
call plug#begin()

    " Code/Project Navigation
    Plug 'dense-analysis/ale'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'majutsushi/tagbar'
    Plug 'KaraMCC/vim-gemini'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'sbdchd/vim-shebang'

    " Miscellaneous
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/limelight.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'mattn/emmet-vim'
    Plug 'luochen1990/rainbow'
    Plug 'camspiers/animate.vim'
    Plug 'camspiers/lens.vim'
    Plug 'reedes/vim-wheel'
    Plug 'junegunn/vim-emoji'

    " Language Specific
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'lepture/vim-jinja'
    Plug 'mitsuhiko/vim-python-combined'

    " Colors
    Plug 'arcticicestudio/nord-vim'
    Plug 'dylanaraps/wal.vim'

call plug#end()


" Load filetype-specific indent files.
filetype on
filetype plugin on
filetype plugin indent on


" ===================GENERAL CONFIG===================
set number relativenumber           " Hybrid numbers (set number & set relativenumber)
set fileformat=unix                 " For unix text files. Convert to 'Dos' for Windows.
set encoding=utf-8                  " Force UTF-8 encoding.
set cursorcolumn                    " Highlight the current column.
set cursorline                      " Focus on current line I'm working on.
set textwidth=80                    " Setting the textwidth to 80 characters.
set splitbelow                      " Open new panes to the right and bottom.
set splitright
set lazyredraw                      " Don't redraw while executing macros (helps performance).
set wildmode=longest,list,full      " Bash-like completion for file names.
set wildmenu
set background=dark                 " Vim uses colors that would look the best on a dark background.
set t_Co=256                        " Tell Vim to accept 256 colors.
set termguicolors
set ttyfast                         " Improves smoothness of redrawing.

syntax enable                       " Enable syntax processing.
highlight Comment ctermfg=green
colorscheme nord                    " Setting colorscheme nord.

" Italic comments (works when default vim is active as well).
highlight Comment cterm=italic gui=italic

" Syntax highlighting for Python files.
let python_highlight_all = 1


" ===================SWAPFILES===================
set noswapfile                      " No swap files.
set nobackup                        " No backup files.
set nowritebackup                   " No backup file while editing.


" ===================TEXT FORMATTING====================
set autoindent                      " Apply indentation of current line to the next line.
set smartindent                     " Reacts to the syntax/style of the code I am editing.
set smarttab                        " Smart handling of the <Tab> key.
set shiftwidth=4                    " Each indent will correspond to a single tab.
set softtabstop=4                   " Number of spaces inserted when <TAB> is pressed and also number of spaces deleted.
set tabstop=4                       " Number of visual spaces per <TAB>.
set expandtab                       " Convert tabs to spaces. AKA <TAB> means 'insert four spaces.'
set nowrap                          " Do not wrap lines.
set nofixendofline                  " Prevent vim from adding newlines to the end of files.
set spell spelllang=en_us           " Set spell check to English grammar.


" ==================UI SETTINGS========================
set ruler                           " Show current line number at the bottom.
set noshowmode                      " Do not show the current mode since Lightline does it automatically.
set showmatch                       " Shows matching pair of brackets (), [], {}.
set visualbell                      " No sounds.
set noerrorbells                    " Disable error bells.
set t_vb=                           " Disable flashing que.
" set title                         " Shows the current file path at the top of the window.
set notitle                         " Remove the 'Thanks for Flying Vim' message when the Powerline shell is enabled.


" ===================REMAPPINGS======================
" Change leader shortcut to comma instead of backslash.
let mapleader=","

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Remapped these letters to take me to normal mode
" when I am using insert mode.
inoremap jk <ESC>
inoremap jj <Esc>

" Highlight last inserted text.
nnoremap gV `[v`]

" Different key mappings for easy navigation between splits.
" Instead of C-W then j, it's just C-J.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" These keys (^ and $) still provide the same functions, but it will make it easier
" to move around by remapping them.
nnoremap B ^
nnoremap E $

" Insert pdb import statement when  <leader>p + SHIFT is pressed.
nnoremap <leader><S-p> Oimport pdb; pdb.set_trace()<Esc>

"Insert python shebang when <leader> + SHIFT + b is pressed."
nnoremap <leader><S-b> O#!/usr/bin/env python3<Esc>


" ===================SEARCH===========================
set incsearch                       " Find the next match as I search a word.
set hlsearch                        " Highlight searches by default.

" mapping ',q' to cancel hlsearch.
nmap ,q :nohlsearch<CR>

set ignorecase                      " Ignore case when searching...
set smartcase                       " Except when I include upper-case characters. /foo matches FOO and fOo, but /FOO only matches FOO.


" ===================TAGS==============================
set autochdir                       " If Vim doesn't find a tags file in the $PWD, recursively look inside of parent directory for the tags file.
set tags=tags;                      " Set tags=tags; tells vim that the name of my tags file will always be the same as the default tags generated by ctags.


" ===================GENERAL FUNCTIONS================


" ===================ALE (LINTING)=====================
" Allow ALE to continuously check my code.
let g:ale_sign_column_always = 1

" ===================AIRLINE============================
" Setting Powerline font style for Airline.
let g:airline_powerline_fonts = 1


" ==================BETTER WHITESPACE==================
" Setting a custom color for whitespace.
highlight ExtraWhitespace ctermbg=blue

" Enable highlighting and stripping whitepsace on save by default.
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" ==================DEVICONS=========================
" Force extra padding in NERDTree so that the filetype icons line up vertically.
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" ===================EMMET============================
" Enable Emmet for HTML/CSS files only.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Mapping the emmet leader key to ','.
let g:user_emmet_leader_key=','


" ==================EMOJI============================
" Use emojis as gitgutter symbols.
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')


" =================FZF================================
" Customize fzf colors to match my color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" =================GITGUTTER=========================
" Making sure the diff markers appear more quickly.
set updatetime=100

" To keep Vim extremely response, vim-gitgutter will suppress the signs
" when a file has more than 500 changes. As soon as the number of changes
" falls below the limit vim-gitgutter will show the signs again.
" Configure the threshold with:
let g:gitgutter_max_sings = 500

" By default the sign column will appear when there are signs to show and
" disappear when there aren't. To always have the sign column, add:
set signcolumn=yes


" ================LENS==============================
" When resizing, do not go beyond the following height.
let g:lens#height_resize_max = 30

" When resizing do not go beyond the following width
let g:lens#width_resize_max = 30


" ===============LIMELIGHT=========================
" Paragraphs not being focused on will be in gray.
let g:limelight_conceal_ctermfg='gray'

" Setting highlight priority to -1. This will not overrule hlsearch.
let g:limelight_priority=-1


" ===================NERDTree==========================
" NERDTree Toggle with Ctrl+n
nmap <C-n> :NERDTreeToggle<CR>

" Automatically open NERDTree when Vim starts
" au VimEnter *  NERDTree

" Switch the cursor to the file editing area rather than in the NERDTree buffer.
" autocmd VimEnter * NERDTree | wincmd p

" Set the NERDTree window size to 30.
let g:nerdtreewinsize=30

" Will allow Startify to work when NERDTree opens automatically.
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Close Vim if the only window open is NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ===================NORD=============================
" Background of line numbers for the currently active cursor are not styled.
" Changing to use the same background color highlighting like the background
" of the active cursor line.
let g:nord_cursor_line_number_background = 1

" Vertically split buffers using a bolder style.
let g:nord_bold_vertical_split_line = 1

" Enabling italics within the Nord colorscheme
let g:nord_italic = 1

" Enabling italic comments while using the Nord colorscheme.
let g:nord_italic_comments = 1


" =================RAINBOW==========================
" Activate rainbow parentheses.
let g:rainbow_active = 1


" ================SHEBANG===========================
" Automatically adding shebang at the top of the file whenever a file is created.
au! BufNewFile * ShebangInsert

" Add/change/remove a shebang and filetype.
let g:shebang#shebangs = {
            \ 'python': '#!/usr/bin/env python3',
            \ }


" =================TAGBAR===========================
" Automatically open Tagbar on Vim startup.
" autocmd VimEnter * nested :TagbarOpen

" Tagbar toggle with Ctrl + m
nmap <C-m> :TagbarToggle<CR>

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
