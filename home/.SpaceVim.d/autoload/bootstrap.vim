function! bootstrap#after() abort
  let g:neomake_javascript_eslint_maker =  {
        \ 'exe': 'npx',
        \ 'args': ['--quiet', 'eslint', '--format=compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
        \ 'cwd': '%:p:h',
        \ 'output_stream': 'stdout',
        \ }
  let g:neomake_javascript_jsx_enabled_makers = ['eslint']
  "let g:neoformat_enabled_javascript = ['npxprettier']
  let g:neoformat_enabled_javascript = ['npxprettiereslint']

  let g:neomake_php_enabled_makers = ['phpcs']
  "let g:neomake_php_phpcs_args_standard = 'Drupal,DrupalPractice'
  "let g:neoformat_enabled_php = ['drupalphpcbf']

  let g:neomake_php_phpcs_args_standard = 'Wordpress'
  let g:neoformat_enabled_php = ['wordpressphpcbf']

  augroup fmt
    autocmd!
    autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END
endfunction
