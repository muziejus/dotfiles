local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node --> choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
-- local fmt = require("luasnip.extras.fmt").fmt --> format node
local fmta = require("luasnip.extras.fmt").fmta --> format node

-- local conditions = require("luasnip.extras.conditions")
local make_condition = require("luasnip.extras.conditions").make_condition
local conds_expand = require("luasnip.extras.conditions.expand")

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function env(name)
	-- local is_inside = vim.fn["vimtex#env#is_inside"](name)
	local is_inside = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function in_tikz()
	return env("tikzpicture")
end

local autotikz = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = in_tikz and conds_expand.line_begin,
})

return {
	autosnippet(
		{ trig = "btik", name = "tikzpicture" },
		fmta(
			[[
      \begin{tikzpicture}
        <>
      \end{tikzpicture}
    ]],
			{ i(1) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),
	autotikz(
		{ trig = "no", name = "node" },
		fmta("\\node[n] (<>) at (<>) {<>};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = conds_expand.line_begin }
	),
	autotikz(
		{ trig = "nm", name = "math node" },
		fmta("\\node[n] (<>) at (<>) {$<>$};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = conds_expand.line_begin }
	),
	autotikz(
		{ trig = "dr", name = "draw arrow" },
		fmta("\\draw[s] (<>) to (<>);", { i(1), i(2) }),
		{ condition = conds_expand.line_begin }
	),
}
