"" Aesthetics

" load Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" turn on highlight search and incremental search
" Note: incsearch currently doesn't work with eregex plugin
set hlsearch incsearch

" force status bar to stay open
set laststatus=2

" turn on line numbers and relative line numbers
set relativenumber number

" set background to dark for color scheme
set background=dark

" set terminal colors to 256
set t_Co=256

" turn off last highlight with backslash
nnoremap <silent> \ :noh<CR>

" make listing invisible characters pretty
set listchars=tab:!·,trail:·,precedes:·

" set color scheme to spacegray
" Available from https://github.com/ajh17/Spacegray.vim
" or https://github.com/domgetter/Spacegray.vim
colo spacegray

" give visual feedback of indentation
let g:indentLine_color_term = 235
let g:indentLine_char = '│'

"" Functionality

" set leader to spacebar
let mapleader = " "
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Quick access to vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" set ex command history to an ungodly amount
set history=10000

" force cursor to center of screen on line jump
nnoremap G Gzz

" Make Control-J/K move down/up two lines when reading docs
nnoremap <C-j> 2<C-e>
nnoremap <C-k> 2<C-y>

" If in insert mode, make line motions go to normal mode
inoremap kkk <esc>kkk
inoremap jjj <esc>jjj

" More sane
nnoremap Y y$

" set tabs to spaces
set ts=4 sts=2 sw=2 expandtab

" send Ruby expression to REPL Server with <leader>S and <leader>s
vmap <silent> <leader>s :ruby puts RapelClient.send_current_selection<CR>
vmap <silent> <leader>S :ruby RapelClient.send_and_print_below<CR>

"" Plugins

call plug#begin('~/.vim/plugged')

" One of these is preventing > 80 column typing, and I don't know which one. It's not polyglot as far as I can tell

Plug 'ctrlpvim/ctrlp.vim'
Plug 'domgetter/vim-rapel-client'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'koron/nyancat-vim'
Plug 'mhinz/vim-startify'
Plug 'othree/eregex.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'Yggdroot/indentLine'

" Plugins I don't like/care about
" Plug 'boucherm/ShowMotion'
" Plug 'nathanaelkane/vim-indent-guides' " Couldn't get it to work with Spacegray
" Plug 'joeytwiddle/sexy_scroller.vim' " Slow on long lines
" Plug 'vim-airline/vim-airline'
" Plug 'Bogdanp/rbrepl.vim'

call plug#end()

"" Plugin Settings

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Turn on quickscope only for finding and til'ing
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Turn off folding by default for markdown
let g:vim_markdown_folding_disabled = 1

