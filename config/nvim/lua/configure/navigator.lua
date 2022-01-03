return {
  'ray-x/navigator.lua',
  requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  config = function()
    require'navigator'.setup({
      on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      end,
      lsp_installer = true,
      lsp = {
        format_on_save = true,
        disable_lsp = { 'svelte', 'kotlin_language_server', 'angularls' },
        servers = {
          'ember',
        }
      }
    })
  end
}

-- -- See keymaps file for lspconfig keymaps.
-- return {
--   'neovim/nvim-lspconfig',
--   requires = { 'jose-elias-alvarez/null-ls.nvim' },
--   config = function()
--     vim.cmd([[
--       autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
--       autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
--       autocmd BufWritePre *.gjs lua vim.lsp.buf.formatting_sync(nil, 1000)
--       autocmd BufWritePre *.gts lua vim.lsp.buf.formatting_sync(nil, 1000)
--       autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
--       autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
--     ]])
--   end
-- }
