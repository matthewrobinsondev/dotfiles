-- set leader to space
vim.g.mapleader = " "

-- set lazy ui keymap
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- Press 'U' for redo
vim.keymap.set("n", "U", "<C-r>")

-- Set = to format
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "Format" })

-- move lines up & down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep original copy when pasting
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste" })

-- Yank into clipboard
-- vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
