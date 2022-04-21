return {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-telescope/telescope-symbols.nvim',
    'folke/trouble.nvim',
  },
  config = function()
    local trouble = require('trouble.providers.telescope')

    require('telescope').setup({
      defaults = {
        file_sorter = require('telescope.sorters').get_fuzzy_file,
      },
    })

    require('telescope').load_extension('fzf')
  end,
}
