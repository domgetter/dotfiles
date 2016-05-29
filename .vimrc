set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
let mapleader = " "
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue

set laststatus=2
set relativenumber number
set history=10000

set background=dark
nnoremap G Gzz
set t_Co=256
nmap <leader>n yyp<C-a>
nnoremap <C-j> 2<C-e>
nnoremap <C-k> 2<C-y>
nnoremap <silent> \ :noh<CR>
inoremap kkk <esc>kkk
inoremap jjj <esc>jjj
nnoremap Y y$
set ts=4 sts=2 sw=2 expandtab
set listchars=tab:!·,trail:·,precedes:·
colo spacegray
let g:indentLine_color_term = 235
let g:indentLine_char = '│'

function! g:get_last_line_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum, col] = getpos("'>")[1:2]
  return lnum
endfunction

function! g:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call plug#begin('~/.vim/plugged')

" One of these is preventing > 80 column typing, and I don't know which one. It's not polyglot as far as I can tell

Plug 'koron/nyancat-vim'
Plug 'Bogdanp/rbrepl.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'domgetter/vim-rapel-client'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'othree/eregex.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'

" Plugins I don't like/care about
" Plug 'boucherm/ShowMotion'
" Plug 'nathanaelkane/vim-indent-guides' " Couldn't get it to work with Spacegray
" Plug 'joeytwiddle/sexy_scroller.vim' " Slow on long lines
" Plug 'vim-airline/vim-airline'
" Plug 'unblevable/quick-scope' " It was cool, but I don't use it enough

call plug#end()

" Ruby Shenanigans

" Vim::Registers will return a Hash of all registers
"   indexed by their name
"
"   :ruby Vim::Registers[:a]
"   => "something in the a register"
"
" Vim::Registers should return a hash-like thing
" A register, when referred to, should 

ruby << EOF
  module Vim
    class NotAValidRegisterError < StandardError; end
    class RegisterReadOnlyError< StandardError; end
    class RegisterList
      REGISTERS = ["\"", *0..9, "-", *'a'..'z', ":", ".", "%", "#", "*", "+", "~", "_", "/"].map(&:to_s)
      READ_ONLY_REGISTERS = [":", ".", "%", "#"]
      def [](reg)
        raise NotAValidRegisterError, "\"#{reg} is not a valid register" unless REGISTERS.include?(reg.to_s)
        Vim.evaluate("@" + reg.to_s)
      end
      def []=(reg, str)
        raise NotAValidRegisterError, "\"#{reg} is not a valid register" unless REGISTERS.include?(reg.to_s)
        raise RegisterReadOnlyError, "\"#{reg} is read-only" if READ_ONLY_REGISTERS.include?(reg.to_s)
        Vim.command("let @#{reg}=\"#{str}\"")
      end
      alias :get :[]
      def each
        REGISTERS.each {|r| yield self[r]}
      end 
      include Enumerable
    end
    @@registers = RegisterList.new
    def self.registers
      @@registers
    end
  end

EOF

vmap <silent> <leader>s :ruby puts RapelClient.send_current_selection<CR>
vmap <silent> <leader>S :ruby RapelClient.send_and_print_below<CR>

