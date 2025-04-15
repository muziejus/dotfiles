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

return {
	autosnippet({
		trig = "ilm",
		name = "inline math",
		regTrig = true,
	}, {
		t({ "$" }),
		i(1, "math"),
		t({ "$" }),
	}),
	autosnippet(
		{
			trig = "bga",
			name = "gather*",
		},
		fmta(
			[[
      \begin{gather*}
        <>
      \end{gather*}
    ]],
			{ i(0) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),
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
			{ i(0) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	autosnippet(
		{ trig = "mcc(%a)", regTrig = true },
		f(function(_, snip)
			return "\\mathcal{" .. snip.captures[1] .. "}"
		end)
	),

	autosnippet(
		{ trig = "mbb([%a%d])", regTrig = true },
		f(function(_, snip)
			return "\\mathbb{" .. snip.captures[1] .. "}"
		end)
	),

	autosnippet(
		{ trig = "([%a%)%d%}])sr", regTrig = true, wordTrig = false },
		f(function(_, snip)
			return snip.captures[1] .. "^2"
		end)
	),

	autosnippet(
		{ trig = "([%a0])vec", regTrig = true },
		f(function(_, snip)
			return "\\bm{" .. snip.captures[1] .. "}"
		end)
	),

	autosnippet("Xn", t("X_n")),
	autosnippet("Xi", t("X_i")),
	autosnippet("xn", t("x_n")),
	autosnippet("xi", t("x_i")),

	autosnippet(";a", t("\\alpha")),
	autosnippet(";b", t("\\beta")),
	autosnippet(";g", t("\\gamma")),
	autosnippet(";d", t("\\delta")),
	autosnippet(";ep", t("\\epsilon")),
	autosnippet(";z", t("\\zeta")),
	autosnippet(";et", t("\\eta")),
	autosnippet(";h", t("\\theta")),
	autosnippet(";i", t("\\iota")),
	autosnippet(";k", t("\\kappa")),
	autosnippet(";l", t("\\lambda")),
	autosnippet(";m", t("\\mu")),
	autosnippet(";n", t("\\nu")),
	autosnippet(";pi", t("\\pi")),
	autosnippet(";r", t("\\rho")),
	autosnippet(";s", t("\\sigma")),
	autosnippet(";t", t("\\tau")),
	autosnippet(";ph", t("\\phi")),
	autosnippet(";ch", t("\\chi")),
	autosnippet(";x", t("\\chi")),
	autosnippet(";ps", t("\\psi")),
	autosnippet(";o", t("\\omega")),

	autosnippet(";G", t("\\Gamma")),
	autosnippet(";D", t("\\Delta")),
	autosnippet(";H", t("\\Theta")),
	autosnippet(";L", t("\\Lambda")),
	autosnippet(";Pi", t("\\Pi")),
	autosnippet(";S", t("\\Sigma")),
	autosnippet(";Ph", t("\\Phi")),
	autosnippet(";Ps", t("\\Psi")),
	autosnippet(";O", t("\\Omega")),

  autosnippet("Sigmavec", t("bm{\\Sigma}")),
  autosnippet("sigmavec", t("bm{\\sigma}")),
  autosnippet("thetavec", t("bm{\\theta}")),
  autosnippet("betavec", t("bm{\\beta}")),
  autosnippet("muvec", t("bm{\\mu}")),
}

