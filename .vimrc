" Use Vim settings, rather then Vi settings
" This must be first because it changes other options as a side effect.
set nocompatible

" ====================PLUGINS====================
call plug#begin()

    " ==================================Code/Project Navigation===============================================
    " ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in Vim.
    Plug 'dense-analysis/ale'

    " This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces.
    Plug 'Yggdroot/indentLine'

    Plug 'yuttie/comfortable-motion.vim' " Brings physics-based smooth scrolling to Vim.

    " vim-gemini is a customizable vim plugin that automatically adds closing, parenthesis, brackets, quotes, and more.
    Plug 'KaraMCC/vim-gemini'

    " It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed.
    Plug 'airblade/vim-gitgutter'

    " A simple plugin to insert the correct shebang of the file.
    Plug 'sbdchd/vim-shebang'

    " The NERDTree is a file system explorer for the Vim editor.
    Plug 'preservim/nerdtree'


    " ==========================================Miscellaneous===================================================
    " Relative numbers are used in a buffer that has focus, and is in normal mode, since that's where you move around. They're turned off when you switch out of Vim, switch to another split, or when you go into insert mode.
    Plug 'jeffkreeftmeijer/vim-numbertoggle'

    " Provides dynamically created headers or footers and uses configurable lists to show recently used or bookmarked files and persistent sessions.
    Plug 'mhinz/vim-startify'

    " This plugin causes all trailing whitespace characters to be highlighted.
    Plug 'ntpeters/vim-better-whitespace'


    " emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet
    Plug 'mattn/emmet-vim'

    Plug 'luochen1990/rainbow' " Helps you read code by showing you different levels of parantheses in different colors.

    " Animate.vim is a general window animation library for Vim, it provides the ability to animate window height and width.
    Plug 'camspiers/animate.vim'
    " Automatically resizes windows when their content exceeds their window dimensions.
    Plug 'camspiers/lens.vim'

    " This plugin merges the standard cursor movement of j and k with the scrolling of <CTRL-E> and <CTRL-Y> to produce a new screen-anchored cursor movement.
    Plug 'reedes/vim-wheel'

    Plug 'alvan/vim-closetag'

    Plug 'turbio/bracey.vim' " Live server for editing HTML, CSS, and JS. Similar to VSCode's live server.


    " =================================Language Specific========================================
    "This plugin modifies Vim’s indentation behavior to comply with PEP8 and my aesthetic preferences.
    Plug 'Vimjas/vim-python-pep8-indent'

    " Vim Jinja is a Vim plugin that provides syntax highlighting and indentation for Jinja templates in the Vim editor.
    Plug 'lepture/vim-jinja'

    Plug 'mitsuhiko/vim-python-combined'


    " =================================Colors========================================================
    Plug 'arcticicestudio/nord-vim'


call plug#end()


" Load filetype-specific indent files.
filetype on
filetype plugin on
filetype plugin indent on


" ===================GENERAL CONFIG===================
" Hybrid numbers (set number & set relativenumber)
set number relativenumber

" For unix text files. Convert to 'Dos' for Windows.
set fileformat=unix

" Force UTF-8 encoding.
set encoding=UTF-8

" Highlight the current line.
set cursorline

" Setting the textwidth to 79 characters.
set textwidth=79

" Open new panes to the right and bottom.
set splitbelow

set splitright

" Don't redraw while executing macros (helps performance).
set lazyredraw

" Bash-like completion for file names.
set wildmode=longest,list,full

" Enable auto completion menu after pressing tab.
set wildmenu

" Make wildmenu behave similar to Bash completion.
set wildmode=list:longest

" Improves smoothness of redrawing.
set ttyfast

" Enable mouse support in the terminal.
set mouse=r

" Disable modelines.
set modelines=0

syntax enable                       " Enable syntax processing.
if has('termguicolors')
   set termguicolors
 endif

" set background=dark                 " Vim uses colors that would look the best on a dark background.

