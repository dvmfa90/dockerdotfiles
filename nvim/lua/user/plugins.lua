local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer... close and reopen Neovim.")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand to reload and sync when saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Safely require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Auto snapshot path
local snapshot_path = fn.stdpath("config") .. "/snapshots"
if fn.isdirectory(snapshot_path) == 0 then
  fn.mkdir(snapshot_path, "p")
end

-- Snapshot before updates or syncs
vim.api.nvim_create_autocmd("User", {
  pattern = { "PackerPreUpdate", "PackerPreSync" },
  callback = function()
    local timestamp = os.date("%Y%m%d_%H%M%S")
    local snapshot_file = string.format("%s/%s.json", snapshot_path, timestamp)
    require("packer").snapshot(snapshot_file)
    vim.notify("📦 Snapshot saved to " .. snapshot_file, vim.log.levels.INFO)
  end,
})

-- Command to load a previous snapshot
vim.api.nvim_create_user_command("PackerLoadSnapshot", function(opts)
  local file = opts.args
  local full_path = snapshot_path .. "/" .. file
  if fn.filereadable(full_path) == 1 then
    require("packer").snapshot_load(full_path)
    vim.notify("📦 Loaded snapshot: " .. file, vim.log.levels.INFO)
  else
    vim.notify("❌ Snapshot not found: " .. file, vim.log.levels.ERROR)
  end
end, {
  nargs = 1,
  complete = function()
    return fn.readdir(snapshot_path)
  end,
})

-- Configure packer
packer.init({
  snapshot_path = snapshot_path,
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
    prompt_border = "rounded",
  },
})

-- Plugin list
return packer.startup(function(use)
  -- Plugins
  use({ "nvim-treesitter/nvim-treesitter" })
  use({
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  })
  use("terrortylor/nvim-comment")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim", commit = "e2f7f9044ec30067bc11800a9e266664b88cda22" },
      { "williamboman/mason-lspconfig.nvim", commit = "8e46de9241d3997927af12196bd8faa0ed08c29a" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  })

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  use("norcalli/nvim-colorizer.lua")
  use("stevearc/dressing.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("folke/which-key.nvim")

  -- Markdown-related
  use("plasticboy/vim-markdown")
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
  use("MunifTanjim/prettier.nvim")
  use({
    "MeanderingProgrammer/render-markdown.nvim",
    after = { "nvim-treesitter" },
    requires = { "echasnovski/mini.nvim", opt = true },
    config = function()
      require("render-markdown").setup({})
    end,
  })
  use("lervag/wiki.vim")

  -- UI
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")

  -- Telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })

  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

