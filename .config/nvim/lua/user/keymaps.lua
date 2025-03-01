vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- move lines up & down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- remap moving windows, splitting and closing
vim.keymap.set('n', '<leader>wh', '<C-w>h', { silent = true, desc = 'Move to left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { silent = true, desc = 'Move to bottom window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { silent = true, desc = 'Move to top window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { silent = true, desc = 'Move to right window' })
vim.keymap.set('n', '<leader>wc', ':q<CR>', { silent = true, desc = 'Close' })
vim.keymap.set('n', '<leader>wb', '<C-o>', { noremap = true, silent = true, desc = 'Go Back' })
vim.keymap.set('n', '<leader>wf', '<C-i>', { noremap = true, silent = true, desc = 'Go Forward' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true, desc = 'Split vertically' })
vim.keymap.set('n', '<leader>w-', ':split<CR>', { silent = true, desc = 'Split horizontally' })

vim.keymap.set('n', '<leader>e', function()
  require('oil').toggle_float()
end, { desc = 'Toggle Oil' })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')

-- open lazy menu
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Lazy' })

-- Press 'U' for redo
vim.keymap.set('n', 'U', '<C-r>')

-- keep in the middle when searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Screen shot of code
vim.keymap.set('v', '<leader>cn', ':CarbonNow<CR>', { silent = true, desc = 'Take Carbon Screenshot' })

-- vim-fugitive
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame -w<cr>')
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>')
vim.keymap.set('n', '<leader>gc', ':Git checkout ')
vim.keymap.set('n', '<leader>gs', ':G<cr>')
vim.keymap.set('n', 'g[', '<cmd>diffget //2<cr>')
vim.keymap.set('n', 'g]', '<cmd>diffget //3<cr>')

-- obsidian
vim.keymap.set('n', '<leader>ot', ':ObsidianToday<CR>', { desc = '[O]bsidian [T]oday' })
vim.keymap.set('n', '<leader>oy', ':ObsidianYesterday<CR>', { desc = '[O]bsidian [Y]esterday' })
vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = '[O]bsidian [N]ew' })
vim.keymap.set('n', '<leader>oft', ':ObsidianNewFromTemplate<CR>', { desc = '[O]bsidian [F]rom [T]emplate' })
vim.keymap.set('n', '<leader>sot', ':ObsidianTags<CR>', { desc = '[S]earch [O]bsidian [T]ags' })
vim.keymap.set('n', '<leader>sod', ':ObsidianDailies<CR>', { desc = '[S]earch [O]bsidian [D]ailies' })
