lua <<EOF
require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "<C-p>",
      jump_next = "<C-n>",
      accept = "<CR>",
      refresh = "<C-r>",
      open = "<C-o>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 150,
    keymap = {
      accept = "<Tab>",
      accept_word = "<C-w>",
      accept_line = "<C-l>",
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-e>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node",
  server_opts_overrides = {},
})
EOF
