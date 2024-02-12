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
--

-- remap moving windows, splitting and closing
vim.keymap.set("n", "<leader>wh", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { silent = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { silent = true, desc = "Move to top window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { silent = true, desc = "Move to right window" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { silent = true, desc = "Split vertically" })
vim.keymap.set("n", "<leader>wc", ":q<CR>", { silent = true, desc = "Close" })
vim.keymap.set("n", "<leader>wb", "<C-o>", { noremap = true, silent = true, desc = "Go Back" })
vim.keymap.set("n", "<leader>wf", "<C-i>", { noremap = true, silent = true, desc = "Go Forward" })
