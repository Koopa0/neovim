" nvim-treesitter 配置
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "yaml",
    "go",
    "dart",
    "rust",
    "sql",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF


" nvim-tree 配置
lua <<EOF
require'nvim-tree'.setup {
  view = {
    side = 'left',
    width = 30,
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache' },
  },
  git = {
    enable = true,
    ignore = true,
  },
}
EOF

" 設置 nvim-tree 的快捷鍵
nnoremap <leader>e :NvimTreeToggle<CR>

 let g:transparent_enabled = v:true
 let g:transparent_groups = [ 'Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                          \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                          \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                          \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer' ]

" toggleterm.nvim 配置
lua <<EOF
require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
}
EOF

" 設置 toggleterm 的快捷鍵
nnoremap <leader>t :ToggleTerm<CR>


" 外觀配置
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
let g:lightline = {'colorscheme': 'catppuccin'}
let g:catppuccin_transparent_background = 1
let g:catppuccin_term_colors = 1
let g:catppuccin_styles = {
    \ "comments": { "italic": 1 },
    \ "conditionals": { "italic": 1 }
    \ }
let g:catppuccin_integrations = {
    \ 'cmp': 1,
    \ 'gitsigns': 1,
    \ 'nvimtree': 1,
    \ 'treesitter': 1,
    \ 'notify': 0,
    \ 'mini': {
    \   'enabled': 1,
    \   'indentscope_color': ''
    \ },
    \}
