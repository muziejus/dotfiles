require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
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
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1500
  }
}
