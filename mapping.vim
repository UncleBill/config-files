"mapping{
nnoremap <F3> :<C-u>GundoToggle<CR>
nmap <silent> <M-e> :NERDTreeToggle<ENTER>
imap <silent> <M-e> <Esc><M-e>
nmap <silent> <M-t> :TagbarToggle<ENTER>
imap <silent> <M-t> <Esc><M-t>
nnoremap - <C-x>
nnoremap + <C-a>
nmap <F7> :tabnew<CR>
imap <F7> <Esc><F7>
nmap <S-F7> <F7><ENTER>
imap <S-F7> <Esc><F7><ENTER>
nmap <F8> :tabNext<ENTER>
imap <F8> <Esc><F8>
map <leader><BS><BS> :wqa<ENTER>
imap <leader><BS><BS> <Esc>:wqa<ENTER>
"inoremap {<ENTER> {}<Esc>i<ENTER><Esc>k=2jo
imap <leader><Esc><Esc> <Esc>:update<ENTER>
nmap <Space><cr> :w<ENTER>

nnoremap <F4> :set number!<CR>
nnoremap <S-F4> :set relativenumber!<CR>
imap <F4> <esc><F4>
imap <S-F4> <Esc><F4>

nnoremap <silent><F5> :QuickRun<cr>
imap <silent><F5> <esc><F5>

" bind print-screen to TOhtml
nnoremap <silent><t_%9> :TOhtml<cr>

inoremap <Leader><C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader><C-P> :call PhpDocSingle()<CR>
vnoremap <Leader><C-P> :call PhpDocRange()<CR>
vnoremap <silent> <Enter> :EasyAlign<cr>

nnoremap _ <c-w>_
nmap <M-;> $a;<Esc>
imap <M-;> <Esc><M-;>
nmap <M-,> $a,<Esc>
imap <M-,> <Esc><M-,>
nmap <M-.> ^i.<Esc>$
imap <M-.> <Esc><M-.>a
nmap <leader>= zf%
nmap <silent><m-h> :noh<cr>
vmap <c-cr> <c-y>,
imap <M-'> <Space>+ 1
nmap <C-=> mzgg=G'z
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
map <C-V> "+gP
map <S-Insert> "+gP
map <C-s> :w<CR>
"map <c-a> ggVG
"****************************************
""mapping for edit vimrc{{{
nnoremap <silent><leader>ev :vsplit ~/.vim/<cr>
nnoremap <silent><leader>sv :vsplit ~/.vim/<cr>
"}}}
""}
"windows navigating{{{
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-tab> <C-w>p
"}}}
"abbr
abbr #G +>----------------------->+
abbr #g +<-----------------------<+
abbr #k +~~~~~~~~~~~~~~~~~~~+
abbr #l +-----------------------------------------+
" neocomplete Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
