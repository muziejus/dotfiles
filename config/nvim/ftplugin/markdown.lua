-- It's funny. This is set to 0 in set.lua just so markdown doesn't
-- conceal, but, like, now I want concealing?
-- vim.opt["conceallevel"] = 2

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.bo.formatexpr = nil

vim.opt_local.textwidth = 0 -- no hard wrapping
vim.opt_local.formatoptions:remove("t")
vim.opt_local.wrap = true -- visual wrap is fine.
