-- ===========================================================================
-- 1. BOOTSTRAP: Install and load lazy.nvim
-- ===========================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ===========================================================================
-- 2. CORE CONFIGURATION: Load options
-- ===========================================================================

-- This requires the file: lua/options/options.lua
require("options.options")
require("options.autocmd")
require("options.keymaps")

-- ===========================================================================
-- 3. PLUGIN MANAGER SETUP: Configure and run lazy.nvim
-- ===========================================================================

-- This runs lazy.nvim, which automatically:
-- 1. Reads specs from the 'lua/plugins' directory (and all files inside it).
-- 2. Installs/updates plugins.
-- 3. Writes the exact commit to 'lazy-lock.json' (for version locking).
-- 4. Runs configurations from 'lua/config' for plugins with `config = true`.

require("lazy").setup("plugins", {
    -- Options for lazy.nvim
    defaults = {
        -- Set your preferred default lazy-loading strategy here
        -- e.g., lazy = false to load all on startup by default (like Packer)
        -- or lazy = true to load nothing unless an event is specified.
        -- We will generally set 'event' per-plugin in lua/plugins/*.lua
    },
    checker = {
        enabled = true,   -- Check for updates on startup
        notify = false,   -- Don't notify if there are updates
    },
    install = {
        -- Colorschemes to use while installing
        colorscheme = { "tokyonight", "habamax" }
    }
})
