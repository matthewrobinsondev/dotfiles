return {
  {
    'projekt0n/github-nvim-theme',
    config = function()
      vim.cmd.colorscheme 'github_light'
    end,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    -- config = function()
    --   require('catppuccin').setup {
    --     integrations = {
    --       cmp = true,
    --       gitsigns = true,
    --       harpoon = true,
    --       illuminate = true,
    --       indent_blankline = {
    --         enabled = false,
    --         scope_color = 'sapphire',
    --         colored_indent_levels = false,
    --       },
    --       mason = true,
    --       native_lsp = { enabled = true },
    --       notify = true,
    --       nvimtree = true,
    --       neotree = true,
    --       symbols_outline = true,
    --       telescope = true,
    --       treesitter = true,
    --       treesitter_context = true,
    --     },
    --   }
    --
    --   -- vim.cmd.colorscheme 'catppuccin'
    -- end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        highlight_groups = {
          StatusLine = { fg = 'love', bg = 'love', blend = 10 },
          StatusLineNC = { fg = 'subtle', bg = 'surface' },
          TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
          TelescopeNormal = { bg = 'none' },
          TelescopePromptNormal = { bg = 'base' },
          TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
          TelescopeSelection = { fg = 'text', bg = 'base' },
          TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
        },
      }

      -- vim.cmd.colorscheme 'rose-pine-moon'
    end,
  },
}
