return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.completion.spell,
				null_ls.builtins.diagnostics.phpstan,
				--null_ls.builtins.diagnostics.phpmd,
				null_ls.builtins.formatting.phpcbf,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
