return {
	"ThePrimeagen/harpoon",
	lazy = false,
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon Add" })

		vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "Harpoon Remove" })

		vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end)
	end,
}