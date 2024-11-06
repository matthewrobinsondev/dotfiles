return {
  {
    'dreamsofcode-io/nvim-dap-go',
    ft = 'go',
    dependencies = 'mfussenegger/nvim-dap',
    config = function(_, opts)
      require('dap-go').setup(opts)

      vim.keymap.set('n', '<leader>dgt', function()
        require('dap-go').debug_test()
      end, { desc = 'Debug go test' })

      vim.keymap.set('n', '<leader>dus', function()
        local widgets = require 'dap.ui.widgets'
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end, { desc = 'Open debugging sidebar' })
    end,
  },
}
