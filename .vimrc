" VUNDLE STUFF
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'beloglazov/vim-online-thesaurus'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" NERDTree shortcut
let mapleader = ","
nmap <leader>n :NERDTreeFocus<cr>
nmap <leader>cn :NERDTreeClose<cr>

" Tagbar
nmap <leader>t :TagbarToggle<cr>

" Resize splits shortcut
nmap <leader>k :res -2<cr>
nmap <leader>j :res +2<cr>
nmap <leader>h :vertical resize -5<cr>
nmap <leader>l :vertical resize +5<cr>

" Markdown/pandoc syntax
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

" Easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

" Online-thesaurus
nmap <leader>K :OnlineThesaurusCurrentWord<cr>

" Tab navigation
nnoremap H gT
nnoremap L gt

" Bind Hexmode
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

autocmd FileType make setlocal noexpandtab
