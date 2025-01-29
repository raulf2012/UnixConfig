if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ############################################################################
" ############################################################################
" ██████  ██      ██    ██  ██████  ██ ███    ██ ███████
" ██   ██ ██      ██    ██ ██       ██ ████   ██ ██
" ██████  ██      ██    ██ ██   ███ ██ ██ ██  ██ ███████
" ██      ██      ██    ██ ██    ██ ██ ██  ██ ██      ██
" ██      ███████  ██████   ██████  ██ ██   ████ ███████
" #############################################################################
"| - Plugins
"##############################################################################
call plug#begin('~/.vim/plugged')
Plug 'szymonmaszke/vimpyter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }


Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'goerz/jupytext.vim'
Plug 'psliwka/vim-smoothie'
Plug 'severin-lemaignan/vim-minimap'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Plug 'jiangmia/auto-pairs'
" Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'lervag/vimtex'
Plug 'andviro/flake8-vim'

" - Color schemes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'rakr/vim-two-firewatch'
Plug 'sainnhe/everforest'


" ---------------------------------------------------------
" Plug 'ryanoasis/vim-devicons'  " Was not able to get it to work | 2024-06-18

call plug#end()


" ############################################################################
"| - vim-gitgutter  ##########################################################
set updatetime=100
"__| #########################################################################

" ############################################################################
"| - rainbow_parentheses #####################################################
" RainbowParenthesesToggle
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"__| #########################################################################

" ############################################################################
"| - Jupytext ################################################################
let g:jupytext_enable = 1
let g:jupytext_command = 'jupytext'
let g:jupytext_fmt = 'py'
let g:jupytext_to_ipynb_opts = '--to=ipynb --update'
"__| #########################################################################

"#############################################################################
"| - gruvbox #################################################################
" " color gruvbox
"
" set bg=dark
" " let g:gruvbox_contrast_dark= 'soft'
" let g:gruvbox_contrast_dark= 'hard'
"__| #########################################################################

" ############################################################################
"| - lightline ###############################################################
set laststatus=2
"__| #########################################################################

" ############################################################################
"| - NerdCommenter ###########################################################
filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"__| #########################################################################

" ############################################################################
"| - NerdTree ################################################################


" Open side tab by default
autocmd vimenter * NERDTree


" map <C-n> :NERDTreeToggle<CR>
map <C-\> :NERDTreeToggle<CR>


" Mirror the NERDTree before showing it. This makes it the same on all tabs.
" nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <C-\> :NERDTreeMirror<CR>:NERDTreeFocus<CR>


" " Focus on opened file instead of tree view
" autocmd VimEnter * wincmd p


" Width of tree-view
" let g:NERDTreeWinSize=60
let g:NERDTreeWinSize=42
" let g:NERDTreeWinSize=36


" " ## 2024-06-18 | Throwing an error
" " Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" " ## 2024-06-18 | Throwing a little error
" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif


" " ## 2024-06-18 | Not working
" let g:NERDTreeFileLines = 1


"__| #########################################################################

" ############################################################################
"| - Goyo  ###################################################################
" set g:goyo_width (default: 80)
" set g:goyo_height (default: 85%)
" set g:goyo_linenr (default: 0)

" let g:goyo_width = "100%"
let g:goyo_height = "100%"
"__| #########################################################################

" ############################################################################
"| - flake8-vim  ###################################################################
" Doesn't seem like this was working (2022-09-06)
" " let g:PyFlakeDisabledMessages = 'W191, E123, E124, E125, E128, E201, E223, E224, E265, E302, E303, E305, E402, E701, E702, E722'
" let g:PyFlakeDisabledMessages = 'W191,E123,E124,E125,E128,E201,E223,E224,E265,E302,E303,E305,E402,E701,E702,E722'

" 2024-06-11 | Fixed the Quickfix List popping up all the time
let g:PyFlakeOnWrite = 0

"__| #########################################################################

" ############################################################################
"| - everforest - theme  #####################################################
" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" " For light version.
" set background=light

" Set contrast. This configuration option should be placed before `colorscheme everforest`. Available values: 'hard', 'medium'(default), 'soft'

" ### These aren't working on desktop | 2024-06-18

" let g:everforest_background = 'soft'
" let g:everforest_background = 'medium'
let g:everforest_background = 'hard'


" " For better performance
" let g:everforest_better_performance = 1

colorscheme everforest
"__| #########################################################################

" ############################################################################
"| - ale  ####################################################################

" let g:ale_fix_on_save = 0
"
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 0

"__| #########################################################################

" ############################################################################
"| - vim-devicons  ###########################################################

set encoding=UTF-8

"__| #########################################################################




"__|









" ############################################################################
" ############################################################################


" ############################################################################
"| - Color Scheme ############################################################

" color gruvbox

" colorscheme desert
" color dracula


" set background=light " or light if you prefer the light version
" let g:two_firewatch_italics=1
" " colo two-firewatch
"
" let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme

"__| #########################################################################

" ############################################################################
"| - Code folding ############################################################
" set foldmethod=marker foldmarker=#\|\ -,#__\|  " This works for python
set foldmethod=marker foldmarker=\|\ -,__\|  " This works for all, agnostic to comment character

" These aren't working on the desktop | 2024-06-18
" hi Folded ctermbg=7
" hi Folded ctermbg=242  " Looks greate on dark theme | 2022-11-08 Does not look great on desktop
" hi Folded ctermbg=8  " Looks good on desktop (2022-11-08)
" hi Folded ctermbg=14
" hi Folded ctermbg=5

" setlocal foldmethod=expr foldexpr=getline(v:lnum)=~#'#\|\'?'>1':'='
" setlocal foldmethod=marker foldmarker=#\|\ -,#__\|
"__| #########################################################################

"#############################################################################
"| - Reload file automatically when changed ##################################
"#############################################################################
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"__| #########################################################################

" Search for text with slashes
" https://vim.fandom.com/wiki/Searching_for_expressions_which_include_slashes
command! -nargs=1 Ss let @/ = <q-args>

" #############################################################################
" Highlight current line
set cursorline
" set cursorcolumn

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" #############################################################################
set hlsearch  " Highlight search

set number  " Sets line numbers
syntax on


" Set tab spacing and num characters for tab press to 4
set ts=4 sw=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" Don't  add new line after 80 characters ####################################
" https://stackoverflow.com/questions/12163885/how-to-stop-vim-from-creating-a-new-line-after-80
" set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

" | - Transparent background
" https://www.reddit.com/r/vim/comments/74pw75/how_to_toggle_transparent_background_in_vim/
" let t:is_transparent = 0
" function! Toggle_transparent()
"     if t:is_transparent == 0
"         hi Normal guibg=NONE ctermbg=NONE
"         let t:is_transparent = 1
"     else
"         set background=dark
"         let t:is_tranparent = 0
"     endif
" endfunction
" nnoremap <C-t> : call Toggle_transparent()<CR>

hi Normal guibg=NONE ctermbg=NONE

" __|


" #############################################################################
" | - Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" __|



"                 ███    ███ ██ ███████  ██████
"                 ████  ████ ██ ██      ██
"                 ██ ████ ██ ██ ███████ ██
"                 ██  ██  ██ ██      ██ ██
" ███████ ███████ ██      ██ ██ ███████  ██████ ███████ ███████

highlight SpellBad term=reverse ctermbg=1

" Sets wrap automatically for gitdiff
" https://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

if &diff
    syntax off

set statusline+=%F

endif
