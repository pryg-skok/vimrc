function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction


function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction


function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let branch = fugitive#head()
    return branch !=# '' ? '⎇  '.branch : ''
    endif
  catch
  endtry
  return ''
endfunction


function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction


function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '[No ft]') : ''
endfunction


function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction


function! LightlineFilename()
  return ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction


function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction


augroup AutoNeomake
  autocmd!
  autocmd BufWritePost *.py,*.go call s:neomake()
augroup END

function! s:neomake()
  Neomake
  call lightline#update()
endfunction


function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction


function! FoldContext()
    augroup pythonFold
        autocmd BufReadPre *.py setlocal foldmethod=indent
        autocmd BufReadPost *.py wincmd s | wincmd k | resize 3 | wincmd j
        autocmd CursorMovedI *.py call PinFold()
        autocmd CursorMoved *.py call PinFold()
    augroup END
endfunction


function! PinFold()
    let saveCursor =  getcurpos()
    " Go to upper split, open all folds and go to the same line as bottom split
    wincmd k
    normal! zR
    execute "normal! " . saveCursor[1] . "G"
    " Go to the beginning of the fold and put the line top of the upper split
    normal! [zk
    normal! zt
    " Go back to bottom split and restore position
    wincmd j
    call setpos('.', saveCursor)
endfunction

