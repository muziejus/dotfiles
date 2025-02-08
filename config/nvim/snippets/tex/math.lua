local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local fmta = require("luasnip.extras.fmt").fmta --> format node
local extras = require("luasnip.extras")
local rep = extras.rep
local conds_expand = require("luasnip.extras.conditions.expand")

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function not_in_math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 0
end

local function in_math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local math = ls.extend_decorator.apply(s, { condition = in_math })

local automath = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = in_math,
})

local autonotmath = ls.extend_decorator.apply(s, {
	snippetType = "autosnippet",
	condition = not_in_math,
})

return {
	autosnippet(
		{
			trig = "bali",
			name = "align*",
		},
		fmta(
			[[
      \begin{align*}
        <>
      \end{align*}
    ]],
			{ i(1) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

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
	automath({
		trig = "[^\\]exp",
		regTrig = true,
	}, {
		t("\\mathbb{E}\\left[\\, "),
		i(1, "X"),
		t(" \\,\\right]"),
	}),

	automath("prob", {
		t("\\mathbb{P}\\left[\\, "),
		i(1, "E"),
		t(" \\,\\right]"),
	}),

	automath(
		{ trig = "mc(%a)", regTrig = true },
		f(function(_, snip)
			return "\\mathcal{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "bb([%a%d])", regTrig = true },
		f(function(_, snip)
			return "\\mathbb{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "([%a%)%d%}])sr", regTrig = true, wordTrig = false },
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

	automath({ trig = "([%a%d%)])star", regTrig = true, wordTrig = false }, {
		f(function(_, snip)
			return snip.captures[1] .. "^{*}"
		end),
	}),

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
		{ trig = "([eijxyzmbEIJXYZMB])bar", regTrig = true },
		f(function(_, snip)
			return "\\bar{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "([eijxyzmbpf])hat", regTrig = true },
		f(function(_, snip)
			return "\\hat{" .. snip.captures[1] .. "}"
		end)
	),

	automath(
		{ trig = "thetahat", regTrig = true },
		f(function(_, snip)
			-- Doesn't need the leading backslash
			return "hat{\\theta}"
		end)
	),

	automath(
		{ trig = "sigmahat", regTrig = true },
		f(function(_, snip)
			-- Doesn't need the leading backslash
			return "hat{\\sigma}"
		end)
	),

	automath(
		"norm",
		fmta([[\lVert <> \rVert]], {
			i(1, "\\vec{x}_i - \\vec{x}_j"),
		})
	),

	automath(
		"//",
		fmta(
			[[\frac{ 
    <> 
    }{ 
    <> 
    }]],
			{
				i(1, "numerator"),
				i(2, "denominator"),
			}
		)
	),

	automath(
		{ trig = "([^%s$]+)/", regTrig = true },
		fmta([[\frac{ <> }{ <> }]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1, "denominator"),
		})
	),

	automath(
		{ trig = "([^%s$]+)pipe", regTrig = true },
		fmta("\\pipe{ <> }", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),

	automath(
		{ trig = "([^%s$]+)choose", regTrig = true },
		fmta("\\binom{ <> }{ <> }", {
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
		{ trig = "sum", dscr = "Sum i to n" },
		fmta([[\sum_{ <> }^{ <> }]], {
			i(1, "i = 1"),
			i(2, "n"),
		})
	),

	math(
		{ trig = "sumn", dscr = "Sum n to infinity" },
		fmta([[\sum_{ <> }^{ <> }]], {
			i(1, "n = 1"),
			i(2, "\\infty"),
		})
	),

	automath(
		"bayes",
		fmta(
			[[
          \frac{ \mathbb{P}\left[\, <> \,\mid\, <> \,\right] \cdot
      \mathbb{P}\left[\, <> \,\right] }{ \mathbb{P}\left[\, <> \,\right] }
      ]],
			{
				i(1, "X"),
				i(2, "Y"),
				rep(2),
				rep(1),
			}
		)
	),

	math(
		{ trig = "int", dscr = "Single integral" },
		fmta([[\int_{ <> }^{ <> } <> \diff <> ]], {
			i(1, "-\\infty"),
			i(2, "\\infty"),
			i(3, "f(x)"),
			i(4, "x"),
		})
	),

	math(
		{ trig = "intt", dscr = "Double integral (xy)" },
		fmta([[\int_{ <> }^{ <> }\int_{ <> }^{ <> } <> \diff <> \diff <>]], {
			i(1, "-\\infty"),
			i(2, "\\infty"),
			i(3, "-\\infty"),
			i(4, "\\infty"),
			i(5, "f(x,y)"),
			i(6, "x"),
			i(7, "y"),
		})
	),

	math(
		{ trig = "iint", dscr = "Double integral over area" },
		fmta([[\iint_{ <> } <> \diff <>  \diff <> ]], {
			i(1, "R"),
			i(2, "f(x,y)"),
			i(3, "x"),
			i(4, "y"),
		})
	),

	automath("tx", fmta("\\text{ <> }\\;", { i(1) })),

	automath("shint", fmta("\\shortintertext{ <> }", i(1))),

	automath("nxn", t("n \\times n")),

	-- Typos
	automath("codt", t("cdot")),

	-- Symbols
	automath("pvalue", t("p\\text{-value}\\,")),

	automath("normal", t("\\mathcal{N}")),

	automath("Peasy", t("\\mathcal{P}")),

	automath("NPhard", t("\\mathcal{N}\\mathcal{P}")),

	automath("|", t("\\,\\mid\\,")),

	automath(":=", t("\\coloneq")),

	-- automath("≤", t("\\le")),
	--
	-- automath("≥", t("\\ge")),

	automath("==", t("&=")),

	automath("!=", t("\\ne")),

	automath("===", t("\\equiv")),

	automath("!>", t("\\mapsto")),

	automath("=>", t("\\implies")),

	automath("<=", t("\\Leftarrow")),

	automath("->", t("\\rightarrow")),

	automath("x->", fmta("\\xrightarrow{ <> }", { i(1) })),

	automath("<-", t("\\leftarrow")),

	automath("\\gets", t("\\longleftarrow")),

	automath("theta", t("\\theta")),

	automath("sigma", t("\\sigma")),

	automath("lambda", t("\\lambda")),

	automath("epsilon", t("\\epsilon")),

	automath("beta", t("\\beta")),

	automath("mu", t("\\mu")),

	automath("alpha", t("\\alpha")),

	-- Not in math
	autonotmath("theta", t("$\\theta$")),
	autonotmath("lambda", t("$\\lambda$")),
	autonotmath("sigma", t("$\\sigma$")),
	autonotmath("Xbar", t("$\\bar{X}$")),
	autonotmath("Xn", t("$X_n$")),
}
