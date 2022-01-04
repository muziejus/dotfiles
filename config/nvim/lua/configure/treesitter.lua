return {
  'nvim-treesitter/nvim-treesitter',
  requires = { 'p00f/nvim-ts-rainbow' },
  run = ':TSUpdate',
  config = function()
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    parser_configs.norg = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
      },
    }

    parser_configs.norg_meta = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    parser_configs.norg_table = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
      },
    }

    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- disable :syntax on
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        }
      },
      ensure_installed = {
        -- "norg", "norg_meta", "norg_table",
        "bibtex", "latex", "graphql",
        "javascript", "typescript", "glimmer",
        "tsx", "html", "jsdoc", "regex", "html",
        "yaml", "jsonc", "css", "lua"
      },
      ignore_install = {
        "json" -- jsonc is better
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
        colors = {
          "#bf616a",
          "#d08770",
          "#ebcb8b",
          "#a3be8c",
          "#88c0d0",
          "#5e81ac",
          "#b48ead",
        },
      }
    }
  end
}
