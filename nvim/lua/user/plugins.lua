local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- use { 'github/copilot.vim' }
  -- use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
  -- use { "catppuccin/nvim", as = "catppuccin" }
 -- use { 'j-hui/fidget.nvim', tag = 'legacy' }
  use 'terrortylor/nvim-comment'

  use {
   'VonHeikemen/lsp-zero.nvim',
   branch = 'v3.x',
   requires = {
   -- manage LSP from neovim
   {'williamboman/mason.nvim'},
   {'williamboman/mason-lspconfig.nvim'},
   -- LSP Support
   {'neovim/nvim-lspconfig'},
   
   -- Autocompletion
   {'hrsh7th/nvim-cmp'},
   {'hrsh7th/cmp-nvim-lsp'},
   {'L3MON4D3/LuaSnip'},
   {'rafamadriz/friendly-snippets'},
   {'hrsh7th/cmp-buffer'},
   {'hrsh7th/cmp-path'},
   {'saadparwaiz1/cmp_luasnip'},
   }
  }
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
    use { 'norcalli/nvim-colorizer.lua' }
    use { "stevearc/dressing.nvim" }
    use { "nvim-tree/nvim-tree.lua" }
    use { 'folke/which-key.nvim' }
    use { 'vimwiki/vimwiki' }
    -- use { 'nvim-neorg/neorg', run = ':Neorg sync-parsers' }
--     use {
--   "nvim-neorg/neorg",
--   rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
--   tag = "*", -- Pin Neorg to the latest stable release
--   config = function()
--       require("neorg").setup()
--   end,
-- }


    use { 'nvim-lualine/lualine.nvim' }
    use { 'akinsho/bufferline.nvim' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        }    -- use 'navarasu/onedark.nvim'
    use {
  "folke/noice.nvim",
   requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
}
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
