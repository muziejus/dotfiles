return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"lervag/vimtex",
		init = function()
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_quickfix_ignore_filters = {
				"Font Warning",
				"Overfull",
			}
		end,
	},
	-- { "jbyuki/nabla.nvim" },
	-- { "vim-pandoc/vim-pandoc" },
	-- { "vim-pandoc/vim-pandoc-syntax" },
	{ "quarto-dev/quarto-nvim" },
	{ "jmbuhr/otter.nvim" },
	{
		"preservim/vim-pencil",
		init = function()
			vim.g["pencil#wrapModeDefault"] = "soft"
		end,
	},
	{ "skwee357/nvim-prose" },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
        -- these are examples, not defaults. Please see the readme
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_auto_open_output = true
        vim.g.molten_auto_open_html_in_browser = true
        vim.g.molten_output_win_max_height = 20
    end,
    config = function()
      local init= function ()
        local quarto_cfg = require("quarto.config").config
        quarto_cfg.codeRunner.default_method = 'molten'
        vim.cmd [[MoltenInit]]
      end
    end
  },
  {
    "GCBallesteros/jupytext.nvim",
    opts = {
      custom_language_formatting = {
        python = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
        r = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        }
      }
    }
  }
}
