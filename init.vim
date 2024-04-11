" init.vim
let mapleader = " "


" 使用 <leader>w[hjkl] 切換視窗
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" 插件管理
source ~/.config/nvim/plugins.vim

" 通用配置
source ~/.config/nvim/configs.vim

" LSP 配置
source ~/.config/nvim/lsp.vim

" SQL 配置
source ~/.config/nvim/sql.vim

" Gopher 配置
source ~/.config/nvim/gopher.vim

" Copilot 配置
source ~/.config/nvim/copilot.vim

" 主題配置
source ~/.config/nvim/ui.vim

" 其他配置
set number
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

