local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local extras = require("luasnip.extras")
local rep = extras.rep
-- local fmt = require("luasnip.extras.fmt").fmt --> format node
local fmta = require("luasnip.extras.fmt").fmta --> format node

-- local conditions = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function env(name)
	-- local is_inside = vim.fn["vimtex#env#is_inside"](name)
	local is_inside = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function in_tikz()
	return env("tikzpicture")
end

local function start_of_tikz()
	return in_tikz() and conds_expand.line_begin
end

-- local autotikzline = ls.extend_decorator.apply(s, {
-- 	snippetType = "autosnippet",
-- 	condition = conds_expand.line_begin + in_tikz,
-- })

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
	autosnippet(
		{ trig = "no", name = "node" },
		fmta("\\node[n] (<>) at (<>) {<>};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = start_of_tikz }
	),
	autosnippet(
		{ trig = "nm", name = "math node" },
		fmta("\\node[n] (<>) at (<>) {$<>$};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = start_of_tikz }
	),
	autosnippet(
		{ trig = "dr", name = "draw arrow" },
		fmta("\\draw[s] (<>) to (<>);", { i(1), i(2) }),
		{ condition = start_of_tikz }
	),
}
