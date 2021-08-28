" ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
" Author: Vijaydeep Sharma <vdsharma93@gmail.com>

":Plugins ----------------------------->

" Set up dein
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('haya14busa/dein-command.vim')
    call dein#add('wsdjeg/dein-ui.vim')

    " System
    call dein#add('matze/vim-move')
    call dein#add('itmammoth/doorboy.vim')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('terryma/vim-multiple-cursors')

    " UI
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('Yggdroot/indentLine')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('rakr/vim-one')
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('RRethy/vim-illuminate')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('jschmold/sweet-dark.vim')

    " code style
    call dein#add('sbdchd/neoformat')
    call dein#add('editorconfig/editorconfig-vim')

    " completion
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')

    " git
    call dein#add('tpope/vim-fugitive')
    call dein#add('sgeb/vim-diff-fold')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('junegunn/gv.vim')

    " python
    call dein#add('deoplete-plugins/deoplete-jedi')

    " javascript
    call dein#add('othree/yajs.vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('elzr/vim-json')
    call dein#add('wokalski/autocomplete-flow')

    " HTML5
    call dein#add('othree/html5.vim')
    call dein#add('alvan/vim-closetag')
    call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})

    " Css
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('ap/vim-css-color')

    " Docker
    call dein#add('ekalinin/Dockerfile.vim')

    " mustache
    call dein#add('towolf/vim-helm')
    call dein#add('mustache/vim-mustache-handlebars')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" nvim settings ----------------------->
syntax on
filetype on

set mouse=a
set clipboard+=unnamedplus
set nopaste
set noshowmode
set number
set relativenumber
set laststatus=2
set wildmenu
set incsearch
set ignorecase
set smartcase
set nohlsearch
set nobackup
set noswapfile
set updatetime=100
set wrap linebreak nolist
set wildmode=full
set autoread
set fillchars+=vert:│
set spell
set guifont=FantasqueSansMono\ Nerd\ Font\ Mono\ 11
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
au VimLeave * set guicursor=n-ci:hor30-iCursor-blinkwait300-blinkon200-blinkoff150

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" enable local config files to be read
set exrc
set secure

" Show file options above the command line
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" plugin configs ----------------------->

" vim-move
let g:move_key_modifier = 'C'

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeHijackNetrw=0

" indentLine
let g:indentLine_color_gui = '#666666'
let g:vim_json_syntax_conceal = 0

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup=1
let g:echodoc#type="virtual"
let g:python3_host_prog = '/home/vijaydeep/.config/nvim/venv/bin/python'
set splitbelow
set completeopt+=menuone,noinsert,noselect
set completeopt-=preview
autocmd CompleteDone * pclose

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
endfunction

" let g:deoplete#file#enable_buffer_path=1
let g:deoplete#omni_patterns = {
    \ 'html': '',
    \ 'css': '',
    \ 'scss': ''
    \}

function! Preview_func()
    if &pvw
        setlocal nonumber norelativenumber
    endif
endfunction

autocmd WinEnter * call Preview_func()
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
call deoplete#custom#option('auto_complete_delay', 0)


" vim-jsx
let g:jsx_ext_required = 1

" git
set signcolumn=yes
let g:conflict_marker_enable_mappings = 0
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'
autocmd FileType fugitive call s:fugitive_settings()

function! s:fugitive_settings() abort
    setlocal nonumber
endfunction

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

nmap <silent><leader>, :bnext<CR>
nmap <silent><leader>. :bprevious<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" mapings --------------------------------->
map <leader>a :NERDTreeToggle<CR>
vnoremap <C-c> "+y
map <C-v> "+P

" No need for ex mode
nnoremap Q <nop>


" recording macros is not my thing
" map q <Nop>

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>

" move
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" this is the best, let me tell you why
" how annoying is that everytime you want to do something in vim
" you have to do shift-; to get :, can't we just do ;?
" Plus what does ; do anyways??
" if you do have a plugin that needs ;, you can just swap the mapping
" nnoremap : ;
" give it a try and you will like it
nnoremap ; :

" spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>
nnoremap <C-i> :set list!<CR>

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" open settings
map <leader>z :e ~/.config/nvim/init.vim<CR>
nnoremap <c-s> :mksession!<CR>

" auto load previous sessions, if exists
if(argc() == 0)
    if filereadable("./Session.vim")
        au VimEnter * nested :source ./Session.vim
    endif
endif

" replace currently selected text with default register
" without yanking it
" vnoremap p "_dP

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap ;; <Esc>

" UI settings ----------------------------->
set termguicolors
colorscheme one
" colorscheme sweet_dark
set background=dark
let g:airline_theme='one'
" let g:airline_theme='sweet_dark'

" for transparent background
function! AdaptColorscheme()
   highlight clear CursorLine
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
highlight clear LineNr
highlight clear SignColumn

" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

"" extra settings, uncomment them if necessary :)
"set cursorline
"set noshowmode
"set nocursorline

" trasparent end

let g:Illuminate_ftblacklist = ['nerdtree', 'gitconfig', 'fugitive', 'git']

" formating
noremap <silent> <leader>f :Neoformat<CR>
let g:standard_prettier_settings = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
            \ 'stdin': 1,
            \ }

" Python
let g:jedi#documentation_command = "<leader>k"
let g:jedi#force_py_version=3

" auto
autocmd BufWritePre * :%s/\s\+$//e

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!/usr/bin/google-chrome-stable %:p<CR>'

" make indent 2 spaces for yml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
