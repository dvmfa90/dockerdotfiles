return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF for faster fuzzy finding
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-file-browser.nvim", -- File browser extension
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- Custom action for Trouble
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    -- Telescope setup
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- Enable fuzzy searching
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case", -- Case-sensitive only if query is typed in upper case
        },
        file_browser = {
          theme = "ivy", -- Optional, to use the ivy theme for file browser
          hijack_netrw = true, -- Hijack netrw, Neovim's default file explorer
          hidden = true, -- Show hidden files
          grouped = true, -- Group directories first
        },
      },
    })

    -- Load extensions
    telescope.load_extension("fzf") -- Enable FZF
    telescope.load_extension("file_browser") -- Enable file browser

    -- Set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

    -- Additional keymaps for file browser and other capabilities
    keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })
    keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find open buffers" })
    keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
  end,
}
