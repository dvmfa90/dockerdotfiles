-- lua/config/whichkey.lua

local wk = require("which-key")

-- 1. Minimal Global Setup
-- The default setup is necessary for the plugin to function.
wk.setup({})

-- 2. Register the <leader>? keymap
wk.add({
  mode = "n",
  {
    -- ----------------------------------------------------------------------
  -- Buffer local Keymaps
  -- ----------------------------------------------------------------------
    -- Mapped key
    "<leader>?",
    -- Action: Function to show only buffer-local keymaps
    function()
      wk.show({ scope = "buffer" })
    end,
    desc = "Buffer Local Keymaps (which-key)",

      -- ----------------------------------------------------------------------
  -- B. Buffers Group
  -- ----------------------------------------------------------------------
  { "<leader>b", group = "Buffers" }, -- 💡 CORRECTED: Prefix added
  
  -- Buffer Commands
  { "<leader>bk", "<cmd>bd<cr>", desc = "Kill Buffer" },

  -- ----------------------------------------------------------------------
  -- C. Debug Group
  -- ----------------------------------------------------------------------
  { "<leader>d", group = "Debug" }, -- 💡 CORRECTED: Prefix added

  -- DAP Commands
  { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Breakpoint" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Into" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Over" },
  { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Out" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Repl" },
  { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Last" },
  { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "UI" },
  { "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Exit" },

{ "<leader>l", group = "LSP" }, -- Group definition

-- LSP Actions (These correspond to your <leader> maps)
{ "<leader>lca", vim.lsp.buf.code_action, desc = "Code Action (Lightbulb)" },
{ "<leader>lrn", vim.lsp.buf.rename, desc = "Rename Symbol" },

-- LSP Navigation (These are your 'g' maps, categorized under <leader>l)
{ "<leader>ld", vim.lsp.buf.definition, desc = "Go to Definition" },
{ "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
{ "<leader>lgr", "<cmd>Telescope lsp_references<CR>", desc = "Go to References" },
{ "<leader>li", vim.lsp.buf.implementation, desc = "Go to Implementation" },
  -- ----------------------------------------------------------------------
  -- D. File Group 
  -- ----------------------------------------------------------------------
  { "<leader>f", group = "File" }, -- 💡 CORRECTED: Prefix added
  
  -- File Commands
  { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Browse files" },
  { "<leader>fd", "<cmd>windo diffthis<cr>", desc = "Diff splits" },


  -- ----------------------------------------------------------------------
  -- E. Search Group (Telescope)
  -- ----------------------------------------------------------------------
  { "<leader>s", group = "Search" }, -- ✅ CORRECTED: Prefix added
  
  -- Telescope Commands
  { "<leader>sB", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sd", "<cmd>Telescope diagnostics <cr>", desc = "Diagnostics" },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
  { "<leader>sS", "<cmd>Snippets<cr>", desc = "Search Snippets" },
  { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Find String" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
  { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
  { "<leader>si", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc = "Media" },
  { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sT", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },

}

})
