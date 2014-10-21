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
Bundle 'bling/vim-airline.git'
Bundle 'ervandew/supertab'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'mrkschan/vim-node-jslint'
Bundle 'nanotech/jellybeans.vim'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'sjl/gundo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'timcharper/textile.vim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

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
" set modelines=10
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"            /--------------------------------------
"           /  You saved this in your .dotfiles repo
let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
"           \ 
"            \--------------------------------------
"

if has('gui_running')
  " Minimal GUI
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
endif


function! DarkerBlack()
  if g:colors_name == 'molokai'
    highlight Normal guifg=#F8F8F2 guibg=#101010
  endif
endfunction

" Patch molokai
autocmd ColorScheme * call DarkerBlack()

colorscheme molokai

" Color in linux terminals. For iTerm2 set 'Report Terminal Type" to
" xterm-256color in profiles section of settings.
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
elseif $COLORTERM == 'xfce4-terminal'
  set t_Co=256
elseif $COLORTERM == 'rxvt'
  set t_Co=256
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
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

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
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

autocmd Filetype gitcommit setlocal spell

" make uses real tabs
autocmd FileType make set noexpandtab
" python uses 4 spaces
" autocmd FileType python set shiftwidth=4 softtabstop=4
autocmd FileType python set tabstop=4 shiftwidth=4  noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Capfile,Gemfile,Guardfile,Rakefile,Thorfile,config.ru,*.simplecov,*.rbs,*.rabl,*.jbuilder} set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

function! G4S()
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set textwidth=120
    set noexpandtab
endfunction
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
" Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
" the right side. Ctrl-Shift-Tab goes the other way.
if has("gui_macvim")
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif
" Yank to * buffer
map <leader>y "*y
" Move around splits with <c-hjkl>
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
" Use the arrows to manage tabs
" map <s-right> :tabnext<cr>
" map <s-left> :tabNext<cr>
" map <s-up> :tabnew<cr>
" map <s-down> :tabclose<cr>
nnoremap <Down> <c-w>j
nnoremap <Up> <c-w>k
nnoremap <Left> <c-w>h
nnoremap <Right> <c-w>l

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
map <leader>u <esc>:GundoToggle<cr>
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
map <leader>gd :CtrlPClearCache<cr>\|:CtrlP app/decorators<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gV :CtrlPClearCache<cr>\|:CtrlP app/vendor<cr>
map <leader>gaa :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>gj :CtrlPClearCache<cr>\|:CtrlP app/assets/javascripts<cr>
map <leader>gy :CtrlPClearCache<cr>\|:CtrlP app/assets/stylesheets<cr>
map <leader>gas :CtrlPClearCache<cr>\|:CtrlP app/services<cr>
map <leader>gad :CtrlPClearCache<cr>\|:CtrlP app/decorators<cr>
map <leader>gpp :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gpj :CtrlPClearCache<cr>\|:CtrlP public/javascripts<cr>
map <leader>gps :CtrlPClearCache<cr>\|:CtrlP public/stylesheets<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>gt :CtrlPClearCache<cr>\|:CtrlP test<cr>
map <leader>gi :CtrlPClearCache<cr>\|:CtrlP config/initializers<cr>

" map <leader>t :!bundle exec rspec --color --tty > tmp/fifo 2> tmp/fifo<CR><CR>
map <leader>t :!be spring rspec --color --tty spec/lib/exports/employee_spec.rb > tmp/fifo 2> tmp/fifo 
" Spring
map <leader>ss :!spring rspec --color --tty > tmp/fifo 2> tmp/fifo<CR><CR>
map <leader>sc :!spring cucumber -c -p wip > tmp/fifo 2> tmp/fifo<CR><CR>

" swap to last buffer
map <silent> <leader><leader> <esc><C-^><cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" ZoomWin configuration
map <Leader>z :ZoomWin<cr>

" TODO Learn CTags
" CTags
" map <Leader>ct :!ctags --extra=+f -R *<cr><cr>

" TODO Learn cope
" map <leader>cc :bo cope<cr>
" map <leader>[ :cp<cr>
" map <leader>] :cn<cr>
