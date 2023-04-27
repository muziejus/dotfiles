require("zen-mode").setup {
  window = {
    width = 100,
    height = 1,
    options = {
      signcolumn = "yes",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
  plugins = {
    twilight = { enabled = true },
    gitsigns = { enabled = true },
    kitty = {
      enabled = false,
      font = "+4",
    }
  }
}

require("twilight").setup {
  dimming = {
    alpha = 0.25,
    color = { "Normal", "#ffffff" },
    inactive = false,
  },
  context = 10,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- filetypes
}

