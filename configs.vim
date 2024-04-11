" completion-nvim 配置
let g:completion_enable_auto_popup = 1
let g:completion_trigger_keyword_length = 2
let g:completion_chain_complete_list = {
  \ 'default': [
  \   {'complete_items': ['lsp', 'snippet']},
  \   {'mode': '<c-p>'},
  \   {'mode': '<c-n>'}
  \ ]
  \}

" telescope.nvim 配置
" 設置 Telescope 快捷鍵
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" delve 配置
let g:delve_backend = "native"
nnoremap <leader>dd <cmd>DlvToggleBreakpoint<cr>
nnoremap <leader>dr <cmd>DlvDebug<cr>

