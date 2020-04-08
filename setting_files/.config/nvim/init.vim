" general
"
"set nobackup
set noswapfile
set autoread
set hidden

" Auto detecting encode. Jis type encoding must be specified head of encode list
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis

" show typing command
set showcmd

nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]

" looking
" show column no.
set number
" show cursor line
set cursorline

set virtualedit=onemore

set smartindent
" show pair brackets
set showmatch
" show status line
set laststatus=2
" command completion
set wildmode=list:longest

" Tab space
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set expandtab
set tabstop=4
set shiftwidth=4

" Search
" Search regardless case
" set ignorecase
" Search with case sensitivity
set smartcase
" Search while typing
set incsearch
" Return to the biginning after the last result 
set wrapscan
" hilight search word
set hlsearch
" esc to no hilight 
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"colorscheme solarized
colorscheme codedark

"shortcut
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Plugin python
autocmd BufRead,BufNewFile *.py setfiletype python
autocmd FileType python setlocal completeopt-=preview

" YCM Plugin
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_insertion = 1

"""""""""""" Denite """"""""""""""""""""""
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

nnoremap <space>g :Denite grep<CR>
nnoremap <space>f :Denite file/rec<CR>
nnoremap <space>b :Denite buffer<CR>

"""""""""""" Dein """"""""""""""""""""""""""
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let g:rc_dir    = '~/.vim/rc'
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,       {'lazy': 0})
  call dein#load_toml(s:lazy_toml,  {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set visualbell t_vb=