local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  --[[
    cmd = { "typescript-language-server", "--stdio" }
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    init_options = {
      hostInfo = "neovim"
    }
    root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  --]]
}
nvim_lsp.ember.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  --[[
    cmd = { "ember-language-server", "--stdio" }
    filetypes = { "handlebars", "typescript", "javascript" }
    root_dir = root_pattern("ember-cli-build.js", ".git")
  --]]
}
nvim_lsp.graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  --[[
    cmd = { "graphql-lsp", "server", "-m", "stream" }
    filetypes = { "graphql" }
    root_dir = root_pattern('.git', '.graphqlrc*', '.graphql.config.*')
  --]]
}
nvim_lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  --[[
    cmd = { "vscode-html-language-server", "--stdio" }
    filetypes = { "html" }
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    }
    root_dir = function(fname)
          return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
        end,
    settings = {}
  --]]
}
nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  --[[
    cmd = { "tailwindcss-language-server", "--stdio" }
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" }
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb"
      }
    }
    on_new_config = function(new_config)
          if not new_config.settings then
            new_config.settings = {}
          end
          if not new_config.settings.editor then
            new_config.settings.editor = {}
          end
          if not new_config.settings.editor.tabSize then
            -- set tab size for hover
            new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
          end
        end,
    root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git')
    settings = {
      tailwindCSS = {
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
        validate = true
      }
    }
  --]]
}
