" gopher.nvim 配置
lua <<EOF
require("gopher").setup({
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command pathimpl
    impl = "impl",
    iferr = "iferr",
  },
})
EOF

" nvim-dap-go 配置
lua <<EOF
require("dap-go").setup()
EOF
