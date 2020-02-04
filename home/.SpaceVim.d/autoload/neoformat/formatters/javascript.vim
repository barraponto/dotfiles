function! neoformat#formatters#javascript#npxprettier() abort
  return {
        \ 'exe': 'npx',
        \ 'args': ['--quiet', 'prettier', '--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1
        \ }
endfunction

function! neoformat#formatters#javascript#npxprettiereslint() abort
  return {
        \ 'exe': 'npx',
        \ 'args': ['--quiet', 'prettier-eslint', '--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1
        \ }
endfunction
