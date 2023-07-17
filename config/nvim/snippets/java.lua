-- https://github.com/gillescastel/latex-snippets/blob/master/tex.snippets

local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node --> choice_node
local sn = ls.sn --> snippet node
local extras = require("luasnip.extras")
local rep = extras.rep
-- local fmt = require("luasnip.extras.fmt").fmt --> format node
local fmta = require("luasnip.extras.fmt").fmta --> format node

-- local conditions = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local f = ls.function_node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
	autosnippet(
		"main",
		fmta(
			[[
  public static void main(String[] args) {
    <>
  }]],
			{ i(1) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	autosnippet(
		"pclass",
		fmta(
			[[
      public class <> {
        <>
      }
      ]],
			{
				i(1, "ClassName"),
				-- c(2, {
				-- 	t(""),
				-- 	sn(nil, {
				-- 		t("implements "),
				-- 		i(1),
				-- 	}),
				-- 	sn(nil, {
				-- 		t("extends "),
				-- 		i(1),
				-- 	}),
				-- }),
				i(2),
			}
		),
		{
			condition = conds_expand.line_begin,
		}
	),

	autosnippet("println", {
		t("System.out.println("),
		i(1),
		t(");"),
	}, {
		condition = conds_expand.line_begin,
	}),

	autosnippet("iList", {
		t({ "import java.util.List;", "" }),
	}, {
		condition = conds_expand.line_begin,
	}),
}
