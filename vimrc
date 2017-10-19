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

" Asynchronous plugins require vim>=0.8
if v:version < 800
    Plugin 'scrooloose/syntastic'               " Linter
else
    Plugin 'w0rp/ale'                           " Linter
endif

" Restrict heavy plugins (i.e. autocomplete) to local machine
" if has('macunix')
    " Plugin 'davidhalter/jedi-vim'
    " Plugin 'ervandew/supertab'
" endif

Plugin 'altercation/vim-colors-solarized'       " Colorscheme
Plugin 'scrooloose/nerdcommenter'               " Auto-commenting
Plugin 'tpope/vim-fugitive'                     " Git integration
" Plugin 'bling/vim-airline'                      " Status bar
" Plugin 'vim-airline/vim-airline-themes'         " Status bar customization
Plugin 'itchyny/lightline.vim'                  " Status bar
Plugin 'jpalardy/vim-slime'                     " SLIME
Plugin 'aperezdc/vim-template'                  " Default templates by filetype
Plugin 'christoomey/vim-tmux-navigator'         " Tmux navigation hotkeys
Plugin 'tpope/vim-eunuch'                       " Unix commands
Plugin 'mgedmin/pythonhelper.vim'               " Show parent block in status
Plugin 'tpope/vim-obsession'                    " Backups
Plugin 'ctrlpvim/ctrlp.vim'                     " (?) Fuzzy finder
Plugin 'LaTeX-Box-Team/LaTeX-Box'               " (?) LaTeX commands
Plugin 'flazz/vim-colorschemes'                 " (?) More colorschemes
Plugin 'Shougo/neocomplete.vim'                 " (?) Autocompletion
Plugin 'junegunn/goyo.vim'                      " Distraction-free writing
" Plugin 'ajh17/VimCompletesMe'
" Plugin 'scrooloose/nerdtree'
" Plugin 'mileszs/ack.vim'
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

au BufNewFile,BufRead *.tex set syntax=tex

let g:email='mstone5@mgh.harvard.edu'

" Enable jedi completion with supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" Syntastic prefs
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_cpp_include_dirs = ['/apps/lab/miket/seqan-trunk/core/include/']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

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

" Null string if not a python file
if !exists("*TagInStatusLine")
  function TagInStatusLine()
    return ''
  endfunction
endif

" Lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Airline prefs
set laststatus=2
" let g:airline_enable_syntastic=1
" let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='solarized'
" let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:airline_section_c='%f' " : %{TagInStatusLine()}'
"let g:airline_section_c=airline#section#create_left(['file', '%{TagInStatusLine()}'])
"let g:airline_section_x=airline#section#create_right(['filetype'])
let g:airline_section_x=''
let g:airline_section_y='%p%%'
let g:airline_section_z='%l:%c'

" Latex-Box prefs
let g:LatexBox_latexmk_options='-pvc -xelatex'
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:Tex_ViewRule_pdf = 'Skim'

let g:macvim_skim_app_path='/Applications/Skim.app'

" Prose mode
let g:goyo_width=82
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  " if !has('gui_running')
    " let g:solarized_termcolors=256
  " endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
