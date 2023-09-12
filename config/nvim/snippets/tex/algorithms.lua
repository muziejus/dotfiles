local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local fmta = require("luasnip.extras.fmt").fmta --> format node

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local make_condition = require("luasnip.extras.conditions").make_condition
local conds_expand = require("luasnip.extras.conditions.expand")

local function env(name)
	-- local is_inside = vim.fn["vimtex#env#is_inside"](name)
	local is_inside = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function in_algorithm()
	return env("algorithm")
end

local algorithm = make_condition(in_algorithm)

local algo = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = algorithm,
})

local beginalgo = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = algorithm + conds_expand.line_begin,
})

return {
	autosnippet(
		{
			trig = "balg",
			name = "algorithm environment",
		},
		fmta(
			[[
      \begin{algorithm}[H]
      \DontPrintSemicolon
      \caption{<>}
        <>
      \end{algorithm}
      ]],
			{ i(1, "caption"), i(2) }
		),
		{ condition = conds_expand.line_begin - algorithm }
	),
	beginalgo("Var", fmta("\\SetKwData{<>}{<>}", { i(1, "Key"), i(2, "text") })),
	beginalgo("Func", fmta("\\SetKwFunction{<>}{<>}", { i(1, "Key"), i(2, "text") })),
	beginalgo("Data", fmta("\\KwData{<>}", { i(1, "data") })),
	beginalgo("Result", fmta("\\KwResult{<>}", { i(1, "result") })),
	beginalgo(
		"For",
		fmta(
			[[
      \For{<>}{
        <>
      }
      ]],
			{ i(1, "condition"), i(2) }
		)
	),
	beginalgo(
		"If",
		fmta(
			[[
      \If{<>}{
        <>
      }
      ]],
			{ i(1, "condition"), i(2) }
		)
	),
	beginalgo(
		"Ife",
		fmta(
			[[
      \eIf{<>}{
        <>
      }{
        <>
      }
      ]],
			{ i(1, "condition"), i(2, "then"), i(3, "else") }
		)
	),
	beginalgo(
		"While",
		fmta(
			[[
      \While{<>}{
        <>
      }
      ]],
			{ i(1, "condition"), i(2) }
		)
	),
	algo("To", t("\\KwTo")),
}
