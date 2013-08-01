set nocompatible
let $MYVIMRC_="~/Dropbox/works/Vim/"
"g:snippets_dir
"let g:snippets_dir = $MYVIMRC_ . 'snippets'
"let g:neosnippet#snippets_directory=$MYVIMRC_ . 'snippets'
"let g:clang_library_path='/usr/include/'
" let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet/autoload/neosnippet,~/Dropbox/works/Vim/snippets'
let g:snips_author = "UncleBill"
let g:snips_email = "billbill290@gmail.com"
let g:snips_github = "UncleBill"
" neocomplete settings
" Enable heavy omni completion.
" For snippet_complete marker.
"let g:AutoPairsFlyMode = 1
if has('conceal')
  set conceallevel=2
endif
let g:indentLine_noConcealCursor=1

set backupdir=~/.vim/.backup/
set directory=~/.vim/.vim_swp/
set path=.,./lib,./include,/usr/local/include,/usr/include
"set dictionary=~/
au BufEnter *.php set dictionary+=~/.vim/extra/php-funclist.txt
au BufLeave *.php set dictionary-=~/.vim/extra/php-funclist.txt
set history=10000
set hidden
set shiftwidth=4
" set showbreak=--->
set tabstop=4
set expandtab
set smartindent
set numberwidth=1
set ignorecase
"set smartcase
set relativenumber
set number
set noerrorbells
set visualbell
set wildmenu
" set noequalalways
" set keywordprg=sdcv\ -n
" -----------------------------------------
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.psd
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**,*.map
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
let g:startify_session_delete_buffers=1
let g:startify_session_persistence=1
let g:startify_change_to_vcs_root=1
" -----------------------------------------
set backspace=indent,eol,start
"Toggle Menu and Toolbar
syntax on
let g:syntastic_ignore_files=['^/usr/include/', '\c\.h$']
let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='!'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 0
" let g:syntastic_check_on_wq=0
" set fileencodings=utf-8,gbk
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set synmaxcol=300
set guioptions=acgit
set laststatus=2
set lazyredraw
"don't need show mode dude Powerline
set noshowmode
set matchtime=0
set ruler
set cursorline
set cursorcolumn
set cc=80
highlight clear SignColumn
set hlsearch
set incsearch
set scrolljump=3
set scrolloff=1
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 11
set guifont=Consolas:h9
"let g:indent_guides_auto_colors = 0
"
" airline settings
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

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
" let NERDTreeQuitOnOpen=1
let g:tagbar_autofocus=1
let g:tagbar_width=35
let g:tagbar_expand = 1
let g:tagbar_sort = 0
let g:tagbar_autopreview = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0
let g:gist_use_password_in_gitconfig = 1
let g:gist_browser_command = 'google-chrome %URL% &'
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gitgutter_enabled = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:gist_use_password_in_gitconfig = 1
let g:gitgutter_enabled = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist={'*':0}
let g:ycm_filetype_whitelist={'*':1}
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"autocmd BufEnter *.py let g:neocomplete_enable_auto_select = 0    " for jedi's popup
"autocmd BufLeave *.py let g:neocomplete_enable_auto_select = 1
set autoread
"let g:Powerline_symbols = 'fancy'
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                      "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:user_emmet_settings = {
\  'perl' : {
\    'indentation' : '  ',
\    'aliases' : {
\      'req' : "require '|'"
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'w' : "warn \"${cursor}\";",
\    },
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'html':{
\       'inline_elements':''
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\  'javascript' : {
\    'snippets' : {
\      'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
\      'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
\      'fn' : "(function() {\n\t${cursor}\n})();",
\      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
\    },
\  },
\ 'java' : {
\  'indentation' : '    ',
\  'snippets' : {
\   'main': "public static void main(String[] args) {\n\t|\n}",
\   'println': "System.out.println(\"|\");",
\   'class': "public class | {\n}\n",
\  },
\ },
\}
call tcomment#DefineType('less',              '/* %s */'         )
call tcomment#DefineType('less_block',        g:tcommentBlockC   )
call tcomment#DefineType('less_inline',       g:tcommentInlineC  )
