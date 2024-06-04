local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
	settings = {
		save_on_toggle = false,
		sync_on_ui_close = false,
		save_on_change = true,
		enter_on_sendcmd = false,
		excluded_filetyupes = { "harpoon", "alpha", "dashboard", "gitcommit" },
		mark_branch = false,
		key = function()
			return vim.loop.cwd()
		end,
	},
})
-- REQUIRED

-- Keymaps in keymaps.

-- For a keybinding to use the telescope fuzzy finder
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
-- 	local file_paths = {}
-- 	for _, item in ipairs(harpoon_files.items) do
-- 		table.insert(file_paths, item.value)
-- 	end
--
-- 	require("telescope.pickers")
-- 		.new({}, {
-- 			prompt_title = "Harpoon",
-- 			finder = require("telescope.finders").new_table({
-- 				results = file_paths,
-- 			}),
-- 			previewer = conf.file_previewer({}),
-- 			sorter = conf.generic_sorter({}),
-- 		})
-- 		:find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
