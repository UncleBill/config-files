"mapping{
nnoremap <F3> :<C-u>GundoToggle<CR>
nnoremap <silent> <M-e> :NERDTreeMirrorToggle<ENTER>
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
inoremap <c-u> <C-g>u<c-u>
inoremap <c-w> <C-g>u<c-w>
inoremap <c-s><c-s> <c-o>:w<cr>
inoremap <c-v> <c-r>*

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
inoremap <silent><c-cr> <c-r>=emmet#expandAbbr(0,"")<cr>
nnoremap <silent><c-cr> :call emmet#expandAbbr(3,"")<cr>
vnoremap <silent><c-cr> :call emmet#expandAbbr(2,"")<cr>
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
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-tab> <C-w>p
"}}}
"abbr
abbr #G +>----------------------->+
abbr #g +<-----------------------<+
abbr #k +~~~~~~~~~~~~~~~~~~~+
abbr #l +-----------------------------------------+
" neocomplete Plugin key-mappings.
function! TabJumpOut()
    let line = getline('.')
    let pos = col('.')
    let next_char = line[pos]

    if stridx(";.]>)}\'\"`", next_char) > -1 && pos != col('$')
        return "\<C-o>$"
    else
        return "\<TAB>"
    endif
endf

function! CouldJump2End()
    let line = getline('.')
    let pos = col('.')
    let next_char = line[pos]

    if stridx(";.]>)}\'\"`", next_char) > -1 && pos != col('$')
        return 1
    else
        return 0
endfunction

function! g:SmartTab()
    if neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)" 
    elseif CouldJump2End()
        return "\<C-o>$"
    elseif emmet#isExpandable()
        return "\<C-y>,"
    else
        return "\<TAB>"
    endif
endfunction

inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
imap <expr><Tab> g:SmartTab()
smap <expr><Tab> g:SmartTab()

function! Match_pair() 
    let pairs = [ ['(',')'], ['\[','\]'], ['{','}']] 
    let p         = ''
    let col       = 0
    let minlin = 0
    let mincol = 0
    for pair in pairs
        " echomsg 'match'.pair[0]
        let [lnum, col] = searchpairpos(pair[0], '', pair[1], 'n')
        " echo lnum.'x'.col
        if lnum > 0
            if minlin == 0
                let minlin = lnum
                let mincol = col
                let p = pair[0]
            elseif lnum < minlin || (lnum == minlin && col < mincol)
                let minlin = lnum
                let mincol = col
                let p = pair[0]
            endif
        endif
    endfor
    if p == '\['
        let p = '['
    endif
    if !empty(p)
        " echo 'min'.p
        execute "normal va".p
    endif
endfunction

nnoremap <silent> <c-m> :call Match_pair()<cr>
