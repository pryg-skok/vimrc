" Skip initialization for vim-tiny or vim-small.
if 0 | endif


if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif


filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off

call plug#begin('$HOME/.vim/plugged')
" Add or remove your Bundles here (use single quotes!):
" Interface
    Plug 'https://github.com/tpope/vim-sensible' " default good settings for vim
    Plug 'https://github.com/kien/ctrlp.vim.git' " find file
    Plug 'https://github.com/bling/vim-airline'  " smart status line
    Plug 'https://github.com/majutsushi/tagbar'  " navigate tags

    " Solarized Colorscheme
    Plug 'https://github.com/altercation/vim-colors-solarized.git'

    " A tree explorer plugin
    Plug 'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }

    " Provides easy code commenting
    Plug 'https://github.com/scrooloose/nerdcommenter.git'

    " Shows 'Nth match out of M' at every search
    Plug 'https://github.com/vim-scripts/IndexedSearch.git'

    " RegExp search
    Plug 'https://github.com/rking/ag.vim'

" HTML/HAML
    " HTML5 omnicomplete and syntax
    Plug 'https://github.com/othree/html5.vim.git'
    Plug 'https://github.com/hokaccha/vim-html5validator.git'
    " Runtime files for Haml and Sass
    Plug 'https://github.com/tpope/vim-haml.git'
    Plug 'https://github.com/gregsexton/MatchTag.git'

" CSS/LESS
    " CSS3 syntax support
    Plug 'https://github.com/hail2u/vim-css3-syntax.git'
    " Highlight colors in css files
    Plug 'https://github.com/ap/vim-css-color.git'
    Plug 'https://github.com/groenewege/vim-less.git'
    Plug 'https://github.com/miripiruni/vim-better-css-indent.git'
    Plug 'https://github.com/miripiruni/CSScomb-for-Vim.git'

" JavaScript
    " Vastly improved vim's javascript indentation
    Plug 'https://github.com/pangloss/vim-javascript.git'
    " Syntax for jQuery keywords and css selectors
    Plug 'https://github.com/itspriddle/vim-jquery.git'

" CoffeeScript support
    Plug 'https://github.com/kchmck/vim-coffee-script.git'
    Plug 'https://github.com/walm/jshint.vim.git'

" Syntax highlightnings other
    Plug 'https://github.com/jamestomasino/actionscript-vim-bundle.git'
    Plug 'https://github.com/godlygeek/tabular'  " MarkDown
    Plug 'https://github.com/fatih/vim-go'
    Plug 'https://github.com/rust-lang/rust.vim'
    Plug 'https://github.com/cespare/vim-toml'  " Toml
    Plug 'https://github.com/mitsuhiko/vim-jinja.git'
    Plug 'https://github.com/hdima/python-syntax'
    Plug 'lervag/vimtex'
    Plug 'https://github.com/leshill/vim-json.git'

" Perform all your vim insert mode completions with Tab
    Plug 'https://github.com/ervandew/supertab.git'

" Syntax check
    Plug 'scrooloose/Syntastic'

" Git diff quickly
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'https://github.com/tpope/vim-fugitive'

" yanc selection to clipboard
    Plug 'https://github.com/ahw/vim-pbcopy'

" Other
    Plug 'https://github.com/blindFS/vim-taskwarrior', {'on': 'TW'}

call plug#end()

filetype plugin indent on

