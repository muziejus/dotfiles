return {
  "hrsh7th/nvim-cmp", -- The completion plugin
  requires = {
    "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-nvim-lua", -- for vim config files.
    "onsails/lspkind-nvim",
    -- compare: https://github.com/aspeddro/cmp-pandoc.nvim
    "aspeddro/cmp-pandoc.nvim",
    -- "jc-doyle/cmp-pandoc-references", -- pandoc completions
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "rafamadriz/friendly-snippets", -- snippet collection
    "petertriho/cmp-git",
    "davidsierradz/cmp-conventionalcommits",
    "uga-rosa/cmp-dictionary",
  },
  -- after = { 'nvim-autopairs' },
  config = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
      return
    end

    require("luasnip/loaders/from_vscode").lazy_load() -- ?

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    cmp.setup({
      enabled = true,
      completion = {
        autocomplete = false,
      },
      snippet = {
        -- A snippet engine MUST be defined
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif lusasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
      },
      sources = cmp.config.sources({
        -- Order matters.
        { name = "luasnip" },
        { name = "nvim_lsp" },
        -- { name = "buffer" },
        -- { name = "path" },
        -- { name = 'treesitter' },
        -- { name = "pandoc_references" },
        -- { name = 'spell' },
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      formatting = {
        format = require("lspkind").cmp_format({ with_text = true }),
      },
      experimental = {
        ghost_text = true,
        native_menu = false, -- See below
      },
    })

    require("cmp_pandoc").setup()

    require("cmp_dictionary").setup({
      dic = {
        ["*"] = { "/usr/share/dict/words" },
      },
    })

    cmp.setup.filetype("markdown", {
      sources = cmp.config.sources({
        { name = "cmp_pandoc" },
        { name = "dictionary", keyword_length = 2 },
      }),
    })

    cmp.setup.filetype("lua", {
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      }),
    })

    cmp.setup.filetype({ "javscript", "typescript" }, {
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }),
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" },
        { name = "conventionalcommits" },
        --   }, {
        --     { name = "buffer" },
      }),
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline("/", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = "buffer" },
    --   },
    -- })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
