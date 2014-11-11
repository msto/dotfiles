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

Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
" Plugin 'itchyny/lightline.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'

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

syntax on
set modeline
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType tex,latex setlocal spell spelllang=en_us

" Soft tabs of width 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set colorcolumn=80
set backspace=indent,eol,start
set number
set relativenumber
set cursorline

" lightline colors
if !has('gui_running')
    set t_Co=256
endif
set noshowmode

" Syntastic prefs
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_include_dirs = ['/apps/lab/miket/seqan-trunk/core/include/']

" Solarized prefs
let g:solarized_termtrans=1
set background=light
colorscheme solarized

" NERDCommenter prefs
let NERDSpaceDelims=1

" Airline prefs
set laststatus=2
let g:airline_enable_syntastic=1
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_section_x=airline#section#create_right(['filetype'])
let g:airline_section_y='%p%%'
let g:airline_section_z='%l:%c'

" Lightline
" set laststatus=2
" let g:lightline = {
    " \ 'colorscheme': 'solarized',
    " \ 'active': {
    " \   'left': [ [ 'mode', 'paste' ],
                  " [ 'fugitive', 'filename' ] ],
    " \   'right': [ [ 'syntastic', 'lineinfo' ],
    " \              ['percent'],
    " \              ['filetype'] ]
    " \ },
    " \ 'component_expand': {
    " \   'syntastic': 'SyntasticStatuslineFlag',
    " \ },
    " \ 'component_type': {
    " \   'syntastic': 'error',
    " \ },
    " \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    " \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    " \ }

" augroup AutoSyntastic
  " autocmd!
  " autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
  " SyntasticCheck
  " call lightline#update()
" endfunction

    " \ 'separator': { 'left': "", 'right': "" },
    " \ 'subseparator': { 'left': "", 'right': "" }
" Arrow separators (requires patched font)
" \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
" \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }

" Latex-Box prefs
let g:LatexBox_latexmk_options = '-pvc'
