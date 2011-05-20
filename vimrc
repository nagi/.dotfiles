call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" apply vimrc settings after the vimrc is saved
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Leave as \
"let mapleader = ","
"let g:mapleader = ","

nmap <leader>v :tabedit $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set ruler
syntax on

set cmdheight=2

" Set encoding
set encoding=utf-8

" Whitespace stuff
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2
" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"Set magic on, for regular expressions
set magic

" remove the search highlight
map <silent> <leader><cr> :noh<cr>

" Use the arrows to something usefull
map <s-right> :tabnext<cr>
map <s-left> :tabNext<cr>
map <s-up> :tabnew<cr>
map <s-down> :tabclose<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :bo cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" **************************
" My Old Keyboard Mappings
" **********
imap <S-CR> <Esc>
imap jj <Esc>
" **********
map Y y$
" **********
map <F2> :w<CR>
imap <F2> <Esc>:w<CR>
map <F3> :wa<CR>
imap <F3> <Esc>:wa<CR>
" **********
" map <F5> :!nanoc compile<CR>
" imap <F5> <Esc>:!nanoc compile<CR>
" **********
map <F7> :Rmodel<CR>
imap <F7> <Esc>:Rmodel<CR>
map <F8> :Rcontroller<CR>
imap <F8> <Esc>:Rcontroller<CR>
map <F9> :Rview 
imap <F9> <Esc>:Rview 
" **********
map <F10> :CommandT<CR>
imap <F10> <Esc>:CommandT<CR>
" **********
map <F11> :NERDTreeToggle<CR>
imap <F11> <Esc>:NERDTreeToggle<CR>
map <F12> :NERDTree<CR>
imap <F12> <Esc>:NERDTree<CR>
" Specky
" **********
let g:speckyBannerKey = "<C-S>b"
let g:speckyQuoteSwitcherKey = "<C-S>'"
let g:speckyRunRdocKey = "<C-S>r"
let g:speckySpecSwitcherKey = "<C-S>x"
let g:speckyRunSpecKey = "<C-S>s"
let g:speckyRunSpecCmd = "spec -fs -r loadpath.rb"
let g:speckyRunRdocCmd = "fri -L -f plain"
let g:speckyWindowType = 2
" **********

map <leader>s <Esc>:w<CR>
map <leader>a <Esc>ggVG<CR>
map <leader>x <Esc>"+x<CR>
map <leader>c <Esc>"+y<CR>
map <leader>p <Esc>"+gP<CR>
map <leader>v <Esc>"+gP<CR>

" CommandT
map <leader>t <Esc>:CommandT<CR>

" Pretty JSON
" sudo cpan JSON::XS
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
colorscheme jellybeans

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" netrw settings
let g:netrw_preview = 1 " preview window shown in a vertically split
let g:netrw_winsize = 40


" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

