" nvim-lspconfig 配置

lua <<EOF
local nvim_lsp = require('lspconfig')

-- 定義通用的 LSP 設置
-- on_attach 函數定義了 LSP 客戶端連接到緩衝區時的通用設置,包括設置快捷鍵。
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- 設置快捷鍵
  -- gD: 跳轉到符號的聲明處 
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
  -- gd: 跳轉到符號的定義處
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  -- K: 顯示符號的相關信息
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
  -- gi: 跳轉到符號的實現處
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
  -- <C-k>: 顯示符號的簽名信息
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
  -- <leader>wa: 添加工作區文件夾
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {noremap = true, silent = true})
  -- <leader>wr: 移除工作區文件夾
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {noremap = true, silent = true})
  -- <leader>wl: 列出工作區文件夾
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {noremap = true, silent = true})
  -- <leader>D: 顯示符號的類型定義
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})
  -- <leader>rn: 重命名符號 
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
  -- <leader>ca: 顯示代碼操作
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
  -- gr: 查找符號的引用
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
  -- <leader>q: 將診斷信息添加到位置列表
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', {noremap = true, silent = true})
  -- <leader>f: 格式化文件
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
end

-- 定義通用的 LSP 客戶端能力
-- capabilities 變量定義了 LSP 客戶端的通用能力,如代碼片段支持。
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Go 語言 LSP 配置
nvim_lsp.gopls.setup {
    on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
				fieldalignment = true,
				nilness = true,
				useany = true,
				unreachable = true,
				nonewvars = true,
				undeclaredname = true,
				fillstruct = true,
			},
			hoverKind = "FullDocumentation",
			linkTarget = "pkg.go.dev",
			codelenses = {
				generate = true,
				gc_details = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			staticcheck = true,
			gofumpt = true,
			annotations = {
				bounds = true,
				escape = true,
				inline = true,
			},
			semanticTokens = true,
			expandWorkspaceToModule = false,
			experimentalPostfixCompletions = true,
			symbolMatcher = "fuzzy",
			symbolStyle = "full",
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}

-- Rust 語言 LSP 配置
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

-- Python 語言 LSP 配置
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  root_dir = nvim_lsp.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- Dart 語言 LSP 配置
nvim_lsp.dartls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"dart"},
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
}

-- HTML 語言 LSP 配置
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
}

nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"dockerfile"},
  init_options = {
    dockerfile = {
      languageserver = {
        completions = true,
        formatter = "prettier",
        linter = "hadolint",
      },
    },
  },
}

-- JSON 語言 LSP 配置
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"},
  init_options = {
    provideFormatter = true,
    schemas = {
      {
        fileMatch = {"package.json"},
        url = "https://json.schemastore.org/package.json",
      },
      {
        fileMatch = {"tsconfig*.json"},
        url = "https://json.schemastore.org/tsconfig.json",
      },
      {
        fileMatch = {
          ".prettierrc",
          ".prettierrc.json",
          "prettier.config.json",
        },
        url = "https://json.schemastore.org/prettierrc.json",
      },
      {
        fileMatch = {".eslintrc", ".eslintrc.json"},
        url = "https://json.schemastore.org/eslintrc.json",
      },
      {
        fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
        url = "https://json.schemastore.org/babelrc.json",
      },
      {
        fileMatch = {"lerna.json"},
        url = "https://json.schemastore.org/lerna.json",
      },
      {
        fileMatch = {
          ".stylelintrc",
          ".stylelintrc.json",
          "stylelint.config.json",
        },
        url = "http://json.schemastore.org/stylelintrc.json",
      },
      {
        fileMatch = {"composer.json"},
        url = "https://json.schemastore.org/composer.json",
      },
    },
  },
}

-- YAML 語言 LSP 配置
nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml", "yaml.docker-compose"},
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = "*.yaml",
      },
    },
  },
}
EOF

" 格式化設置
" 為各種文件類型設置了自動格式化,在保存文件時觸發。
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.dockerfile lua vim.lsp.buf.formatting_sync(nil, 1000)

" 其他設置
autocmd BufWritePre *.go lua vim.lsp.buf.code_action({ source = { organizeImports = true } })
autocmd BufWritePre *.rs lua vim.lsp.buf.code_action({ source = { organizeImports = true } })
