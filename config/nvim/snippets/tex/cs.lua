local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
-- local fmt = require("luasnip.extras.fmt").fmt --> format node
local fmta = require("luasnip.extras.fmt").fmta --> format node

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
	autosnippet(
		{ trig = "bjs", name = "js" },
		fmta(
			[[
\begin{lstlisting}[
           language=javascript,
           showspaces=false,
           basicstyle=\ttfamily,
           numbers=left,
           numberstyle=\tiny,
           commentstyle=\color{gray}
        ]
  <>
\end{lstlisting}
    ]],
			{ i(1) }
		)
	),

	autosnippet(
		{ trig = "bpy", name = "py" },
		fmta(
			[[
\begin{lstlisting}[
           language=python,
           showspaces=false,
           basicstyle=\ttfamily,
           numbers=left,
           numberstyle=\tiny,
           commentstyle=\color{gray}
        ]
  <>
\end{lstlisting}
    ]],
			{ i(1) }
		)
	),

	autosnippet(
		{ trig = "bsql", name = "sql" },
		fmta(
			[[
\begin{lstlisting}[
           language=SQL,
           showspaces=false,
           basicstyle=\ttfamily,
           numbers=left,
           numberstyle=\tiny,
           commentstyle=\color{gray}
        ]
  <>
\end{lstlisting}
    ]],
			{ i(1) }
		)
	),
}
