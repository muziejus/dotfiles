-- It's funny. This is set to 0 in set.lua just so markdown doesn't
-- conceal, but, like, now I want concealing?
vim.opt["conceallevel"] = 2

vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- function OneSentencePerLine()
--   local mode = vim.api.nvim_get_mode()["mode"]
--   if string.match(mode, "[iR]") then
--     return
--   end
--   local start = vim.api.nvim_win_get_cursor(0)[1]
--   local grafStart = vim.v.lnum
--   local grafEnd = vim.v.count - 1
--
--   local lines = vim.iter()
--   lines:join("{}")
--
-- end
-- vim.opt.formatexpr = OneSentencePerLine() --
-- require("../lua/one-sentence-per-line")

vim.api.nvim_command("call pencil#init()")

vim.cmd([[
    function! OneSentencePerLine()
    if mode() =~# '^[iR]'
      return
    endif
    let start = v:lnum
    let end = start + v:count - 1
    execute start.','.end.'join'
    " s/[.!?]['’”].\zs\s*\ze\S/\r/g
    s/\([.,!?][”’'"]*\)\s\+/\1\r/g
    " let start = v:lnum
    " let end = start + v:count - 1
    " execute start.','.end.'join'
    " s/^\([a-z]\{1}\)/  \1/g
    endfunction
    set formatexpr=OneSentencePerLine()
  ]])