" Dropped many options already specified inn vim-sensible
" Interface
    " Character encodings considered when starting to edit an existing file
    " Only available when compiled with the +multi_byte feature
    set fileencodings=utf-8,cp1251
    " Always add lf in the end of file
    set fileformat=unix
    " Enhance command-line completion
    " Only available when compiled with the +wildmenu feature
    set wildmenu
    " Set completion mode
    " When more than one match, list all matches and complete first match
    " Then complete the next full match
    set wildmode=list:longest,full
    " Ignore following files when completing file/directory names
    " Version control
    set wildignore+=.hg,.git,.svn
    " OS X
    set wildignore+=*.DS_Store
    " Python byte code
    set wildignore+=*.pyc
    " PyCharm
    set wildignore+=*.idea
    " Binary images
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
    " Set title of the window to filename [+=-] (path) - VIM
    " Only available when compiled with the +title feature
    set title

    " Minimal number of lines to scroll when cursor gets off the screen
    set scrolljump=5
    " Minimal number of lines to keep above and below the cursor
    " Typewriter mode = keep current line in the center
    set scrolloff=50
    " Always show tabs
    set showtabline=2
    " Display invisible characters
    set list
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
    " Wrap long lines
    set wrap
    " Don't break words when wrapping
    " Only available when compiled with the +linebreak feature

    set linebreak
    " Show ↪ at the beginning of wrapped lines
    if has("linebreak")
        let &sbr = nr2char(8618).' '
    endif
    " Number of column to be highlighted
    " Only available when compiled with the +syntax feature
    set colorcolumn=92
    " Maximum width of text that is being inserted
    " Longer lines will be broken after white space to get this width
    set textwidth=92
    " Do smart indenting when starting a new line
    " Only available when compiled with the +smartindent feature
    set smartindent
    " round indent to multiple of 'shiftwidth'
    set shiftround
    " Number of spaces to use for each step of (auto)indent
    set shiftwidth=4
    " Use spaces instead of tab
    set expandtab
    " Number of spaces that a tab counts for
    set tabstop=4
    " Number of spaces that a tab counts for while performing editing operations
    set softtabstop=4
    " Number of pixel lines inserted between characters
    " Only in GUI
    set linespace=1
    " Highlight the screen line of the cursor
    " Only available when compiled with the +syntax feature
    set cursorline
    " Turn off cursor blinking in normal mode
    " Only available when compiled with GUI enabled
    set guicursor=n:blinkon0
    " Remove all components and options of the GUI
    " Only available when compiled with GUI enabled
    set guioptions=
    " Number of colors
    set t_Co=256
    " Splitting a window will put the new window below the current one
    " See :sp
    " Only available when compiled with the +windows feature
    set splitbelow
    " Splitting a window will put the new window right of the current one
    " See :vsp
    " Only available when compiled with the +vertsplit feature
    set splitright
    " Don't show the intro message starting Vim
    set shortmess+=I
    " Turn mouse pointer to a up-down sizing arrow
    " Only available when compiled with the +mouseshape feature
    set mouseshape=s:udsizing,m:no
    " Hide the mouse when typing text
    " Only works in GUI
    set mousehide
    " Edit several files in the same time without having to save them
    set hidden

    set ttyfast                     " better screen redraw
    set lazyredraw                  " only redraws if it is needed


" No beeps, no flashes
set visualbell
set t_vb=
" List of directories which will be searched when using :find, gf, etc.
" Search relative to the directory of the current file
" Search in the current directory
" Search downwards in a directory tree
" Only available when compiled with the +path_extra feature
set path=.,,**


