-- It's funny. This is set to 0 in set.lua just so markdown doesn't
-- conceal, but, like, now I want concealing?
-- vim.opt["conceallevel"] = 2

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.api.nvim_command("call pencil#init()")

vim.bo.formatexpr = nil
