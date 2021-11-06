require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- disable :syntax on
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
