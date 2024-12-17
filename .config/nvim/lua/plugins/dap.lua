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

      -- I've gone rogue
      local dap = require 'dap'

      dap.adapters.coreclr = {
        type = 'executable',
        command = '/usr/local/bin/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }
    end,
  },
}
