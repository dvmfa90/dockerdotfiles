local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- local opts = { buffer = ev.buf }
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

end)
-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,

    --- replace `example_server` with the name of a language server
    powershell_es = function()
      require('lspconfig').powershell_es.setup({
        ---
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/"  -- in here you can add your own
        -- custom configuration
        ---
      })
    end,
    rust_analyzer = function()
      require'lspconfig'.rust_analyzer.setup{
        cmd = {
          "rustup", "run", "stable", "rust-analyzer",
        }

      }
    end,
    marksman = function()
      require('lspconfig').marksman.setup({
        -- Add any custom configuration here if needed
      })
    end,
  },
})
