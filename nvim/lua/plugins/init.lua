return {
  -- =====================================================================
  -- 1. Colorscheme (Must load early, so lazy=false and high priority)
  -- =====================================================================
  {
    "folke/tokyonight.nvim",
    lazy = false,
    style = "night",
    priority = 1000, -- Load first
    priority = 1000, -- Load first
   config = function()
    -- This line is what makes it explicit and easy to follow!
    require("config.tokyonight")
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
--   {
--   'nvim-orgmode/orgmode',
--   event = 'VeryLazy',
--   config = function()
--     require("config.orgmode")
--   end,
-- },
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
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
  },
  config = function()
    require("config.noice")
  end,
},

}
