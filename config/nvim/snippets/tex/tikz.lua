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
      \begin{center}
        \begin{tikzpicture}
          <>
        \end{tikzpicture}
      \end{center}
    ]],
			{ i(1) }
		),
		{
			condition = conds_expand.line_begin,
		}
	),
	autosnippet(
		{ trig = "nd", name = "node" },
		fmta("\\node[n] (<>) at (<>) {<>};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = start_of_tikz }
	),
	autosnippet(
		{ trig = "nm", name = "math node" },
		fmta("\\node[n] (<>) at (<>) {$<>$};", { i(1), i(2, "0, 0"), rep(1) }),
		{ condition = start_of_tikz }
	),
	autosnippet(
		{ trig = "dw", name = "draw arrow" },
		fmta("\\draw[s] (<>) to (<>);", { i(1), i(2) }),
		{ condition = start_of_tikz }
	),
	autosnippet(
		{ trig = "matrix", name = "matrix" },
		fmta(
			[[
        % Put node commands like |(a) [fill=lightgray]| right after ampersand.
        % To do quirky stuff in a node (linebreak) wrap the content in {}.
        \matrix (m) [
              matrix of math nodes,
              row sep=-\pgflinewidth,
              column sep=-\pgflinewidth,
              %nodes in empty cells,
              nodes={anchor=center, 
                draw,
                %fill=lightgray,
                minimum size=1.5em, 
              },
              ] {
              <>
        };
      ]],
			{ i(1) }
		),
		{ condition = start_of_tikz }
	),

	autosnippet(
		{ trig = "plot", name = "Plot" },
		fmta(
			[[
      % https://tikz.dev/pgfplots/reference-axis
      \begin{axis}[
        % title={<>},
        xlabel={<>},
        ylabel={<>},
        %% Math sizing done at plot, not axis level.
        % enlargelimits=false, % automatically size graph
        xmin=0, xmax=10,
        ymin=0, ymax=100,
        % xtick={0,20,40,60,80,100},
        % ytick={0,20,40,60,80,100,120},
        % axis lines = left,
        ymajorgrids=true,
        grid style=dashed,
        legend pos=north west,
      ]
        \addplot[
          %%% For math
          % domain= -10:10,
          % samples= 100,
          %%% For data
          only marks, 
          % color=blue,
          % mark=square, % square* will fill the square.
        ]
          coordinates {
            (0, 0)
            (1, 1)
          }; % For math, just remove “coordinates” and type eq in {}
        % \legend{}
      \end{axis}
      ]],
			{ i(1, "Title"), i(2, "Xlabel"), i(3, "Ylabel") }
		),
		{ condition = start_of_tikz }
	),
}
