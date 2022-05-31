-- local configs = require 'lspconfig.configs'
-- local util = require 'lspconfig.util'

-- local server_name = 'glint'

-- local bin_name = 'glint-language-server'
-- local cmd = { bin_name }

-- if vim.fn.has 'win32' == 1 then
--   cmd = { 'cmd.exe', '/C', bin_name }
-- end

-- if not configs[server_name] then
--   configs[server_name] = {
--     default_config = {
--       cmd = cmd,
--       on_new_config = function(config, new_root_dir)
--         local path_separator = util.is_windows and ";" or ":"
--         local project_root = util.find_node_modules_ancestor(new_root_dir)
--         -- Glint should not be installed globally
--         local node_bin_path = util.path.join(project_root, "node_modules", ".bin")
--         local path = node_bin_path .. path_separator .. vim.env.PATH
--         if config.cmd_env then
--           config.cmd_env.PATH = path
--         else
--           config.cmd_env = { PATH = path }
--         end
--       end,
--       filetypes = { "html.handlebars", "handlebars", "typescript", "javascript",
--         "typescript.glimmer", "javascript.glimmer" },
--       root_dir = util.root_pattern(".glintrc.yml");
--     },
--     docs = {
--       description = [[
--   https://github.com/typed-ember/glint

--   https://typed-ember.gitbook.io/glint/

--   `glint-language-server` can be installed via `volta`:

--   ```sh
--   volta install @glint/core
--   ```
--   ]]   ,
--       default_config = {
--         root_dir = [[root_pattern(".glintrc.yml")]],
--       },
--     },
--   }
-- end

require("lspconfig").glint.setup({
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function()
    for i, server in ipairs(vim.lsp.buf_get_clients()) do
      if server.name == "tsserver" then
        vim.lsp.get_client_by_id(server.id).stop()
      end
    end
  end,
})
