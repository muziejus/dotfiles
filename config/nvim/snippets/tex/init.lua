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
local make_condition = require("luasnip.extras.conditions").make_condition
local conds_expand = require("luasnip.extras.conditions.expand")

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local function env(name)
	-- local is_inside = vim.fn["vimtex#env#is_inside"](name)
	local is_inside = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function in_minted()
	return env("minted")
end

local function in_list()
	return env("enumerate") or env("itemize")
end

local function not_in_list()
	return not in_list()
end

local minted = make_condition(in_minted)
-- local list = make_condition(in_list)

return {
	-- Environments
	autosnippet(
		{
			trig = "bmini",
			name = "minipage",
		},
		fmta(
			[[
    \noindent\begin{minipage}{.5\textwidth}
      <>
    \end{minipage}
    ]],
			{ i(0) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),
	autosnippet(
		{
			trig = "mjava",
			name = "minted java environment",
		},
		fmta(
			[[
      \begin{minted}{java}
        <>
      \end{minted}
    ]],
			{ i(0) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	autosnippet(
		{
			trig = "beg",
			name = "environment",
		},
		fmta(
			[[
      \begin{<>}
        <>
      \end{<>}
    ]],
			{ i(1), i(2), rep(1) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	autosnippet(
		{
			trig = "tabu",
			name = "tabular",
		},
		fmta(
			[[
      \begin{table}[ht] % h in place, t top of page
        % Use tabularx for full width tables
        % \begin{tabularx}{\textwidth}{XXX}
        % "X" type stretches to fill the width.
        %
        % To do quirky stuff in a cell, surround it with \makecell{}
        %
        % rcl or p{1in} are the standard column types.
        \begin{longtable}{rrr} \toprule
          \thead{<>} & \thead{} & \thead{}\\
          \midrule
          <>\\
          \bottomrule
        \end{longtable}
      \end{table}
    ]],
			{ i(1, "Header 1"), i(2) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	-- Shortcuts

	-- Formatting
	autosnippet(
		{ trig = "1. ", name = "enumerate" },
		fmta(
			[[
    \begin{enumerate}
      \item <>
    \end{enumerate}]],
			{ i(0) }
		),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "a. ", name = "enumerate alpha" },
		fmta(
			[[
    \begin{enumerate}[label=\alph*)]
      \item <>
    \end{enumerate}]],
			{ i(0) }
		),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "i. ", name = "enumerate roman" },
		fmta(
			[[
    \begin{enumerate}[label=\roman*)]
      \item <>
    \end{enumerate}]],
			{ i(0) }
		),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "- ", name = "itemize" },
		fmta(
			[[
    \begin{itemize}
      \item <>
    \end{itemize}]],
			{ i(0) }
		),
		{ condition = conds_expand.line_begin - in_list }
	),

	-- autosnippet(
	-- 	{
	-- 		trig = "  - ",
	-- 		regTrig = true,
	-- 		name = "item",
	-- 	},
	-- 	t("\\item "),
	-- 	{
	-- 		-- }, {
	-- 		-- 	f(function()
	-- 		-- 		return "\\item "
	-- 		-- 	end),
	-- 		-- }, {
	-- 		condition = in_list and conds_expand.line_begin,
	-- 	}
	-- ),

	autosnippet({ trig = "- ", name = "item" }, t("\\item "), {
		condition = in_list and conds_expand.line_begin,
		-- condition = list and conds_expand.line_begin,
	}),

	autosnippet(
		{ trig = "# ", name = "chapter" },
		fmta("\\chapter*{<>}", { i(1) }),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "## ", name = "section" },
		fmta("\\section*{<>}", { i(1) }),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "### ", name = "subsection" },
		fmta("\\subsection*{<>}", { i(1) }),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = "#### ", name = "subsubsection" },
		fmta("\\subsubsection*{<>}", { i(1) }),
		{ condition = conds_expand.line_begin }
	),

	autosnippet(
		{ trig = '"', name = "smart quote" },
    { t("“"), i(1), t("”") }
	),

	autosnippet(
		{ trig = "todo", name = "TODO" },
		fmta("% TODO: <>", { i(1) }),
		{ condition = conds_expand.line_begin }
	),

	autosnippet({ trig = "tt", name = "type" }, fmta("\\texttt{<>}", { i(1) })),
	autosnippet({ trig = "__", name = "ital" }, fmta("\\textit{<>}", { i(1) })),
	autosnippet({ trig = "**", name = "bold" }, fmta("\\textbf{<>}", { i(1) }), { condition = -minted }),

	s({
		trig = "(%-?%d+%.?%d*)",
		regTrig = true,
		name = "num",
	}, {
		f(function(_, snip)
			return "\\num{" .. snip.captures[1] .. "}"
		end),
	}, {
		condition = function()
			return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 0
		end,
	}),

	-- This won't work because "$4" already puts you in mathzone.
	-- autosnippet({
	-- 	trig = "%$(%d+)",
	-- 	regTrig = true,
	-- 	name = "dollar",
	-- }, {
	-- 	f(function(_, snip)
	-- 		return "\\$\\num{" .. snip.captures[1] .. "}"
	-- 	end),
	-- }, {
	-- 	condition = function()
	-- 		local inmath = vim.api.nvim_eval("vimtex#syntax#in_mathzone()")
	-- 		return inmath == 0
	-- 	end,
	-- 	-- condition = function()
	-- 	-- 	if not inmath then
	-- 	-- 		return true
	-- 	-- 	end
	-- 	-- 	return false
	-- 	-- end,
	-- }),

	autosnippet({
		trig = "(%d+)%%",
		regTrig = true,
		name = "percent",
	}, {
		f(function(_, snip)
			return "\\num{" .. snip.captures[1] .. "}\\%"
		end),
	}),

	autosnippet({
		trig = "([%d%.]+)(%a+)",
		regTrig = true,
		name = "unit",
	}, {
		f(function(_, snip)
			return "\\qty{" .. snip.captures[1] .. "}{\\" .. snip.captures[2] .. "}"
		end),
	}, {
		condition = function(_, _, captures)
			local units = {
				"ns",
				"us",
				"ms",
				"b",
				"kb",
				"mb",
				"gb",
				"tb",
			}
			return has_value(units, captures[2])
		end,
	}),

	autosnippet({
		trig = "`([%a])",
		regTrig = true,
		name = "code",
	}, {
		f(function(_, snip)
			return "\\texttt{" .. snip.captures[1]
		end),
		i(1),
		t("}"),
	}),

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
