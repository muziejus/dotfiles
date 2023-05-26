local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

ls.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  -- ext_opts = {
  --   [require("luasnip.util.types").choiceNode] = {
  --     active = {
  --       virt_text = { {"•", "GruvboxOrange" } },
  --     },
  --   },
  -- },
})
