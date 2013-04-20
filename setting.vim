let $MYVIMRC_="~/Dropbox/works/Vim/"
"g:snippets_dir
"let g:snippets_dir = $MYVIMRC_ . 'snippets'
"let g:neosnippet#snippets_directory=$MYVIMRC_ . 'snippets'
let g:snippets_dir='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/Dropbox/works/Vim/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set backupdir=~/.vim/.backup/
set directory=~/Dropbox/works/Vim/vim_swp
set path=.,/usr/local/include,/usr/include
"set dictionary=~/
set history=1000
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set numberwidth=1
set ignorecase
set relativenumber
set noerrorbells
set visualbell
set wildmenu
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2
set matchtime=0
set ruler
set hlsearch
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
"let g:indent_guides_auto_colors = 0
let NERDTreeIgnore = ['\.pyc$']
let g:gist_use_password_in_gitconfig = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist={'*':0}
let g:ycm_filetype_whitelist={'*':1}
let g:ycm_collect_identifiers_from_comments_and_strins = 1
let g:ycm_autoclose_preview_window_after_completion = 1
set autoread
"let g:Powerline_symbols = 'fancy'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                      \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