colorscheme nord                    " Setting colorscheme nord.

" Italic comments (works when default vim is active as well).
highlight Comment cterm=italic gui=italic

" Syntax highlighting for Python files.
let python_highlight_all = 1


" ===================SWAPFILES===================
" Disable swap files.
set noswapfile

" Disable backup files.
set nobackup

" Disable backup files while editing.
set nowritebackup

" ===================TEXT FORMATTING====================
" Apply indentation of current line to the next line.
set autoindent

" Reacts to the syntax/style of the code I am editing.
set smartindent

" Smart handling of the <Tab> key.
set smarttab

" Each indent will correspond to a single tab.
set shiftwidth=4

" Number of spaces inserted when <TAB> is pressed and also number of spaces deleted.
set softtabstop=4

" Number of visual spaces per <TAB>.
set tabstop=4

" Convert tabs to spaces. AKA <TAB> means 'insert four spaces.'
set expandtab

" Do not wrap lines.
set nowrap

" Prevent vim from adding newlines to the end of files.
set nofixendofline

" Changes the default Vim register to the + register, which is linked to the system clipboard.
set clipboard=unnamedplus


" ==================UI SETTINGS========================
" Show current line number at the bottom.
set ruler

" Show the current mode Vim is in.
set showmode

" Shows matching pair of brackets (), [], {}.
set showmatch

" No sounds.
set visualbell

" Disable error bells.
set noerrorbells

" Disable flashing que.
set t_vb=

" Shows the current file path at the top of the window.
set title

" Number of lines to keep above/below the cursor when scrolling.
set scrolloff=3


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
" Find the next match as I search a word.
set incsearch

" Highlight searches by default.
set hlsearch

" mapping ',q' to cancel hlsearch.
nmap ,q :nohlsearch<CR>

" Ignore case when searching...
set ignorecase

" Except when I include upper-case characters. /foo matches FOO and fOo, but /FOO only matches FOO.
set smartcase


" ===================GENERAL FUNCTIONS================
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd FileType text setlocal spell
    autocmd BufRead, BufNewFile *.txt setlocal spell
augroup END


" ===============================ANIMATE=====================
" Integrates animate with FZF to animate its opening.
let g:fzf_layout = {
 \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
\ }

" ===============================AIRLINE===========================
" Enabling airline
let g:airline#extensions#tabline#enabled = 1

" ===================ALE (LINTING)=====================
" Allow ALE to continuously check my code.
let g:ale_sign_column_always = 1

" ==================BETTER WHITESPACE==================
" Setting a custom color for whitespace.
highlight ExtraWhitespace ctermbg=blue

" Enable highlighting and stripping whitepsace on save by default.
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" =================================CLOSETAG=======================================
" Filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '"*.html,*.xhtml,*.phtml,*.php,*.jsx"'

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" =================================COMFORTABLE MOTION==============================
" Remapping comfortable motion keys from <C-e> and <C-y> respectively.
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"


" ==================DEVICONS=========================
" Force extra padding in NERDTree so that the filetype icons line up vertically.
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Allow NERDTree to show hidden files
let NERDTreeShowHidden=1

" Toggle NERDTree with F6.
nmap <F6> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=31

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ===================EMMET============================
" Enable Emmet for HTML/CSS files only.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Mapping the emmet leader key to ','.
let g:user_emmet_leader_key=','

" Snippet for meta tag responsiveness
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

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

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Leader key (,) and pressing the letter h followed by p
" whenever cursor is on a hunk will open the preview window
" for the selected hunk"
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

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


" ================NERDTree=============================
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p


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

" Supported Filetypes
" Applescript
" Bash
" Erlang (Escript)
" Fish
" Lua
" Node
" Perl
" PHP
" Python
" Ruby
" Sh
" Zsh

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE

" Automatically wrap long Git commit messages in Vim.
au FileType gitcommit setlocal tw=72
