"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"plugins here, coc for example
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'scrooloose/nerdtree'
" Plug 'ryanosis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Integrated terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Keybindings
map <C-b> :NERDTreeToggle<CR>       " Open/Close NerdTree
" File Searching
" ctrl+p = search file
" ctrl+t = new tab
" ctrl+s = open below (split view)
" ctrl+v = virtical split
" enter to open in currently selected panel
nnoremap <C-p> :FZF<CR>     
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',  
  \ 'ctrl-s': 'split',      
  \ 'ctrl-v': 'vsplit'       
  \}
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" I finally learned to love vim
" Switching to neovim now!

" General
set history=500                     " Set history in VIM to 500
set number                          " Show line numbers (shown on side)
syntax on                           " Syntax highlighting is fun and makes this usable as an editor
set linebreak                       " Set linebreak to prevent words from being split across lines
set showbreak=+++                   " Show line breaks with +++
set showmatch                       " Highlight matching brace
set ruler                           " Show row and column ruler info
set undolevels=1000                 " Number of undo levels
set backspace=indent,eol,start      " Backspace behavior

" Copy and paste behavior
set clipboard=unnamedplus           " Use system clipboard

" Searching
set hlsearch                        " Highlight all search results
set smartcase                       " Enable smart-case search
set ignorecase                      " Case insensitive searching
set incsearch                       " Searches for strings incrementally 

" Indenting 
set autoindent                      " Automatically indent new lines
set expandtab                       " Use spaces instead of tabs
set shiftwidth=4                    " Number of auto-indent spaces
set smartindent                     " Enable smart indent
set smarttab                        " Enable smart tab
set softtabstop=4                   " Number of spaces per tab
