return {
  'nvim-treesitter/nvim-treesitter',
  requires = { 'p00f/nvim-ts-rainbow' },
  run = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- disable :syntax on
      },
      indent = { enable = true, disable = { "yaml" } },
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
        "bibtex", "latex", "graphql",
        "javascript", "typescript", "glimmer",
        "tsx", "html", "jsdoc", "regex", "html",
        "yaml", "jsonc", "css", "lua"
      },
      ignore_install = {
        "json" -- jsonc is better
      },
      autopairs = {
        enable = true,
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
