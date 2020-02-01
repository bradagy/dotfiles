
" Use Vim settings, rather then Vi settings
" This must be first because it changes other options as a side effect.
set nocompatible

" Enabling fzf to be used within vim.
set rtp+=~/.fzf


" ====================PLUGINS====================
call plug#begin()

    " Coding
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " Editing
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'mattn/emmet-vim'

    " Browsing
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'ryanoasis/vim-devicons'

    " Language Specific
    Plug 'vim-scripts/indentpython.vim'

    " Miscellaneous
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

    " Colors
    Plug 'fcpg/vim-orbital'
    Plug 'junegunn/seoul256.vim'
    Plug 'arcticicestudio/nord-vim'

call plug#end()


" Load filetype-specific indent files.
filetype on
filetype plugin on
filetype plugin indent on


" ===================GENERAL CONFIG===================
set number relativenumber           " Hybrid numbers (set number & set relativenumber)
set t_Co=256                        " Tell Vim to accept 256 colors.
set fileformat=unix                 " For unix text files. Convert to 'Dos' for Windows.
set encoding=UTF-8                  " Force UTF-8 encoding.
set cursorcolumn                    " Highlight the current column.
set cursorline                      " Focus on current line i'm working on.
set splitbelow                      " Open new panes to the right and bottom.
set splitright
set background=dark                 " Vim uses colors that would look the best on a dark background.
set termguicolors
set ttyfast                         " Improves smoothness of redrawing.
syntax enable                       " Enable syntax processing.
colorscheme nord                    " Setting colorscheme to nord.

" Italic comments.
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
set visualbell                      " No sounds.
set noerrorbells                    " Disable error bells.
set t_vb=                           " Disable flashing que.


" ==================UI SETTINGS========================
set ruler                           " Always show the cursor position.
set showmode                        " Show the mode I'm currently in.
set showmatch                       " Shows matching pair of brackets (), [], {}.
set visualbell                      " No sounds.
set noerrorbells                    " Disable error bells.
set t_vb=                           " Disable flashing que.


" ===================REMAPPINGS======================
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

" Change leader shortcut to comma instead of backslash.
let mapleader=","


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


" ===================ALE (LINTING)=====================
" Allow ALE to continuously check my code.
let g:ale_sign_column_always = 1


" ==================BETTER WHITESPACE=================
" Setting a custom color for whitespace.
highlight ExtraWhitespace ctermbg=blue

" Enable highlighting and stripping whitepsace on save by default.
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" ===================EMMET============================
" Enable Emmet for HTML/CSS files only.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Mapping the emmet leader key to ','.
let g:user_emmet_leader_key=','


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



" ===================LIGHTLINE===================
set laststatus=2                    " Allowing the Lightline status bar to become visible.

" Allowing git branch information to be shown in the Lightline status bar.
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


" ===================GOYO & LIMELIGHT===================
" Turn on limelight when goyo is being used.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Line numbers will be also be available when using Goyo (plugin).
let g:goyo_linenr=1

" Paragraphs not being focused on will be in gray.
let g:limelight_conceal_ctermfg='gray'

" Setting highlight priority to -1. This will not overrule hlsearch.
let g:limelight_priority=-1


" ===================NERDTree==========================
" NERDTree Toggle with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Set the NERDTree window size to 30.
let g:nerdtreewinsize=30


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

" ==================VimWiki===========================
" Set path to directory inside dropbox.
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Make sure VimWiki doesn't own all of the .md files.
let g:vimwiki_global_ext = 0

" Turning VimWiki page links into link extensions.
let g:vimwiki_markdown_link_ext = 1
