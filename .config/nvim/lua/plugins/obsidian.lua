return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      note_id_func = function(title)
        return title
      end,
      workspaces = {
        {
          name = 'personal',
          path = '~/Documents/obsidian',
        },
      },
      daily_notes = {
        folder = 'Daily',
        template = 'Daily Template.md',
      },
      templates = {
        subdir = 'Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        substitutions = {
          -- Could add weekly, monthly etc
          yesterday = function()
            return os.date('%Y-%m-%d', os.time() - 24 * 60 * 60)
          end,
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
