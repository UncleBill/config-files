""vim-scripts repos
" Plug 'vim-scripts/L9'
" Plug 'vim-jp/vital.vim'
" Plug 'vim-scripts/ingo-library'
" Plug 'ynkdir/vim-vimlparser'
Plug 'derekwyatt/vim-fswitch'
" Plug 'vim-scripts/FuzzyFinder'
"Plug 'rails.vim', { 'for': 'ruby' }
Plug 'danro/rename.vim'
" Plug 'Valloric/ListToggle'
Plug 'Valloric/MatchTagAlways'
" Plug 'gregsexton/MatchTag'
Plug 'Valloric/python-indent', {'for':'python'}
Plug 'vim-scripts/python.vim', {'for': 'python'}
" Plug 'KangOl/vim-pudb', {'for': 'python'}
Plug 'vim-scripts/python_match.vim', {'for': 'python'}
"Plug 'php-doc'
"Plug 'spf13/PIV'
"Plug 'YankRing.vim'
" non github repos
"Plug 'git://git.wincent.com/command-t.git'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" let g:Lf_ShortcutF = '<C-P>'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewResult = {
"       \ 'File': 1,
"       \ 'Buffer': 0,
"       \ 'Mru': 0,
"       \ 'Tag': 0,
"       \ 'BufTag': 1,
"       \ 'Function': 1,
"       \ 'Line': 0,
"       \ 'Colorscheme': 0,
"       \ 'Rg': 0,
"       \ 'Gtags': 0
"       \}

"Plug 'JazzCore/ctrlp-cmatcher'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" original repos on github
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
Plug 'tpope/vim-endwise'
Plug 'gregsexton/gitv'
" Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'kshenoy/vim-signature'
"Plug 'tpope/vim-rails.git'
" Plug 'Lokaltog/vim-powerline'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ ['relativepath'] ],
      \ }
      \ }
