set nocompatible
let $VIMROOT=expand('<sfile>:p:h')
"g:snippets_dir
"let g:snippets_dir = $VIMROOT . 'snippets'
let g:neosnippet#snippets_directory=$VIMROOT .. '/snippets'
"let g:clang_library_path='/usr/include/'
" let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets,~/.vim/snippets'
let g:snips_author = "UncleBill"
let g:snips_email = "billbill290@gmail.com"
let g:snips_github = "UncleBill"
" neocomplete settings
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#enable_camel_case_completion = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_underbar_completion = 1
" let g:neocomplete#max_list = 30
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#min_syntax_length = 2
let $MYDICTDIR = $VIMROOT .. '/dict/'
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : $MYDICTDIR . 'words.dict',
"     \ 'vimshell' : $HOME . '/.vimshell_hist',
"     \ 'javascript' : $MYDICTDIR . 'javascript.dict',
"     \ 'coffee' : $MYDICTDIR . 'javascript.dict',
"     \ 'css' : $MYDICTDIR . 'css.dcit',
"     \ 'php' : $MYDICTDIR . 'php.dict',
"     \ 'xml' : $MYDICTDIR . 'xml.dict',
"     \ 'html': $MYDICTDIR . 'html.dict',
"     \}
let g:vimwiki_list = [{'path': '~/vimwiki/'}]
let g:vimwiki_folding='expr'
" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:html_indent_inctags = "body,html,head,p,tbody"
set completeopt-=preview
set shortmess-=S
"let g:neocomplete_enable_auto_delimiter = 1
" For snippet_complete marker.
"let g:AutoPairsFlyMode = 1
if has('conceal')
  set conceallevel=2
endif
let g:indentLine_noConcealCursor=1

set backupdir=~/.vim/.backup/
set directory=~/.vim/.vim_swp/
" set undofile
" set undodir=~/.vim/.undo/
set path=.,./lib,./include,/usr/local/include,/usr/include
"set dictionary=~/
au BufEnter *.php set dictionary+=~/.vim/extra/php-funclist.txt
au BufLeave *.php set dictionary-=~/.vim/extra/php-funclist.txt
set history=10000
set hidden
set shiftwidth=2
" set showbreak=--->
set tabstop=2
set expandtab
set smartindent
set numberwidth=1
set ignorecase
"set smartcase
set relativenumber
set number
set noerrorbells
" set nosplitscroll
set visualbell
set wildmenu
set wildoptions=pum
set noequalalways
set re=1
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
let g:startify_custom_header =
            \ map(split(system('fortune'), '\n'), '"   ". v:val') + ['','']
" -----------------------------------------
set backspace=indent,eol,start
"Toggle Menu and Toolbar
syntax on
let g:syntastic_ignore_files=['^/usr/include/', '\c\.h$']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 0
" let g:syntastic_check_on_wq=0
set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set termencoding=utf-8
set synmaxcol=300
set guioptions=acgit
set laststatus=2
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set lazyredraw
"don't need show mode dude Powerline
set noshowmode
set showcmd
set matchtime=0
set updatetime=200
set ruler
" set cursorline
" set cursorcolumn
" set cc=80,100
highlight clear SignColumn
if !has("nvim")
  set signcolumn=auto
endif
set hlsearch
set incsearch
set scrolljump=3
set scrolloff=1
"set list
"set listchars=tab:›\ ,trail:???extends:#,nbsp:.
set guifont=Menlo-Regular:h18
" set guifont=HackNerdFontCompleteM-Regular:h15
"let g:indent_guides_auto_colors = 0
"
" airline settings
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_left_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = ''
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
" let g:nerdtree_tabs_autoclose = 0
let g:gist_use_password_in_gitconfig = 1
let g:gist_browser_command = 'open %URL%'
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
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.(swp|ico|git|svn))$'
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU"], v:count)'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_max_files = 5000

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
call tcomment#type#Define('less',              '/* %s */'         )
call tcomment#type#Define('less_block',        g:tcomment#block_fmt_c   )
call tcomment#type#Define('less_inline',       g:tcomment#inline_fmt_c  )
let g:ale_linters_explicit=1
let g:ale_fix_on_save=1
let g:ale_completion_autoimport=1
" if has("gui_macvim")
"   set transparency=10
" endif
