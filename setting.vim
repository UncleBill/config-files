let $MYVIMRC_="~/Dropbox/works/Vim/"
"g:snippets_dir
"let g:snippets_dir = $MYVIMRC_ . 'snippets'
"let g:neosnippet#snippets_directory=$MYVIMRC_ . 'snippets'
"let g:clang_library_path='/usr/include/'
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet/autoload/neosnippets,~/Dropbox/works/Vim/snippets'
" neocomplcache settings
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_max_list = 50
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_min_syntax_length = 2
let $MYDICTDIR = '~/Dropbox/works/Vim/dict/'
let g:neocomplcache_dictionary_filetype_lists={
    \ 'default' : $MYDICTDIR . 'words.dict',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'javascript' : $MYDICTDIR . 'javascript.dict',
    \ 'css' : $MYDICTDIR . 'css.dcit',
    \ 'php' : $MYDICTDIR . 'php.dict',
    \ 'vim' : $MYDICTDIR . 'vim.dict',
    \ 'xml' : $MYDICTDIR . 'xml.dict',
    \ 'html': $MYDICTDIR . 'html.dict'
    \}
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"set completeopt-=preview
"let g:neocomplcache_enable_auto_delimiter = 1
" For snippet_complete marker.
"let g:AutoPairsFlyMode = 1
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set backupdir=~/.vim/.backup/
set directory=~/Dropbox/works/Vim/vim_swp
set path=.,/usr/local/include,/usr/include
"set dictionary=~/
au BufEnter *.php set dictionary+=~/.vim/extra/php-funclist.txt
au BufLeave *.php set dictionary-=~/.vim/extra/php-funclist.txt
set history=1000
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set numberwidth=1
set ignorecase
"set smartcase
set relativenumber
set noerrorbells
set visualbell
set wildmenu
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e
set laststatus=2
set matchtime=0
set ruler
set cursorline
highlight clear SignColumn
set hlsearch
set incsearch
set scrolljump=5
set scrolloff=3
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
"let g:indent_guides_auto_colors = 0
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:gist_use_password_in_gitconfig = 1
let g:gitgutter_enabled = 0
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_filetype_blacklist={'*':0}
"let g:ycm_filetype_whitelist={'*':1}
"let g:ycm_collect_identifiers_from_comments_and_strins = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 0
"autocmd BufEnter *.py let g:neocomplcache_enable_auto_select = 0    " for jedi's popup
"autocmd BufLeave *.py let g:neocomplcache_enable_auto_select = 1
set autoread
"let g:Powerline_symbols = 'fancy'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                      \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
"let g:session_autoload='yes'
"let g:session_autosave='yes'
