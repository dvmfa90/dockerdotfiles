local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}


local mappings = {
  -- ["1"] = "which_key_ignore",
  b = {
    name = "Buffers",
    k = { "<cmd>bd<cr>", "Kill Buffer" },
    -- i = { "<cmd>PackerInstall<cr>", "Install" },
    -- s = { "<cmd>PackerSync<cr>", "Sync" },
    -- S = { "<cmd>PackerStatus<cr>", "Status" },
    -- u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  c = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<cr>", "Compile" },
    -- i = { "<cmd>PackerInstall<cr>", "Install" },
    -- s = { "<cmd>PackerSync<cr>", "Sync" },
    -- S = { "<cmd>PackerStatus<cr>", "Status" },
    -- u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },


  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },

  -- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  -- require("dapui").open()
  -- require("dapui").close()
  -- require("dapui").toggle()

  s = {
    name = "Search",
    B = { "<cmd>Telescope buffers<cr>", "Search Buffers" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    d = { "<cmd>Telescope diagnostics <cr>", "Diagnostics" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    S = { "<cmd>Snippets<cr>", "Search Snippets" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    T = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
  },

  g = {
    name = "Git",
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    -- j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    -- k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    -- l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    -- p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    -- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    -- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    -- u = {
    --   "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    --   "Undo Stage Hunk",
    -- },
    --
    s = {
      name = "Status",
      s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },

    },

    a = {
      name = "Actions",
      s = { "<cmd>G<cr>", "Stage" },
      c = { "<cmd>Git commit<cr>", "Git Commmit" },
      p = { "<cmd>Git push<cr>", "Git Push" },

    },
  },

    -- d = {
    --   "<cmd>Gitsigns diffthis HEAD<cr>",
    --   "Diff",
    -- },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    t = { "<cmd>vim.lsp.buf.declaration<cr>", "Test" },
  },

  L = {
    name = "LSP SAGA",
    g = {  "<cmd>Lspsaga lsp_finder<CR>", "Go to Definition" },
    K = {  "<cmd>Lspsaga hover doc<cr>", "Hover info" },
    r = {  "<cmd>Lspsaga rename<cr>", "Rename" },

  },


  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
    r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
  },

  h = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add mark" },
    v = { "<cmd>Telescope harpoon marks<cr>", "View marks" },
  },

  n = {
    name = "Neorg",
    w = { "<cmd>Neorg workspace work<cr>", "Work" },
    m = { "<cmd>Neorg workspace main<cr>", "Main" },
  },
  f = {
    name = "File",
    b = { "<cmd>Telescope file_browser<cr>", "Browse files" },
    d = { "<cmd>windo diffthis<cr>", "Diff splits" },
  },

  -- z = {
  --   name = "Zen",
  --   z = { "<cmd>TZAtaraxis<cr>", "Zen" },
  --   m = { "<cmd>TZMinimalist<cr>", "Minimal" },
  --   n = { "<cmd>TZNarrow<cr>", "Narrow" },
  --   f = { "<cmd>TZFocus<cr>", "Focus" },
  -- },
}


which_key.setup(setup)
which_key.register(mappings, opts)

