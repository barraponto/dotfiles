function! neoformat#formatters#php#drupalphpcbf() abort
  return {
        \ 'exe': 'phpcbf',
        \ 'args': ['--standard=Drupal,DrupalPractice'],
        \ 'stdin': 1,
        \ 'valid_exit_codes': [0, 1]
        \ }
endfunction

function! neoformat#formatters#php#wordpressphpcbf() abort
  return {
        \ 'exe': 'phpcbf',
        \ 'args': ['--standard=Wordpress'],
        \ 'stdin': 1,
        \ 'valid_exit_codes': [0, 1]
        \ }
endfunction
