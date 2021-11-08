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
