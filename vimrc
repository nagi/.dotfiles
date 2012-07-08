call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

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
" Default color scheme
colorscheme jellybeans
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

" Status bar
set laststatus=2
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
au BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
map <leader>p <esc>"+gP<cr>
map <leader>v <esc>"+gP<cr>
map <leader>r <esc>:w<cr><esc>:!ruby %<cr>
" **********
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>gg :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gV :CommandTFlush<cr>\|:CommandT app/vendor<cr>
map <leader>gaa :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gaj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gas :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>gpp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gpj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>
map <leader>gps :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT test<cr>

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
