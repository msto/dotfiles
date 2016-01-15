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
" Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'jpalardy/vim-slime'
Plugin 'flazz/vim-colorschemes'
Plugin 'aperezdc/vim-template'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-eunuch'
" Plugin 'Valloric/YouCompleteMe'

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
au FileType sh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
" Soft breaks
au FileType tex,latex setlocal spell spelllang=en_us wrap linebreak nolist "textwidth=0 wrapmargin=0
" Hard breaks
" au FileType tex,latex setlocal spell spelllang=en_us textwidth=80

" Soft tabs of width 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set colorcolumn=81
set backspace=indent,eol,start
set number
set relativenumber
set cursorline

" Sane split navigation, and compatibility with vim-tmux-navigator
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Allow vim as crontab editor
autocmd filetype crontab setlocal nobackup nowritebackup

" Don't copy line numbers
" set mouse+=a

" Move by line on screen
" :map j gj
" :map k gk

" Snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

let g:email='mstone5@mgh.harvard.edu'

" Syntastic prefs
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_cpp_include_dirs = ['/apps/lab/miket/seqan-trunk/core/include/']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" Solarized light
let g:solarized_termtrans=1
set background=light
colorscheme solarized

" Solarized dark
" let g:solarized_termtrans=0
" set background=dark
" colorscheme solarized

" NERDCommenter prefs
let NERDSpaceDelims=1

" vim-template prefs
let g:templates_directory=['~/.vim/templates']
let g:templates_name_prefix='template'
let g:templates_user_variables=[['NAME', 'GetName']]
" let g:templates_no_builtin_templates=1

" vim-template variable expansion functions
if !exists("*GetName")
    function GetName()
        return 'Matthew Stone'
    endfunction
endif

" Airline prefs
set laststatus=2
" let g:airline_enable_syntastic=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_theme='solarized'
" let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep='|'
let g:airline_right_alt_sep='|'
let g:airline_section_x=airline#section#create_right(['filetype'])
let g:airline_section_y='%p%%'
let g:airline_section_z='%l:%c'

" Latex-Box prefs
let g:LatexBox_latexmk_options='-pvc -xelatex'
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:Tex_ViewRule_pdf = 'Skim'

let g:macvim_skim_app_path='/Applications/Skim.app'
