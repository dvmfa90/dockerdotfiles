-- lua/config/cmp.lua

local cmp = require('cmp')
local luasnip = require("luasnip")

-- Remove the lsp-zero dependencies:
-- local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_format = require('lsp-zero').cmp_format()

-- Load friendly-snippets (assuming this is now your dedicated snip config file)
-- Note: This should ideally be in lua/config/snip.lua, but for a single file, 
-- we'll include it here temporarily.
require('luasnip.loaders.from_vscode').lazy_load()


-- Utility function to check if there are words before the cursor
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Check if column is not 0 AND the character right before the cursor is NOT a space
  return col ~= 0 and 
    vim.api.nvim_buf_get_text(0, line - 1, col - 1, line - 1, col, {})[1]:match("%S")
end


cmp.setup({
  snippet = {
    -- Use the standard LuaSnip expand function
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  
  sources = {
    -- Change 'nvim_lsp' to the official 'nvim_lsp' source name
    {name = 'nvim_lsp'},
    -- If 'cody' is a custom source, keep it. Otherwise, remove or replace.
    {name = 'cody'}, 
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'path'},
  },
  
  -- Use the default nvim-cmp formatting (or customize this block)
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
  },

  experimental = {
    ghost_text = true,
  },
  
  mapping = cmp.mapping.preset.insert({
    -- Navigation and Confirmation
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
    ["<C-Space>"] = cmp.mapping.complete(),     -- Show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),            -- Close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    -- Standard Scroll Docs (no change needed)
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    
    -- Snippet Jump Mappings (Removed lsp-zero dependency)
    -- 💡 REPLACED lsp-zero's cmp_action.luasnip_jump_* with standard LuaSnip functions
    ['<C-f>'] = cmp.mapping(function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end, { "i", "s" }),
    
    ['<C-b>'] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),

    -- Tab/Shift-Tab Logic (The core logic remains the same)
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
})

-- Optional: If you want to configure specific formatting/icons for the completion menu, 
-- this is where you would place the custom 'formatting' block.
