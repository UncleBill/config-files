set nocompatible
let $MYVIMRC_="~/Dropbox/works/Vim/"
"g:snippets_dir
"let g:snippets_dir = $MYVIMRC_ . 'snippets'
"let g:neosnippet#snippets_directory=$MYVIMRC_ . 'snippets'
"let g:clang_library_path='/usr/include/'
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet/autoload/neosnippet,~/Dropbox/works/Vim/snippets'
let g:snips_author = "UncleBill"
let g:snips_email = "billbill290@gmail.com"
let g:snips_github = "UncleBill"
" neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete_enable_auto_select = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
" let g:neocomplete#max_list = 30
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#min_syntax_length = 2
let $MYDICTDIR = '~/Dropbox/works/Vim/dict/'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : $MYDICTDIR . 'words.dict',
    \ 'vimshell' : $HOME . '/.vimshell_hist',
    \ 'javascript' : $MYDICTDIR . 'javascript.dict',
    \ 'coffee' : $MYDICTDIR . 'javascript.dict',
    \ 'css' : $MYDICTDIR . 'css.dcit',
    \ 'php' : $MYDICTDIR . 'php.dict',
    \ 'vim' : $MYDICTDIR . 'vim.dict',
    \ 'xml' : $MYDICTDIR . 'xml.dict',
    \ 'html': $MYDICTDIR . 'html.dict',
    \}
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:acp_enableAtStartup = 0
"set completeopt-=preview
"let g:neocomplete_enable_auto_delimiter = 1
" For snippet_complete marker.
"let g:AutoPairsFlyMode = 1
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set backupdir=~/.vim/.backup/
set directory=~/.vim/.vim_swp/
set path=.,./include,/usr/local/include,/usr/include
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
"set number
set noerrorbells
set visualbell
set wildmenu
" -----------------------------------------
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
" -----------------------------------------
set backspace=indent,eol,start
"Toggle Menu and Toolbar
syntax on
set synmaxcol=300
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e
set laststatus=2
"don't need show mode dude Powerline
set noshowmode
set matchtime=0
set ruler
set cursorline
highlight clear SignColumn
set hlsearch
set incsearch
set scrolljump=3
set scrolloff=1
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
"let g:indent_guides_auto_colors = 0
"
" airline settings
"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_fugitive_prefix = ''
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ''
let g:airline_theme = 'light'

if !has("gui_running")
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=red
    hi clear SpellCap
    hi SpellCap cterm=underline ctermfg=blue
    hi clear SpellLocal
    hi SpellLocal cterm=underline ctermfg=blue
    hi clear SpellRare
    hi SpellRare cterm=underline ctermfg=blue
endif
let NERDTreeIgnore=['\.pyc$', '\.bak$', '\.swp$']
let NERDTreeQuitOnOpen=1
let g:tagbar_autofocus=1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:gist_use_password_in_gitconfig = 1
let g:gist_browser_command = 'google-chrome %URL% &'
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gitgutter_enabled = 0
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_filetype_blacklist={'*':0}
"let g:ycm_filetype_whitelist={'*':1}
"let g:ycm_collect_identifiers_from_comments_and_strins = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"autocmd BufEnter *.py let g:neocomplete_enable_auto_select = 0    " for jedi's popup
"autocmd BufLeave *.py let g:neocomplete_enable_auto_select = 1
set autoread
"let g:Powerline_symbols = 'fancy'
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                      "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
