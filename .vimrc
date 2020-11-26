python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set encoding=utf-8
set noshowmode "hide default bar
set laststatus=2 "always show bar 
set mouse=a
set ttymouse=xterm2
call plug#begin('~/.vim/plugged')
Plug 'maralla/completor.vim'
Plug 'masawada/completor-dictionary'
"Plug 'davidhalter/jedi-vim'
"Plug 'airblade/vim-gitgutter.git'
"Plug 'junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/limelight.vim'
Plug 'dylanaraps/wal.vim'
"Plug 'vim-scripts/AutoComplPop'
call plug#end()

"#set termguicolors

colorscheme wal
"let g:jedi#popup_select_first = 0 "select first autocomplete suggestion
"let g:jedi#popup_on_dot = 0 "autocompletion disabled with period .

" Only do this part when compiled with support for autocommands
if has("autocmd")
augroup redhat
autocmd!
"       " When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
augroup END
endif
