"" VUNDLE STUFF
"" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"" Plugin 'user/L9', {'name': 'newL9'}
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'Lokaltog/vim-easymotion'
""Plugin 'scrooloose/syntastic'
""Plugin 'scrooloose/nerdtree'
""Plugin 'jistr/vim-nerdtree-tabs'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line

" Tabbing and indentation
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
vnoremap < <gv " keep visual selection when indenting
vnoremap > >gv " keep visual selection when indenting

" Mouse
set mouse=a

" Color scheme
set t_Co=256
"color wombat256mod

" Enable syntax highlighting
" filetype off
" filetype plugin indent on
syntax on

" Show line numbers and length
set number  " show line numbers
set tw=83   " width of document
set nowrap  " don't automatically wrap on load
"set fo-=t   " don't automatically wrap text when typing
set colorcolumn=84
set laststatus=2
set cursorline
highlight ColorColumn ctermbg=233

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" NERDTree shortcut
" Is now netrw shortcut
let mapleader = ","
nmap <leader>ne :Vex<cr>
nmap <leader>he :Hex<cr>
nmap <leader>e :Explore<cr>

" Resize splits shortcut
nmap <leader>k :res -2<cr>
nmap <leader>j :res +2<cr>
nmap <leader>h :vertical resize -5<cr>
nmap <leader>l :vertical resize +5<cr>
