"mapping{
nnoremap <F3> :<C-u>GundoToggle<CR>
noremap <silent><F6> <Cmd>CocCommand tsserver.organizeImports<CR>
" if has('gui_macvim')
"     nnoremap <silent> <D-e> :NERDTreeMirrorToggle<CR>
"     tnoremap <silent> <D-e> <C-w>:NERDTreeMirrorToggle<CR>
"     nnoremap <silent> <D-f> :NERDTreeFind<ENTER>
"     tnoremap <silent> <D-f> <C-w>:NERDTreeFind<ENTER>
" else
"     tnoremap <silent> <M-e> :NERDTreeMirrorToggle<ENTER>
"     tnoremap <silent> <M-e> <C-w>:NERDTreeMirrorToggle<ENTER>
" endif
if has('gui_macvim')
    nnoremap <silent> <D-e> <Cmd>CocCommand explorer --toggle<CR>
    tnoremap <silent> <D-e> <Cmd>CocCommand explorer --no-reveal-when-open<CR>
    nnoremap <silent> <D-f> <Cmd>CocCommand explorer --reveal<CR>
    tnoremap <silent> <D-f> <Cmd>CocCommand explorer --no-reveal-when-open<CR>
else
    nnoremap <silent> <M-e> <Cmd>CocCommand explorer --toggle<CR>
    tnoremap <silent> <M-e> <Cmd>CocCommand explorer --no-reveal-when-open<CR>
    nnoremap <silent> <M-f> <Cmd>CocCommand explorer --reveal<CR>
    tnoremap <silent> <M-e> <Cmd>CocCommand explorer --no-reveal-when-open<CR>
endif

imap <silent> <M-e> <Esc><M-e>
nmap <silent> <M-t> :TagbarToggle<ENTER>
imap <silent> <M-t> <Esc><M-t>
nnoremap - <C-x>
nnoremap + <C-a>
nmap <S-F7> <F7><ENTER>
imap <S-F7> <Esc><F7><ENTER>
"inoremap {<ENTER> {}<Esc>i<ENTER><Esc>k=2jo
inoremap <c-u> <C-g>u<c-u>
inoremap <c-w> <C-g>u<c-w>
inoremap <c-s><c-s> <Cmd>w<cr>

nnoremap <F4> <Cmd>set number!<CR>
nnoremap <S-F4> <Cmd>set relativenumber!<CR>
imap <F4> <esc><F4>
imap <S-F4> <Esc><F4>

nnoremap <silent><F5> <Cmd>QuickRun<cr>
imap <silent><F5> <esc><F5>

" bind print-screen to TOhtml
nnoremap <silent><t_%9> <Cmd>TOhtml<cr>

inoremap <Leader><C-P> <Cmd>call PhpDocSingle()<CR>i
nnoremap <Leader><C-P> <Cmd>call PhpDocSingle()<CR>
vnoremap <Leader><C-P> <Cmd>call PhpDocRange()<CR>
vnoremap <silent> <Enter> <Cmd>EasyAlign<cr>

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
  return "\<Esc>" . keys
endfunction
inoremap <expr><D-cr> InsertLine(0)
inoremap <expr><D-S-cr> InsertLine(1)

nmap <leader>= zf%
nnoremap <silent> <m-h> :noh<cr>
inoremap <silent><c-cr> <c-r>=emmet#expandAbbr(0,"")<cr>
nnoremap <silent><c-cr> <Cmd>call emmet#expandAbbr(3,"")<cr>
vnoremap <silent><c-cr> :call emmet#expandAbbr(2,"")<cr>
imap <M-'> <Space>+ 1
nmap <C-=> mzgg=G'z
if has('windows')
  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y
  map <C-V> "+gP
  map <S-Insert> "+gP
  map <C-s> <Cmd>w<CR>
endif
"map <c-a> ggVG
"****************************************
""mapping for edit vimrc{{{
nnoremap <silent><leader>ev <Cmd>vsplit ~/.vim/<cr>
nnoremap <silent><leader>sv <Cmd>vsplit ~/.vim/<cr>
"}}}
""}
"windows navigating{{{
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
noremap <silent><C-Tab> <Cmd>tabn<cr>
noremap <silent><C-S-Tab> <Cmd>tabp<cr>
tnoremap <silent><C-Tab> <Cmd>tabn<cr>
tnoremap <silent><C-S-Tab> <Cmd>tabp<cr>
inoremap <silent><C-Tab> <Cmd>tabn<cr>
inoremap <silent><C-S-Tab> <Cmd>tabp<cr>
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
tnoremap <D-1> <C-w>1gt
tnoremap <D-2> <C-w>2gt
tnoremap <D-3> <C-w>3gt
tnoremap <D-4> <C-w>4gt
tnoremap <D-5> <C-w>5gt
tnoremap <D-6> <C-w>6gt
tnoremap <D-7> <C-w>7gt
tnoremap <D-8> <C-w>8gt
tnoremap <D-9> <C-w>9gt
tnoremap <D-0> <C-w>10gt
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F9> <Plug>(coc-rename)
nmap <silent> <F10> <Plug>(coc-translator-p)
vmap <silent> <F10> <Plug>(coc-translator-pv)
xmap <silent> <F8>  <Plug>(coc-codeaction)
nmap <silent> <F8>  <Plug>(coc-codeaction)
nnoremap <silent> <D-CR> <Cmd>call CocActionAsync('pickColor')<cr>
nnoremap <silent> <D-S-CR> <Cmd>call CocActionAsync('colorPresentation')<cr>


nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" temporarily fix https://github.com/macvim-dev/macvim/issues/925
function! Interceptor()
  let line0 = getline(".")
  let line = matchstr(line0, "http[^]\"\) ]*")

  if line == ""
      let line = matchstr(line0, "ftp[^\"\) ]*")
  endif

  if line == ""
      let line = matchstr(line0, "file[^\"\) ]*")
  endif

  let line = escape(line, "#?&;|%")
  exec ':silent !open ' . line
endfunction

nnoremap <silent> gx <Cmd>call Interceptor()<CR>
