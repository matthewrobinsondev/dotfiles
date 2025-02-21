return {
  {
    'projekt0n/github-nvim-theme',
    config = function()
      -- vim.cmd.colorscheme 'github_dark_default'
    end,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    config = function()
      require('catppuccin').setup {
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = 'sapphire',
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          notify = true,
          nvimtree = true,
          neotree = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      }

      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
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
  {
    'Mofiqul/dracula.nvim',
    config = function()
      -- vim.cmd.colorscheme 'dracula'
    end,
  },
  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
      vim.cmd [[colorscheme aura-dark]]
    end,
  },
  {
    'vague2k/vague.nvim',
    config = function()
      require('vague').setup {
        -- optional configuration here
      }

      vim.cmd.colorscheme 'vague'
    end,
  },
}
