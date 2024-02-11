return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.register({
			h = {
				name = "Harpoon", -- Sets the name for the "<leader>h" prefix
			},
		}, { prefix = "<leader>" })
	end,
}
