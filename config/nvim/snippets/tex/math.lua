local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local fmta = require("luasnip.extras.fmt").fmta --> format node

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function in_math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local math = ls.extend_decorator.apply(s, { condition = in_math })

local automath = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = in_math,
})

return {
	autosnippet({
		trig = "dm",
		name = "display math",
	}, {
		t({ "\\[", "  " }),
		i(1),
		t({ "", "\\]" }),
	}),

	autosnippet({
		trig = "ilm",
		name = "inline math",
		regTrig = true,
	}, {
		t({ "$" }),
		i(1, "math"),
		t({ "$" }),
	}),

	automath("bmat", {
		t({ "\\begin{bmatrix}", "  " }),
		i(1, "bmatrix"),
		t({ "", "\\end{bmatrix}" }),
	}),

	-- shortcuts
	automath("exp", {
		t("\\mathbb{E}["),
		i(1, "X"),
		t("]"),
	}),

	automath("prob", {
		t("\\mathbb{P}("),
		i(1, "E"),
		t(")"),
	}),

	automath(
		{ trig = "([%a%)])sr", regTrig = true, wordTrig = false },
		f(function(_, snip)
			return snip.captures[1] .. "^2"
		end)
	),

	automath(
		{ trig = "([%a%)])cb", regTrig = true, wordTrig = false },
		f(function(_, snip)
			return snip.captures[1] .. "^3"
		end)
	),

	automath({ trig = "([%a%d%)])td", regTrig = true, wordTrig = false }, {
		f(function(_, snip)
			return snip.captures[1] .. "^{"
		end),
		i(1, "power"),
		t("}"),
	}),

	automath( -- subscript digit
		{ trig = "([%a%)])(%d)", regTrig = true, wordTrig = false },
		f(function(_, snip)
			return snip.captures[1] .. "_" .. snip.captures[2]
		end)
	),

	automath( -- full subscript
		{ trig = "([%a])(%d%d)", regTrig = true },
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end)
	),

	automath(
		{ trig = "([%a0])vec", regTrig = true },
		f(function(_, snip)
			return "\\vec{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "([eijxyzmb])bar", regTrig = true },
		f(function(_, snip)
			return "\\bar{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "([eijxyzmb])hat", regTrig = true },
		f(function(_, snip)
			return "\\hat{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		"//",
		fmta([[\frac{<>}{<>}]], {
			i(1, "numerator"),
			i(2, "denominator"),
		})
	),

	automath(
		{ trig = "([^%s$]+)/", regTrig = true },
		fmta("\\frac{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1, "denominator"),
		})
	),

	automath(
		{ trig = "([^%s$]+)choose", regTrig = true },
		fmta("\\binom{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1, "denominator"),
		})
	),

	automath(
		{ trig = "([+,&])%.%.%.", regTrig = true },
		f(function(_, snip)
			local ellipses = "\\dotsb"
			if snip.captures[1] == "," then
				ellipses = "\\dotsc"
			end
			return snip.captures[1] .. " " .. ellipses .. " " .. snip.captures[1] .. " "
		end)
	),

	math(
		"sum",
		fmta([[\sum_{<>}^{<>}]], {
			i(1, "n = 1"),
			i(2, "\\infty"),
		})
	),

	automath("tx", fmta("\\text{<>}\\;", { i(1) })),

	automath("shint", fmta("\\shortintertext{<>}", i(1))),

	automath("nxn", t("n \\times n")),

	-- Typos
	automath("codt", t("cdot")),

	-- Symbols
	automath("≤", t("\\le")),

	automath("≥", t("\\ge")),

	automath("==", t("&=")),

	automath("!=", t("\\ne")),

	automath("===", t("\\equiv")),

	automath("!>", t("\\mapsto")),

	automath("=>", t("\\implies")),

	automath("->", t("\\rightarrow")),

	automath("<-", t("\\leftarrow")),

	automath("\\gets", t("\\longleftarrow")),
}
