local dashboard = require('dashboard')

dashboard.setup({
  config = {

    header = {
      '',
      ' __  __                   _   ___                   _     _      ' ,
      '|  \\/  | __ _  _ _   ___ | | / __| __ _ __ __ __ _ | | __| | __ _' ,
      '| |\\/| |/ _` || \' \\ / -_)| || (_ |/ _` |\\ V // _` || |/ _` |/ _` |',
      '|_|  |_|\\__/_||_||_|\\___||_| \\___|\\__/_| \\_/ \\__/_||_|\\__/_|\\__/_|',
      '',
    },
    center = {
      { icon = '  ', desc = 'New file', action = 'enew' },
      { icon = '  ', shortcut = 'SPC f', desc = 'Find file', action = 'Telescope find_files' },
      { icon = '  ', shortcut = 'SPC h', desc = 'Recent files', action = 'Telescope oldfiles' },
      { icon = '  ', shortcut = 'SPC g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    footer = {}
  }
})

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
