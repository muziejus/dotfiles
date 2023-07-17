local prefix = os.getenv("HOMEBREW_PREFIX")
local cmp = require("cmp")

local config = {
	cmd = { prefix .. "/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)

cmp.setup.filetype("java", {
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 5 },
	}),
})
