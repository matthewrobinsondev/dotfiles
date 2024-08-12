-- Enable 24-bit color
vim.opt.termguicolors = true

-- Place a column line
vim.opt.colorcolumn = '140'

-- Change cursor depending on theme
local function set_cursor_colors()
  if vim.o.background == 'light' then
    vim.cmd 'highlight Cursor guifg=#B8B8B8 guibg=#B8B8B8'
    vim.cmd 'highlight Cursor2 guifg=red guibg=red'
  else
    vim.cmd 'highlight Cursor guifg=white guibg=white'
    vim.cmd 'highlight Cursor2 guifg=blue guibg=blue'
  end
end

set_cursor_colors()

vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50'

vim.api.nvim_create_augroup('DynamicCursorColor', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'DynamicCursorColor',
  pattern = '*',
  callback = function()
    set_cursor_colors()
  end,
})