" Status line
    " Content of the status line
    " Only available when compiled with the +statusline feature
    set statusline=\
    " Buffer number
    set statusline+=%n:\
    " File name
    set statusline+=%t
    " Modified flag
    set statusline+=%m
    set statusline+=\ \
    " Paste mode flag
    set statusline+=%{&paste?'[paste]\ ':''}
    " File encoding
    set statusline+=%{&fileencoding}
    " Type of file
    " Only available when compiled with the +autocmd feature
    set statusline+=\ \ %Y
    " Column number
    set statusline+=\ %3.3(%c%)
    " Current line / number of lines in buffer
    set statusline+=\ \ %3.9(%l/%L%)
    " Percentage through file in lines
    " set statusline+=\ \ %2.3p%%
    " File size
    set statusline+=\ \ %{functions#FileSize()}
    " Truncate here if line is too long
    set statusline+=%<
    " Path to the file
    set statusline+=\ \ CurDir:%{functions#CurDir()}


augroup EditVim
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" Create encodings menu
menu Encoding.UTF-8 :e ++enc=utf8 <CR>
menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>

" Spell checking
if version >= 700
    " Turn off spell checking
    set nospell
    menu Spell.off :setlocal spell spelllang= <cr>
    menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
    menu Spell.Russian :setlocal spell spelllang=ru <cr>
    menu Spell.English :setlocal spell spelllang=en <cr>
    menu Spell.-SpellControl- :
    menu Spell.Word\ Suggest<Tab>z= z=
    menu Spell.Previous\ Wrong\ Word<Tab>[s [s
    menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif


" Folding
" za = toggle current fold
" zR = open all folds
" zM = close all folds
"set foldmethod=indent
set foldtext=functions#MyFoldText()
" Lines with equal indent form a fold
"
" http://stackoverflow.com/a/4277400/1588044
set foldmethod=manual
" Maximum nesting of folds
" Only available when compiled with the +folding feature
set foldnestmax=10
" All folds are open
" Only available when compiled with the +folding feature
set nofoldenable
" Folds with a higher level will be closed
" Only available when compiled with the +folding feature
set foldlevel=1
" Remove the extrafills --------
" Only available when compiled with the +windows and +folding features
set fillchars="fold: "

" Search
    " When there is a previous search pattern, highlight all its matches
    " Only available when compiled with the +extra_search feature
    set hlsearch
    " Ignore case in search patterns
    set ignorecase
    " Override the 'ignorecase' if the search pattern contains upper case characters
    set smartcase
    " All matches in a line are substituted instead of one
    set gdefault
    set sc


" keyboard shortcuts
let mapleader = ","

" ,r
    map <Leader>r :call functions#Replace()<CR>


" <Esc><Esc>
    " Clear the search highlight in Normal mode
    nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" < >
    vnoremap < <gv
    vnoremap > >gv

" ,p
    " Toggle the 'paste' option
    set pastetoggle=<Leader>p

" ,yc / ,pp
    vmap <silent> ,yc y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! /tmp/.vimclip<CR>
    nmap <silent> ,yc :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! /tmp/.vimclip<CR>
    map <silent> ,pp :sview /tmp/.vimclip<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p

" ,f
    " Fast grep
    " Recursive search in current directory for matches with current word
    nnoremap <leader>a :Ag<space>
    map <Leader>f :execute "Ag " . expand("<cword>") <Bar> cw<CR>


" ,s
    " Shortcut for :%s//
    nnoremap <leader>s :%s//<left>
    vnoremap <leader>s :s//<left>

" Syntastic
" ,ll next error
    map <leader>ll :lnext <cr>
" ,lp previous error
    map <leader>lp :lprev <cr>
" ,lh hide errors
    map <leader>lh :SyntasticReset <cr>

" Move lines
    " Move one line
    nmap <C-S-k> ddkP
    nmap <C-S-j> ddp
    " Move selected lines
    " See http://www.vim.org/scripts/script.php?script_id=1590
    vmap <C-S-k> xkP'[V']
    vmap <C-S-j> xp'[V']

" Y from cursor position to the end of line
    nnoremap Y y$

" Pasting with correct indention
    nmap p p=`]
    nmap P P=`[

" TagBar ctrl-] (as ctags but I don't use it)
    nnoremap <C-]> :TagbarToggle<CR>

" ,g
    nnoremap <leader>g :GitGutterToggle<CR>

" task warrior
    nnoremap <leader>t :TW<CR>

" Navigate with <Ctrl>-hjkl in Insert mode
    imap <C-h> <C-o>h
    imap <C-j> <C-o>j
    imap <C-k> <C-o>k
    imap <C-l> <C-o>l

" Switch splits
    nmap <C-h> <C-W>h
    nmap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-l> <C-W>l

" ,v
    " Open the .vimrc in a new tab
    nmap <leader>v :tabedit $MYVIMRC<CR>
    :cabbrev e NERDTreeClose<CR>:e!

" <Space> = <PageDown>
    nmap <Space> <PageDown>

" n и N
    " Search matches are always in center
    nmap n nzz
    nmap N Nzz
    nmap * *zz
    nmap # #zz
    nmap g* g*zz
    nmap g# g#zz


" Navigate through wrapped lines
    noremap j gj
    noremap k gk

" gf
    " Open file under cursor in a new vertical split
    nmap gf :vertical wincmd f<CR>

" Create a new window relative to the current one
    nmap <Leader><left>  :leftabove  vnew<CR>
    nmap <Leader><right> :rightbelow vnew<CR>
    nmap <Leader><up>    :leftabove  new<CR>
    nmap <Leader><down>  :rightbelow new<CR>

" Copy indented line without spaces
    nnoremap ,y ^yg_"_dd

" ,c
    " camelCase => camel_case
    vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

" ,ts
    " Fix trailing white space
    map <leader>ts :%s/\s\+$//e<CR>

" ,bl
    " Show buffers
    nmap <Leader>bl :ls<cr>:b

" ,bp
    " Go to prev buffer
    nmap <Leader>bp :bp<cr>

" ,bn
    " Go to next buffer
    nmap <Leader>bn :bn<cr>

" ,u
    " Change case to uppercase
    nnoremap <Leader>u gUiw
    inoremap <Leader>u <esc>gUiwea

" В коммандном режиме разрешить прыгать в конец и начало строки, как в консоли
    cnoremap <c-e> <end>
    imap     <c-e> <c-o>$
    cnoremap <c-a> <home>
    imap     <c-a> <c-o>^

" ,b
    " In Visual mode exec git blame with selected text
    vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" ,w
    " Jump to next split
    map <Leader>w <C-w>w

" ,n
    " Edit another file in the same directory with the current one
    map <Leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

" ,d
" insert date
    map <Leader>d :r !date<CR>

" Bind :Q to :q
    command! Q q

" Fold with space
    nnoremap <space> za
    vnoremap <space> zf

" Switch tabs with <Tab>
    nmap <Tab> gt
    nmap <S-Tab> gT

" Russian symbols remapping
    set iminsert=0
    set imsearch=0
    highlight lCursor guifg=NONE guibg=Cyan

" stop trying to connect to X-server
" http://stackoverflow.com/a/17719528/1588044
set clipboard=exclude:.*


" Environment
" Store lots of history entries: :cmdline and search patterns
set history=1000
"" Save file with root permissions
"command! W exec 'w !sudo tee % > /dev/null' | e!

" Load previous session
    " Only available when compiled with the +viminfo feature
    set viminfo='10,<100000,s5000,:20,%,n$HOME/.vim/tmp/viminfo

    " Set cursor to its last position
     au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    " Remember info about open buffers on close
    set viminfo^=%

" Backup, swp files
    " Don't create backups
    set backup
    " Don't create swap files
    set backupdir=$HOME/.vim/tmp/backup/
    set undodir=$HOME/.vim/tmp/undo/
    set directory=$HOME/.vim/tmp/swap/

    " make this dirs if no exists previously
    silent! call functions#MakeDirIfNoExists(&undodir)
    silent! call functions#MakeDirIfNoExists(&backupdir)
    silent! call functions#MakeDirIfNoExists(&directory)


" AutoReload .vimrc
" See http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Go to last file(s) if invoked without arguments
     "http://vimcastsim.wikia.com/wiki/Open_the_last_edited_file
     autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
         \ call mkdir($HOME . "/.vim") |
         \ endif |
         \ execute "mksession! " . $HOME . "/.vim/Session.vim"
     autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
         \ execute "source " . $HOME . "/.vim/Session.vim"

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

" Save on losing focus
" Only available for GUI
autocmd FocusLost * :wa

" Resize splits when the window is resized
" Only available for GUI
au VimResized * exe "normal! \<c-w>="

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" File specific
autocmd BufNewFile *.py 0r ~/.vimi/templates/template.py
autocmd BufNewFile *.go 0r ~/.vimi/templates/template.go
autocmd BufNewFile *.c 0r ~/.vimi/templates/template.c
autocmd BufNewFile *.cpp 0r ~/.vimi/templates/template.cpp
autocmd BufNewFile *.xml 0r ~/.vimi/templates/template.xml
autocmd BufNewFile *.xsl 0r ~/.vimi/templates/template.xsl
autocmd BufNewFile *.jade 0r ~/.vimi/templates/template.jade
autocmd BufNewFile *.html 0r ~/.vimi/templates/template.html

autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab textwidth=100 colorcolumn=100

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown


" Plugins

" Solarized
    " http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized#comment11144700_7278548
    let g:solarized_termcolors=256
     ""Solarized light mode
        "set background=light
        "let g:solarized_termtrans=0

        "let g:solarized_contrast="high"
        "let g:solarized_visibility="low"


     "Solarized dark mode
        set background=dark
        let g:solarized_termtrans=1

    try
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        echo "Solarized theme not found. Run :PlugInstall"
    endtry

" NERDTree
    nmap <Bs> :NERDTreeToggle<CR>
    let NERDSpaceDelims=1 " add extra space after comment symbol in nerdcommenter
    let NERDTreeShowBookmarks=1
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=0
    let NERDTreeKeepTreeInNewTab=0
    " Disable display of the 'Bookmarks' label and 'Press ? for help' text
    let NERDTreeMinimalUI=1
    " Use arrows instead of + ~ chars when displaying directories
    let NERDTreeDirArrows=1
    let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$', '\.d$', '\.idea$']
    let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

" Python Syntax
    let python_highlight_all = 1

" Syntastic
    let g:syntastic_enable_highlighting = 1
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers=['flake8', 'pylint']
    let g:syntastic_python_flake8_args="--max-line-length=120 --max-complexity 12
    \ --ignore=C0103,C0321,C0111,C0326,C0302,W1401,W0602,W0105,W0401,W0621,W0702,W0403,W0511,W1201,W0232,W0142,W0603,W0703,R0904,E1103,E1101,C0330,E402,E241,E116,E265,E125"

    let g:syntastic_python_pylint_args="--max-line-length=120
    \ --disable=C0103,C0321,C0111,C0326,C0302,W1401,W0602,W0105,W0401,W0621,W0702,W0403,W0511,W1201,W0232,W0142,W0603,W0703,R0904,E1103,E1101,C0330"
    set completeopt-=preview

" git gutter
    let g:gitgutter_max_signs = 1000
    let g:gitgutter_enabled = 0
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0

" ctrlp
    let g:ctrlp_match_window = 'order:ttb,max:20'
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" TagBar autofocus when open
    let g:tagbar_autofocus = 1

" vim latex
    let g:tex_flavor='latex'

