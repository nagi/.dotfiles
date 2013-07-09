"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'hallettj/jslint.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'nono/vim-handlebars'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
Bundle 'slim-template/vim-slim'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'matchit.zip'

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" apply vimrc settings after the vimrc is saved
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set number
set ruler

" Use modeline overrides
set modeline
set modelines=10
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  " Font
  set guifont=DejaVu\ Sans\ Mono\ 10
  " Minimal GUI
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  " Default gui color scheme
  colorscheme molokai
else
  " Term color scheme
  " colorscheme jellybeans
  colorscheme molokai
endif

syntax on

set cmdheight=2

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
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

" Status bar and split serperators
set laststatus=2
set fillchars="vert: "

" Format the statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"Set magic on, for regular expressions
set magic

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Command-T configuration
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=60000

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab
" python uses 4 spaces
" au FileType python set shiftwidth=4 softtabstop=4
au FileType python set tabstop=4 shiftwidth=4  noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Guardfile,Rakefile,Thorfile,config.ru,.simplecov}    set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" arrow keys are unacceptable
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" Yank to * buffer
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>
map Y y$
" **********
map <leader>1 <esc>:Rview<cr>
map <leader>2 <esc>:Rcontroller<cr>
map <leader>3 <esc>:Rmodel<cr>
" **********
map <leader>n <esc>:NERDTreeToggle<cr>
" **********
map <leader>s <esc>:w<cr>
map <leader>a <esc>ggVG<cr>
map <leader>x <esc>"+x<cr>
map <leader>c <esc>"+y<cr>
map <leader>p <esc>"*p<cr>
map <leader>v <esc>"+gP<cr>
map <leader>r <esc>:w<cr><esc>:!ruby %<cr>
" **********
map <leader>f :CtrlPClearCache<cr>\|:CtrlP<cr>
map <leader>gg :CtrlPClearCache<cr>\|:CtrlP %%<cr>
map <leader>gf :CtrlPClearCache<cr>\|:CtrlP features<cr>
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gV :CtrlPClearCache<cr>\|:CtrlP app/vendor<cr>
map <leader>gaa :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>gaj :CtrlPClearCache<cr>\|:CtrlP app/assets/javascripts<cr>
map <leader>gas :CtrlPClearCache<cr>\|:CtrlP app/assets/stylesheets<cr>
map <leader>gpp :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gpj :CtrlPClearCache<cr>\|:CtrlP public/javascripts<cr>
map <leader>gps :CtrlPClearCache<cr>\|:CtrlP public/stylesheets<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>gt :CtrlPClearCache<cr>\|:CtrlP test<cr>

" swap to last buffer
map <silent> <leader><leader> <esc><C-^><cr>

" Use the arrows to manage tabs
map <s-right> :tabnext<cr>
map <s-left> :tabNext<cr>
map <s-up> :tabnew<cr>
map <s-down> :tabclose<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Unimpaired configuration
" Bubble single lines
nmap <c-Up> [e
nmap <c-Down> ]e
" Bubble multiple lines
vmap <c-Up> [egv
vmap <c-Down> ]egv

" ZoomWin configuration
map <Leader>z :ZoomWin<cr>

" TODO Learn CTags
" CTags
" map <Leader>ct :!ctags --extra=+f -R *<cr><cr>

" TODO Learn cope
" map <leader>cc :bo cope<cr>
" map <leader>[ :cp<cr>
" map <leader>] :cn<cr>
