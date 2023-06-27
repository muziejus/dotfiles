-- https://github.com/gillescastel/latex-snippets/blob/master/tex.snippets

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
local conds_expand = require("luasnip.extras.conditions.expand")

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local function env(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

return {
	autosnippet({
		trig = "dm",
		name = "display math",
	}, {
		t({ "$$", "  " }),
		i(1),
		t({ "", "$$" }),
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

	-- Environments

	autosnippet(
		{
			trig = "beg",
			name = "environment",
			condition = conds_expand.line_begin,
		},
		fmta(
			[[
      \begin{<>}
         <>
      \end{<>}
    ]],
			{ i(1), i(2), rep(1) }
		)
	),

	-- local align = s("ali", {
	--   t({"\\begin{align*}", "  "}),
	--   i(1, "align"),
	--   t({"", "\\end{align*}"})
	-- })

	s({
		trig = "bmat",
		name = "simple bmatrix",
	}, {
		t({ "\\begin{bmatrix}", "  " }),
		i(1, "bmatrix"),
		t({ "", "\\end{bmatrix}" }),
	}, { condition = math }),

	-- Shortcuts

	autosnippet({
		trig = "([%a])sr",
		regTrig = true,
		name = "squared",
	}, {
		f(function(_, snip)
			return snip.captures[1] .. "^2"
		end),
	}, { condition = math }),

	autosnippet({ trig = "([%a])cb", regTrig = true, name = "cubed" }, {
		f(function(_, snip)
			return snip.captures[1] .. "^3"
		end),
	}, { condition = math }),

	autosnippet({ trig = "([%a])td", regTrig = true, name = "to da power" }, {
		f(function(_, snip)
			return snip.captures[1] .. "^{"
		end),
		i(1, "power"),
		t("}"),
	}, { condition = math }),

	autosnippet({ trig = "([%a}])(%d)", regTrig = true, name = "subscript" }, {
		f(function(_, snip)
			return snip.captures[1] .. "_" .. snip.captures[2]
		end),
	}, { condition = math }),

	autosnippet({ trig = "([%a])(%d%d)", regTrig = true, name = "subscript 2" }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end),
	}, { condition = math }),

	autosnippet({ trig = "([%a0])vec", regTrig = true, name = "vec(tor)" }, {
		f(function(_, snip)
			return "\\vec{" .. snip.captures[1] .. "}"
		end),
	}, { condition = math }),

	autosnippet({ trig = "([eijxyzmb])hat", regTrig = true, name = "hat" }, {
		f(function(_, snip)
			return "\\hat{" .. snip.captures[1] .. "}"
		end),
	}, { condition = math }),

	autosnippet(
		{
			trig = "//",
			name = "fraction //",
			condition = math,
		},
		fmta([[\frac{<>}{<>}]], {
			i(1, "numerator"),
			i(2, "denominator"),
		})
	),

	autosnippet(
		{
			trig = "([^%s]+)/",
			regTrig = true,
			name = "fraction/",
		},
		fmta("\\frac{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1, "denominator"),
		})
	),

	autosnippet({ trig = "frac", name = "frac(tion)" }, {
		t({ "\\frac{" }),
		i(1, "num"),
		t({ "}{" }),
		i(2, "den"),
		t({ "}" }),
	}, { condition = math }),

	autosnippet({
		trig = "([+,&])%.%.%.",
		regTrig = true,
		name = "ellipses",
	}, {
		f(function(_, snip)
			local ellipses = "\\dotsb"
			if snip.captures[1] == "," then
				ellipses = "\\dotsc"
			end
			return snip.captures[1] .. " " .. ellipses .. " " .. snip.captures[1] .. " "
		end),
	}, { condition = math }),

	s({ trig = "sum", name = "sum" }, {
		t({ "\\sum_{" }),
		i(1, "n"),
		t({ " = " }),
		i(2, "1"),
		t({ "}^{" }),
		i(3, "\\infty"),
		t({ "}" }),
	}, { condition = math, show_condition = math }),

	autosnippet({ trig = "shint", name = "short intertext" }, {
		t({ "\\shortintertext{" }),
		i(1, "intertext"),
		t({ "}", "" }),
	}, { condition = math }),

	-- Typos
	autosnippet("codt", t("cdot")),

	-- Formatting
	autosnippet({ trig = "__", name = "ital" }, fmta("\\textit{<>}", { i(1) })),
	autosnippet({ trig = "**", name = "bold" }, fmta("\\textbf{<>}", { i(1) })),
	autosnippet({ trig = "tx", name = "text" }, fmta("\\text{<>}\\;", { i(1) }), { condition = math }),

	-- Symbols
	autosnippet({ trig = "==", name = "align equal" }, {
		t({ "&=" }),
	}, { condition = math }),

	autosnippet({ trig = "!=", name = "not equal" }, {
		t({ "\\ne" }),
	}, { condition = math }),

	autosnippet({ trig = "===", name = "equivalent" }, {
		t({ "\\equiv" }),
	}, { condition = math }),

	autosnippet({ trig = "!>", name = "mapsto" }, {
		t({ "\\mapsto" }),
	}, { condition = math }),

	autosnippet({ trig = "=>", name = "implies" }, {
		t({ "\\implies" }),
	}, { condition = math }),

	-- template
	autosnippet(
		{
			trig = "doctemp",
			name = "basic template",
			dscr = "A basic template for LaTeX expecting variables that get passed into inputs",
			condition = conds_expand.line_begin,
		},
		fmta(
			[[
    \documentclass[letter,12pt,article,oneside]{memoir}

    \newcommand{\mytitle}{<>}
    \newcommand{\myauthorname}{<>}
    \newcommand{\myauthorid}{<>}
    % The inputs template is one of:
    % - document
    % - article
    % - letter
    % - math-lecture-notes
    % - math-homework
    \newcommand{\myinputstemplate}{<>}

    % Which file to input for basic settings.
    \input{}
    \begin{document}

    <>

    \end{document}
    ]],
			{
				i(1, "Title"),
				i(2, "Moacir P. de Sá Pereira"),
				i(3, "mpd2149"),
				c(4, {
					t("document"),
					t("article"),
					t("letter"),
					t("math-lecture-notes"),
					t("math-homework"),
				}),
				i(5),
			}
		)
	),
}
