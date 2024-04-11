" SQL 設置
let g:sql_type_default = 'pgsql'
let g:db_ui_save_location = '~/.config/nvim/db_connections'

" 定義數據庫連接
let g:dbs = {
  \ 'local_postgres': 'postgres://localhost:5432/koopa',
  \ }

" 設置 PostgreSQL 的輔助查詢命令
let g:db_ui_table_helpers = {
  \ 'postgresql': {
    \ 'List': 'select * from "{table}" limit 100',
    \ 'Columns': 'select * from information_schema.columns where table_name = "{table}"',
    \ 'Count': 'select count(*) from "{table}"',
  \ }
\ }

" 設置快捷鍵
nnoremap <leader>du :DBUIToggle<CR>
nnoremap <leader>df :DBUIFindBuffer<CR>
nnoremap <leader>dr :DBUIRenameBuffer<CR>
nnoremap <leader>dl :DBUILastQueryInfo<CR>
