set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'       " Colorscheme
Plug 'aperezdc/vim-template'                  " Default templates by filetype
Plug 'christoomey/vim-tmux-navigator'         " Tmux navigation hotkeys
" Plug 'dense-analysis/ale'                     " Linter
Plug 'itchyny/lightline.vim'                  " Status bar
Plug 'junegunn/fzf.vim'                       " fuzzy finding
Plug 'jpalardy/vim-slime'                     " SLIME
Plug 'preservim/nerdcommenter'                " Auto-commenting
Plug 'vimwiki/vimwiki'                        " wiki/org-lite
Plug 'snakemake/snakemake', {'rtp': 'misc/vim'}  " Snakemake syntax highlighting

call plug#end()

syntax on
set modeline

let g:email='matthew.stone12@gmail.com'

" Soft tabs of width 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set colorcolumn=81
set backspace=indent,eol,start
set number
set cursorline

au FileType sh,c,cpp,r setlocal
    \ tabstop=2 
    \ expandtab 
    \ shiftwidth=2 
    \ softtabstop=2

" Sane split navigation, and compatibility with vim-tmux-navigator
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Set vim as crontab editor
autocmd filetype crontab setlocal nobackup nowritebackup

" Snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk     set syntax=snakemake

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
" let g:solarized_termtrans=1
" set background=light
" colorscheme solarized

" Solarized dark
let g:solarized_termtrans=0
set background=dark
colorscheme solarized

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
        return 'Matt Stone'
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