Plug 'mhinz/vim-startify'
Plug 't9md/vim-choosewin'
Plug 'vimwiki/vimwiki'
" Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
"Plug 'bootleq/vim-tabline'
"Plug 'gcmt/taboo.vim'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
" Plug 'osyo-manga/vim-watchdogs',{
"             \ 'depends': [ 'jceb/vim-hier','osyo-manga/shabadou.vim' ]
"             \ }
Plug 'sjl/gundo.vim'
" Plug 'mbbill/undotree'
" Plug 'epmatsw/ag.vim'
" Plug 'vim-scripts/css3'
" Plug 'ap/vim-css-color'  "Makes <c-w> unuse in Markdown
" Plug 'csslint.vim'
Plug 'vim-scripts/CSS-2.1-Specification', {'for': ['html', 'css']}
Plug 'vim-scripts/vim-stylus', {'for': 'stylus'}
Plug 'mattn/emmet-vim'
" Plug 'mattn/livestyle-vim'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'rbtnn/vimconsole.vim', {'for': 'vim'}
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-painter'
Plug 'vim-scripts/DrawIt'
"Plug 'benmills/vimux'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
packadd matchit
" Plug 'vim-scripts/matchit.zip'
"Plug 'c.vim'
"Plug 'a.vim'
Plug 'tpope/vim-repeat'
" Plug 'DataWraith/auto_mkdir'
"Plug 'quark-zju/vim-cpp-auto-include'
" Plug 'tpope/vim-dispatch'
"Plug 'pep8'
"pyflakes syntax checker for python
Plug 'git://github.com/pyflakes/pyflakes.git', {'for': 'python'}
"Plug 'functionlist.vim'
Plug 'vim-scripts/autohi'
Plug 'uguu-org/vim-matrix-screensaver'
" Plug 'koron/nyancat-vim'
Plug 'mattn/webapi-vim'
Plug 'UncleBill/google.vim'
Plug 'mattn/gist-vim'
Plug 'vim-scripts/jQuery', {'for': ['html', 'javascript']}
"Plug 'ervandew/supertab'
"Plug 'sudoku_game'
" Plug 'Yggdroot/indentLine'
"Plug 'vim-scripts/groovyindent'
" Plug 'VimOutliner'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/taglist.vim'
" Plug 'colorv.vim'
" Plug 'lilydjwg/colorizer'        " too slow
" Plug 'chirsbra/Colorizer'
"Plug 'kien/rainbow_parentheses.vim'
"colorscheme"
"{{{
Plug 'flazz/vim-colorschemes'
Plug 'UncleBill/prism.vim'
" Plug 'vim-scripts/ScrollColors'
" Plug 'vim-scripts/molokai'
" Plug 'altercation/vim-colors-solarized'
" Plug 'noahfrederick/Hemisu'
Plug 'vim-scripts/Atom'
" Plug 'gregsexton/Muon'
" Plug 'vim-scripts/zenesque.vim'
"}}}
"syntax
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'leafo/moonscript-vim', {'for': 'moon'}
Plug 'digitaltoad/vim-pug', {'for': ['pug']}
Plug 'vim-jp/cpp-vim', {'for': ['c++', 'c']}
Plug 'cespare/vim-toml'
" Plug 'gilligan/vim-lldb', {'for': ['c++', 'c']} " https://github.com/gilligan/vim-lldb/issues/4
Plug 'vim-scripts/gdbmgr', {'for': ['c++', 'c']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss', 'sass']}
Plug 'vim-scripts/less.vim', {'for': 'less'}
Plug 'othree/html5.vim'
" Plug 'davidhalter/jedi-vim'
"Plug 'vim-scripts/vim-line-numbers'
" Plug 'myusuf3/numbers.vim'
"Plug 'vim-scripts/togglecursor'
"Plug 'vim-scripts/Vimpanel'
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['css', 'js=javascript']
Plug 'terryma/vim-instant-markdown', {'for': 'markdown'}
" Plug 'nathanaelkane/vim-indent-guides'
" completion plugin
Plug 'vim-scripts/cmdline-completion'
Plug 'tyru/capture.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'pythoncomplete'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'JazzCore/neocomplcache-ultisnips'
"Plug 'Rip-Rip/clang_complete'
" Plug 'SirVer/ultisnips'
"Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neocomplcache'
" Plug 'Shougo/neocomplete.vim'
" Plug 'UncleBill/neco-git-commit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/neocomplcache-clang'
" Plug 'Shougo/context_filetype.vim'
" Plug 'osyo-manga/vim-precious'
Plug 'kana/vim-textobj-user'
"Plug 'Shougo/unite-session'
Plug 'honza/vim-snippets'
" Plug 'hrsh7th/vim-neco-calc'
" Plug 'UncleBill/neoc-git-commit'
" Plug 'UncleBill/neco-look'
" Plug 'UncleBill/neco-stardict'
"Plug 'violetyk/neco-php'
"Plug 'zhaocai/neco-googlesuggest'
" Plug 'Shougo/unite.vim'
"nnoremap <C-p> :Unite file_rec/async -auto-preview -auto-resize<cr>
Plug 'vim-scripts/sudo.vim'
Plug 'majutsushi/tagbar'
"unite plugins"
"unite plgins+------------------------------------------------------+
" Plug 'tsukkee/unite-help'
" Plug 'tsukkee/unite-tag'
" Plug 'Shougo/unite-outline'
" Plug 'Shougo/neomru.vim'
"Plug 'ujihisa/unite-locate'
" Plug 'sgur/unite-everything'
" Plug 'ujihisa/unite-colorscheme'
"Plug 'hakobe/unite-script'
"Plug 'tacroe/unite-alias'
" Plug 'sgur/unite-git_grep'
"Plug 'mattn/unite-remotefile'
"Plug 'thinca/vim-unite-history'
"Plug 'soh335/unite-qflist'
" Plug 'ujihisa/unite-gem'
"Plug 'sgur/unite-qf'
"Plug 'tungd/unite-session'
"Plug 'oppara/vim-unite-cake'
"Plug 'choplin/unite-vim_hacks'
"+------------------------------------------------------+unite plgins
"Plug 'SQLComplete.vim'
"Plug 'SQLUtilities'
" Plug 'walm/jshint.vim'
" Plug 'hallettj/jslint.vim'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.jsx', 'typescript.tsx']}
Plug 'jparise/vim-graphql'
Plug 'tasn/vim-tsx'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'typescript', 'typescript.jsx', 'typescript.tsx']}
" Plug 'marijnh/tern_for_vim'    " Intelligent javascript tooling
Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
Plug 'chemzqm/wxapp.vim'

function! JsBeautifyWrapper()
    if &filetype == ''
        setfiletype javascript
    endif
    call JsBeautify()
endfunction
command! JsBeautify call JsBeautifyWrapper()
"Plug 'intuited/vim-noderepl'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim/killersheep'
"Plug 'guyzmo/vim-etherpad'
" vim:fdm=marker
