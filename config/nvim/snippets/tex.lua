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
  t({ "\\[", "  " }),
  i(1),
  t({ "", "\\]" }),
}, { condition = tex.in_text })
table.insert(autosnippets, displayMath)

local inlineMath = s({ trig = "%smm", regTrig = true }, 
{
  t({" $ "}),
  i(1, "math"),
  t({" $"}),
})
table.insert(autosnippets, inlineMath)

local vector = s({ trig = "([%a0])vec", regTrig = true },
{
  f(function (_, snip)
    return "\\vec{" .. snip.captures[1] .. "}"
    end
  )
})
table.insert(autosnippets, vector)

local hat = s({ trig = "([xyz])hat", regTrig = true },
{
  f(function (_, snip)
    return "\\hat{" .. snip.captures[1] .. "} "
    end
  )
})
table.insert(autosnippets, hat)

local sum = s("sum", {
  t({"\\sum_{"}),
  i({1, "n"}),
  t({" = "}),
  i({2, "1"}),
  t({"}^{"}),
  i({3, "\\infty"}),
  t({"}"})
})
table.insert(snippets, sum)

local linearOperator = s("linearOperator", {
  t("\\mathscr{L}")
})
table.insert(autosnippets, linearOperator)


return snippets, autosnippets
