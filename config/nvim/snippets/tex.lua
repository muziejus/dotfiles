local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local f = ls.function_node

local tex = {}
tex.in_mathzone = function ()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex.in_text = function ()
  return not tex.in_mathzone()
end

local snippets, autosnippets = {}, {}

local displayMath = s("dm", {
  t({ "$$", "  " }),
  i(1),
  t({ "", "$$" }),
}, { condition = tex.in_text })
table.insert(autosnippets, displayMath)

local inlineMath = s({ trig = "ilm", regTrig = true }, 
{
  t({"$"}),
  i(1, "math"),
  t({"$"}),
})
table.insert(autosnippets, inlineMath)

-- Environments
local align = s("ali", {
  t({"\\begin{align*}", "  "}),
  i(1, "align"),
  t({"", "\\end{align*}"})
})
table.insert(autosnippets, align)

local bmatrix = s("bmat", {
  t({"\\begin{bmatrix}", "  "}),
  i(1, "bmatrix"),
  t({"", "\\end{bmatrix}"})
})
table.insert(autosnippets, bmatrix)

-- local columnVector = s("colvec", {
--   t({"\\begin{bmatrix} "}),
--   i(1, "x"),
--   t({"_"}),
--   i(2, "1"),
--   t({" \\\\ \\vdots \\\\ "}),
--   i(3, "x"),
--   t({"_"}),
--   i(4, "n"),
--   t({" \\end{bmatrix}"})
-- })
-- table.insert(autosnippets, columnVector)

-- local rowVector = s("rowvec", {
--   t({"\\begin{bmatrix} "}),
--   i(1, "x"),
--   t({"_"}),
--   i(2, "1"),
--   t({" & \\ldots & "}),
--   i(3, "x"),
--   t({"_"}),
--   i(4, "n"),
--   t({" \\end{bmatrix}"})
-- })
-- table.insert(autosnippets, rowVector)

-- Shortcuts

local squared = s({trig="([%a])sr", regTrig = true}, {
  f(function (_, snip)
    return snip.captures[1] .. "^2"
  end)
})
table.insert(autosnippets, squared)

local cubed = s({trig="([%a])cb", regTrig = true}, {
  f(function (_, snip)
    return snip.captures[1] .. "^3"
  end)
})
table.insert(autosnippets, cubed)

local power = s({trig="([%a])td", regTrig = true}, {
  f(function (_, snip)
    return snip.captures[1] .. "^{"
  end),
  i(1, "power"),
  t("}")
})
table.insert(autosnippets, power)

local subscript = s({trig = "([%a])(%d)", regTrig = true }, {
  f(function (_, snip)
    return snip.captures[1] .. "_" .. snip.captures[2]
  end
  )
})
table.insert(autosnippets, subscript)

local subscript2 = s({trig = "([%a])(%d%d)", regTrig = true }, {
  f(function (_, snip)
    return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
  end
  )
})
table.insert(autosnippets, subscript2)

local vector = s({ trig = "([%a0])vec", regTrig = true },
{
  f(function (_, snip)
    return "\\vec{" .. snip.captures[1] .. "}"
    end
  )
})
table.insert(autosnippets, vector)

local hat = s({ trig = "([beijxyz])hat", regTrig = true },
{
  f(function (_, snip)
    return "\\hat{" .. snip.captures[1] .. "}"
    end
  )
})
table.insert(autosnippets, hat)

local fraction = s("frac", {
  t({"\\frac{"}),
  i(1, "num"),
  t({"}{"}),
  i(2, "den"),
  t({"}"})
})
table.insert(snippets, fraction)

local sum = s("sum", {
  t({"\\sum_{"}),
  i(1, "n"),
  t({" = "}),
  i(2, "1"),
  t({"}^{"}),
  i(3, "\\infty"),
  t({"}"})
})
table.insert(snippets, sum)

local linearOperator = s("linearOperator", {
  t("\\mathscr{L}")
})
table.insert(autosnippets, linearOperator)

local shortintertext = s("shint", {
  t({"\\shortintertext{"}),
  i(1, "intertext"),
  t({"}", ""})
})
table.insert(autosnippets, shortintertext)

-- Symbols
local alignEqual = s("==", {
  t({"&="})
})
table.insert(snippets, alignEqual)

local equivalent = s("===", {
  t({"\\equiv"})
})
table.insert(snippets, equivalent)

local mapsto = s("!>", {
  t({"\\mapsto"})
})
table.insert(autosnippets, mapsto)

local implies = s("=>", {
  t({"\\implies"})
})
table.insert(autosnippets, implies)

local leftrightarrow = s("<->", {
  t({"\\leftrightarrow"})
})
table.insert(autosnippets, leftrightarrow)

local commadots = s(",...,", {
  t({", \\dotsc ,"})
})
table.insert(autosnippets, commadots)

local plusdots = s("+...+", {
  t({"+ \\dotsb +"})
})
table.insert(autosnippets, plusdots)

local vectordots = s("&...&", {
  t({"& \\dotsb &"})
})
table.insert(autosnippets, vectordots)
-- local Rn = s({ trig = "R([%dnm])", regTrig = true },
-- {
--   f(function (_, snip)
--     return "\\R^" .. snip.captures[1] .. " "
--     end
--   )
-- })
-- table.insert(autosnippets, Rn)

return snippets, autosnippets
