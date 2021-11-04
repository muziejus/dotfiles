local map = vim.api.nvim_set_keymap

-- map the leader key but first knock out space
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- would go in settings.lua but for the above
                      -- untested, though


