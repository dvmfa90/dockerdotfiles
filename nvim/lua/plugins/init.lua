return {
  -- =====================================================================
  -- 1. Colorscheme (Must load early, so lazy=false and high priority)
  -- =====================================================================
  {
    "folke/tokyonight.nvim",
    lazy = false,
    style = "night",
    priority = 1000, -- Load first
   config = function()
    -- This line is what makes it explicit and easy to follow!
    require("config.tokyonight")
    end,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000, -- Load first
   config = function()
    -- This line is what makes it explicit and easy to follow!
    require("config.snacks")
    end,
  },
   -- =====================================================================
  -- 2. General Utility Plugins (Lazy load on common events/commands)
  -- =====================================================================

  -- Lualine (Status Line)
  {
    "nvim-lualine/lualine.nvim",
    -- Load after the entire config is done, but before the user starts editing
    event = "VeryLazy",
    -- Tells lazy.nvim to run the 'config.lualine' module after loading
   config = function()
    -- This line is what makes it explicit and easy to follow!
    require("config.lualine")
    end,
  },
  {
  'nvim-orgmode/orgmode',
  -- ft = "org",
    lazy = false,
    priority = 1000, -- Load first
  -- event = 'VeryLazy',
  dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-orgmode/telescope-orgmode.nvim',
      'nvim-orgmode/org-bullets.nvim',
      'Saghen/blink.cmp',
  },
  config = function()
    require("config.orgmode")
  end,
},
{
  'kevinhwang91/nvim-ufo',
  event = 'VeryLazy',
  dependencies = {
      'kevinhwang91/promise-async',
  },
  config = function()
    require("config.ufo")
  end,
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("config.nvimtree")
  end,
},

{
  "terrortylor/nvim-comment",
  event = "VeryLazy",
  config = function()
    require("config.nvimcomment")
  end,
},
 {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    -- 'opts = {}' is sufficient to load the plugin with default settings.
    opts = {}, 
    dependencies = { "nvim-tree/nvim-web-devicons" } -- Bufferline usually needs devicons
  },
-- {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   dependencies = {
--       "MunifTanjim/nui.nvim",
--       "rcarriga/nvim-notify",
--   },
--   config = function()
--     require("config.noice")
--   end,
-- },
 {
   "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    -- 'opts = {}' is sufficient to load the plugin with default settings.
    dependencies = {
       'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require("config.treesitter")
  end,
  },
-- {
--   event = "VeryLazy",
--   opts = {}, 
--   dependencies = { "nvim-treesitter/nvim-treesitter" } -- Bufferline usually needs devicons
-- },
 {
   "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
  },
    -- 'opts = {}' is sufficient to load the plugin with default settings.
  config = function()
    require("config.telescope")
  end,
  },
  {
  "plasticboy/vim-markdown",
  -- Load only when a Markdown file is opened
  ft = "markdown", 
  -- No config needed; it works using Vimscript defaults
},
-- {
--   "iamcco/markdown-preview.nvim",
--   -- Load only when the command is run
--   cmd = { "MarkdownPreview", "MarkdownPreviewStop" }, 
--   -- The build key replaces 'run'
--   build = "cd app && npm install", 
--   -- Ensure it loads for Markdown files
--   ft = "markdown", 
--   -- We'll assume default config, so opts = {}
--    config = function()
--     require("markdown-preview").setup({})
--   end,
-- },
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
},
{
  "MunifTanjim/prettier.nvim",
  -- Load after most plugins are done initializing
  event = "VeryLazy", 
  -- Explicitly call your config file for setup and keymaps
  config = function()
    require("config.prettier")
  end,
  -- Note: prettier.nvim needs Node.js and the 'prettier' package installed globally/locally.
},
{
  "MeanderingProgrammer/render-markdown.nvim",
  -- Load only when a Markdown file is opened
  ft = "markdown", 
  
  dependencies = {
    -- Replaces 'after = { "nvim-treesitter" }'
    "nvim-treesitter/nvim-treesitter", 
    -- Replaces 'requires = { "echasnovski/mini.nvim", opt = true }'
    "echasnovski/mini.nvim", 
  },
  
  -- Explicitly call your config file (optional, but clean)
  config = function()
    require("config.render-markdown") -- assuming you use a separate config file
  end,
},

{
 "lervag/wiki.vim",
 },

{
  "norcalli/nvim-colorizer.lua",
 },

 {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("config.whichkey") -- assuming you use a separate config file
  end,
},
-- {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--   },
--   keys = {
--     {
--       "<leader>?",
--       function()
--         require("which-key").show({ global = false })
--       end,
--       desc = "Buffer Local Keymaps (which-key)",
--     },
--   },
-- },
   -- =====================================================================
  -- 3. LSP
  -- =====================================================================

-- Mason (LSP/DAP/Tools Installer)
{
  "williamboman/mason.nvim",
  cmd = "Mason", -- Load when Mason command is used
  opts = {},     -- Use defaults for now (can add custom options later)
},

-- nvim-lspconfig and mason-lspconfig (Core LSP Setup)
{
  "neovim/nvim-lspconfig",
  -- Load before reading any buffer
  event = "BufReadPre", 
  
  dependencies = {
    -- Auto-sets up servers installed by Mason
    "williamboman/mason-lspconfig.nvim", 
    -- We need Mason installed
    "williamboman/mason.nvim",
  },
  
  -- Explicitly call your LSP config file
  config = function()
    require("config.lspconfig")
  end,
},

-- nvim-cmp (Completion Engine)
{
  "hrsh7th/nvim-cmp",
  -- Load when you start typing
  event = "InsertEnter", 
  
  dependencies = {
    -- Sources:
    "hrsh7th/cmp-nvim-lsp", -- LSP source
    "L3MON4D3/LuaSnip",     -- Snippets engine (must be configured separately)
    "saadparwaiz1/cmp_luasnip", -- Snippets source
    "hrsh7th/cmp-buffer",   -- Buffer words source
    "hrsh7th/cmp-path",     -- File path source
  },
  
  -- Explicitly call your CMP config file
  config = function()
    require("config.cmp")
  end,
},

-- LuaSnip (Snippet Engine)
{
  "L3MON4D3/LuaSnip",
  -- Load immediately when nvim-cmp loads
  dependencies = {
    "rafamadriz/friendly-snippets", -- Snippet collection
  },
  -- Explicitly call your Snippet config file
  config = function()
    require("config.snip")
  end,
},
}
