return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-phpunit",
    },
    config = function()
      require("neotest").setup({
        discovery = {
          enabled = true,
          concurrent = 1,
          filter_dir = function(name)
            return name ~= "vendor"
          end,
        },
        adapters = {
          require("neotest-phpunit")({}),
        },
      })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tT",
        ':lua require("neotest").run.run(vim.fn.getcwd() .. "/tests")<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php_only",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<F1>]],
        direction = "float",
        float_opts = {
          border = "rounded",
          width = 180,
          height = 22,
          row = 0,
        },
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      opts.keymap = {
        fzf = {
          ["tab"] = "down",
          ["shift-tab"] = "up",
        },
      }
    end,
  },
  {
    "phpactor/phpactor",
    ft = "php",
    run = "composer install --no-dev --optimize-autoloader",
    config = function()
      vim.keymap.set("n", "<Leader>pm", ":PhpactorContextMenu<CR>")
      vim.keymap.set("n", "<Leader>pn", ":PhpactorClassNew<CR>")

      require("lspconfig").phpactor.setup({
        init_options = {
          ["language_server.diagnostics_on_update"] = false,
          ["language_server.diagnostics_on_open"] = false,
          ["language_server.diagnostics_on_save"] = false,
        },
      })
    end,
  },
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
    build = "make",
    opts = {
      provider = "copilot",
      behaviour = {
        enable_token_counting = false,
      },
      windows = {
        position = "right",
        width = 50,
        sidebar_header = {
          align = "left",
          rounded = false,
        },
        ask = {
          start_insert = false,
        },
      },
    },
  },
}
