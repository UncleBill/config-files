"mapping{
nnoremap <F3> :<C-u>GundoToggle<CR>
nnoremap <F6> :!ls<cr>:e 
if has('gui_macvim')
    nnoremap <silent> <D-e> :NERDTreeMirrorToggle<ENTER>
    tnoremap <silent> <D-e> <C-w>:NERDTreeMirrorToggle<ENTER>
    nnoremap <silent> <D-f> :NERDTreeFind<ENTER>
    tnoremap <silent> <D-f> <C-w>:NERDTreeFind<ENTER>
else
    tnoremap <silent> <M-e> :NERDTreeMirrorToggle<ENTER>
    tnoremap <silent> <M-e> <C-w>:NERDTreeMirrorToggle<ENTER>
endif
imap <silent> <M-e> <Esc><M-e>
nmap <silent> <M-t> :TagbarToggle<ENTER>
imap <silent> <M-t> <Esc><M-t>
nnoremap - <C-x>
nnoremap + <C-a>
nmap <S-F7> <F7><ENTER>
imap <S-F7> <Esc><F7><ENTER>
nmap <F8> <Plug>(ale_fix)
map <leader><BS><BS> :wqa<ENTER>
imap <leader><BS><BS> <Esc>:wqa<ENTER>
"inoremap {<ENTER> {}<Esc>i<ENTER><Esc>k=2jo
imap <leader><Esc><Esc> <Esc>:update<ENTER>
nmap <Space><cr> :w<ENTER>
inoremap <c-u> <C-g>u<c-u>
inoremap <c-w> <C-g>u<c-w>
inoremap <c-s><c-s> <c-o>:w<cr>

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

" 类似 sublimetext 的 <d-cr><d-s-cr>
" 稍微不同的是 如果前或下一行是空行，不增加一行
function! InsertLine (before) abort
  let linenr = line('.')
  if a:before
    let preline = trim(getline(linenr - 1))
    let keys = 'O'
    if empty(preline) && linenr > 1
      let keys = 'kS'
    endif
  else
    let nextline = trim(getline(linenr + 1))
    let keys = 'o'
    if empty(nextline) && linenr < line('$')
      let keys = 'jS'
    endif
  endif
  echo keys
  return "\<Esc>" . keys
endfunction
inoremap <expr><D-cr> InsertLine(0)
inoremap <expr><D-S-cr> InsertLine(1)

nmap <leader>= zf%
nnoremap <silent> <m-h> :noh<cr>
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
noremap <silent><C-Tab> <esc>:tabn<cr>
noremap <silent><C-S-Tab> <esc>:tabp<cr>
tnoremap <silent><C-Tab> <esc>:tabn<cr>
tnoremap <silent><C-S-Tab> <esc>:tabp<cr>
inoremap <silent><C-Tab> <c-o>:tabn<cr>
inoremap <silent><C-S-Tab> <c-o>:tabp<cr>
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt
nnoremap <D-0> 10gt
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
    endif
endfunction

function! SmartTab()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)" 
  elseif  &filetype =~ 'html\|css\|less\|sass\|scss' && emmet#isExpandable()
    return "\<C-y>,"
  elseif pumvisible()
    return "\<c-n>"
  elseif CouldJump2End()
    return "\<C-o>$"
  elseif <SID>check_back_space()
    return "\<TAB>"
  else
    return coc#refresh()
    " return TabJumpOut()
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
imap <expr><Tab> SmartTab()
smap <expr><Tab> SmartTab()

" temporarily fix https://github.com/macvim-dev/macvim/issues/925
function! Interceptor()
  let line0=getline (".")
  let line=matchstr (line0, "http[^]\"\) ]*")

  if line==""
      let line=matchstr (line0, "ftp[^\"\) ]*")
  endif

  if line==""
      let line=matchstr (line0, "file[^\"\) ]*")
  endif

  let line= escape (line, "#?&;|%")
  exec ':silent !open ' . line
endfunction

nnoremap <silent> gx :call Interceptor()<CR>
