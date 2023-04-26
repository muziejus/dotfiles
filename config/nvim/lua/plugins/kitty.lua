return {
  "fladson/vim-kitty",
  {
    'knubie/nvim-kitty-navigator',
    build = 'cp kitty/* ~/.config/kitty/',
    config = function()
        require('nvim-kitty-navigator').setup()
    end
  }
}
