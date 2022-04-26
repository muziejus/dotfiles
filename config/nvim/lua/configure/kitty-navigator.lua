return {
  'hermitmaster/nvim-kitty-navigator',
  run = 'cp kitty/* ~/.config/kitty/',
  config = function()
    require('nvim-kitty-navigator').setup {}
  end
}
