return {

  {
    --  install and manage lsp and formatter
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatter --
        "stylua",
        "prettier",
        "black",
        -- lsp server --
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "pyright",
      },
    },
  },

  {
    -- use installed formatter
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    -- use installed lsp
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    -- syntax highlighter
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "LintaoAmons/scratch.nvim",
    config = function()
      local telescope_available = vim.g.loaded_telescope
      require("scratch").setup {
        scratch_file_dir = vim.fn.stdpath "cache" .. "/scratch",
        filetypes = { "lua", "js", "sh", "ts", "py" },
        filetype_details = {
          requireDir = true,
          filename = function(filetype)
            return "scratch." .. filetype
          end,
          content = { "" },
          cursor = {
            location = { 1, 1 },
            insert_mode = true,
          },
        },
        window_cmd = "edit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
        use_telescope = telescope_available, -- Use Telescope if available
      }
    end,
    event = "VeryLazy", -- Remove if unnecessary
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    event = "VeryLazy",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      local hop = require "hop"
      local directions = require("hop.hint").HintDirection

      hop.setup { keys = "etovxqpdygfblzhckisuran" }

      vim.keymap.set("", "f", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
      end, { remap = true })

      vim.keymap.set("", "F", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
      end, { remap = true })

      vim.keymap.set("", "t", function()
        hop.hint_words()
      end, { remap = true })
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"
      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }
      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require "dap"
  --     local dapui = require "dapui"
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  --
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("core.utils").load_mappings "dap"
  --   end,
  -- },
  --
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   config = function(_, opts)
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --     require("core.utils").load_mappings "dap_python"
  --   end,
  -- },
}
