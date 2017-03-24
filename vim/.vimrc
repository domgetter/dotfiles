"" Plugins

" Using vim-plug plugin manager.  Available from https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Quickly find and open files
Plug 'ctrlpvim/ctrlp.vim'

" Interact with Rapel repl server
Plug 'domgetter/vim-rapel-client'

" Motions to jump anywhere with ease
Plug 'easymotion/vim-easymotion'

" Nyancat
Plug 'koron/nyancat-vim'

" Start screen when vim is run with no arguments
Plug 'mhinz/vim-startify'

" PCRE instead of whatever vim uses
Plug 'othree/eregex.vim'

" Syntax highlighting for markdown files
Plug 'plasticboy/vim-markdown'

" In-vim folder/file browser
Plug 'scrooloose/nerdtree'

Plug 'sheerun/vim-polyglot'

" New commands for commenting out code
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'

" Git commands
Plug 'tpope/vim-fugitive'

" meta-plugin to allow repeating
Plug 'tpope/vim-repeat'

" Commands for surrounding tokens
Plug 'tpope/vim-surround'

" Hodgepodge of commands for doing annoying things more quickly
Plug 'tpope/vim-unimpaired'

" highlights t and f targets on current line
Plug 'unblevable/quick-scope'

if has('multi_byte')
  " Places vertical lines to show indentation
  Plug 'Yggdroot/indentLine'
endif

" IDE-like autocomplete menu
Plug 'Shougo/neocomplete.vim'

" Better i* motions
Plug 'wellle/targets.vim'

" Plugins I don't like/care about or don't use
" Main Go plugin
" Plug 'fatih/vim-go'

" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe' " Too many dependencies
" Plug 'boucherm/ShowMotion'
" Plug 'nathanaelkane/vim-indent-guides' " Couldn't get it to work with Spacegray
" Plug 'joeytwiddle/sexy_scroller.vim' " Slow on long lines
" Plug 'vim-airline/vim-airline' " Using Powerline instead
" Plug 'Bogdanp/rbrepl.vim' # Using Rapel instead

call plug#end()

"" Plugin Settings

" Ultisnips
"
" Ultisnips trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" quick-scope
"
" Turn on only for finding and til'ing
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-markdown
"
" Turn off folding by default
let g:vim_markdown_folding_disabled = 1

" neocomplete.vim
"
" For IDE-like autocomplete suggestions
let g:neocomplete#enable_at_startup = 1

if has('multi_byte')
  set encoding=utf-8
  " make listing invisible characters pretty
  set listchars=tab:!·,trail:·,precedes:·

  " indentLine
  "
  " give visual feedback of indentation
  let g:indentLine_color_term = 235
  let g:indentLine_char = '│'
endif

" when :make is run, uses rake instead of make
compiler rake

" nnoremap <F9> :!clear && gcc -std=c99 % && ./a.out<CR>
" nnoremap <F9> :!clear && gcc -std=c11 -fms-extensions % && ./a.out<CR>

" Set F9 to build and run files
nnoremap <F9> :make all<CR>

" Customize indentation of C switch statement
set cino=:0

" autocomplete blocks in C-like languages
autocmd FileType c inoremap {<CR> {<CR>}<Esc>O

" suggested mappings for go-vim
" These mappings only apply to go files
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
" au FileType go nmap <leader>ds <Plug>(go-def-split)
" au FileType go nmap <leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <leader>dt <Plug>(go-def-tab)
" au FileType go nmap <leader>gd <Plug>(go-doc)
" au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <leader>s <Plug>(go-implements)
" au FileType go nmap <leader>i <Plug>(go-info)
" au FileType go nmap <leader>e <Plug>(go-rename)

"" Aesthetics

" Make visual selections more visible
hi Visual ctermbg=Gray ctermfg=Black

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
set term=xterm-256color

" set color scheme to spacegray
" Available from https://github.com/ajh17/Spacegray.vim
" or https://github.com/domgetter/Spacegray.vim
" NOTE: Must be set AFTER background=dark is set.
colo spacegray

" Set background to none for terminal transparency
" NOTE: Must be set AFTER spacegray is loaded.
hi Normal  ctermbg=NONE
hi NonText ctermbg=NONE

" set search highlighting colors
" NOTE: Must be set AFTER spacegray is loaded.
hi Search cterm=NONE ctermfg=233 ctermbg=79

" Prevent syntax highlighting after 400 characters
set synmaxcol=400

"" Functionality

" Visually wrap lines at sane points
set linebreak

" keep a few lines on the screen above/below cursor
set scrolloff=5

" turn off last highlight with backslash
nnoremap <silent> \ :noh<CR>

" set leader to spacebar
let mapleader = " "

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

" Make Y yank to the end of the line
nnoremap Y y$

" set tabs to spaces
set ts=4 sts=2 sw=2 expandtab

" send Ruby expression to REPL Server with <leader>S and <leader>s
vmap <silent> <leader>s :ruby puts RapelClient.send_current_selection<CR>
vmap <silent> <leader>S :ruby RapelClient.send_and_print_below<CR>

