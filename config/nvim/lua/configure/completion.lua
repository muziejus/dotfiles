return {
  "hrsh7th/nvim-cmp", -- The completion plugin
  requires = {
    "nvim-lua/plenary.nvim", -- needed downstream
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-nvim-lua", -- for vim config files.
    "onsails/lspkind-nvim",
    -- compare: https://github.com/aspeddro/cmp-pandoc.nvim
    "aspeddro/cmp-pandoc.nvim",
    -- "jc-doyle/cmp-pandoc-references", -- pandoc completions
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets", -- snippet collection
    --"petertriho/cmp-git",
    --"davidsierradz/cmp-conventionalcommits",
    "uga-rosa/cmp-dictionary",
  },
  -- after = { 'nvim-autopairs' },
  config = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    cmp.setup({
      --      completion = {
      --        autocomplete = true,
      --      },
      snippet = {
        -- A snippet engine MUST be defined
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --         ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        --         ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        --         ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
      }),
      sources = cmp.config.sources({
        -- Order matters.
        { name = "nvim_lsp" },
        { name = "vsnip" },
        -- { name = "path" },
        -- { name = 'treesitter' },
        -- { name = 'spell' },
      }, {
        { name = "buffer" },
      }),
      --       confirm_opts = {
      --         behavior = cmp.ConfirmBehavior.Replace,
      --         select = false,
      --       },
      --       formatting = {
      --         format = require("lspkind").cmp_format({ with_text = true }),
      --       },
      --       experimental = {
      --         ghost_text = true,
      --         native_menu = false, -- See below
      --       },
    })

    require("cmp_pandoc").setup()

    require("cmp_dictionary").setup({
      dic = {
        ["*"] = { "/usr/share/dict/words" },
      },
    })

    -- print("got past pandoc and dictionary setup")

    cmp.setup.filetype("markdown", {
      sources = cmp.config.sources({
        { name = "cmp_pandoc" },
        { name = "dictionary", keyword_length = 2 },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype("lua", {
      sources = cmp.config.sources({
        { name = "vsnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      }),
    })

    cmp.setup.filetype({ "javscript", "typescript" }, {
      sources = cmp.config.sources({
        { name = "vsnip" },
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

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

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
