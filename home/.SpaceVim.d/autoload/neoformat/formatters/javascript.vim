function! neoformat#formatters#javascript#npxprettier() abort
  return {
        \ 'exe': 'npx',
        \ 'args': ['--quiet', 'prettier', '--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1
        \ }
endfunction
