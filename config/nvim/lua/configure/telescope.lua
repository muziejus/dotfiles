return {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-telescope/telescope-symbols.nvim',
    'folke/trouble.nvim',
  },
  config = function()
    local actions = require("telescope.actions")
    local trouble = require('trouble.providers.telescope')

    require('telescope').setup({
      defaults = {
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        mappings = {
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },
    })

    require('telescope').load_extension('fzf')
  end,
}
