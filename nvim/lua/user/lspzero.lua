local lsp_zero = require('lsp-zero')

-- Setup LSP attachment behavior
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  local map = vim.keymap.set

  -- Default LSP keymaps from lsp-zero
  lsp_zero.default_keymaps(opts)

  -- Extra keymaps
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)

  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end
end)

-- Mason setup (LSP installer)
require('mason').setup({})

-- Mason LSPConfig integration
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright' },
  handlers = {
    -- Default handler for most servers
    lsp_zero.default_setup,

    -- Powershell LSP
    powershell_es = function()
      require('lspconfig').powershell_es.setup({
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
      })
    end,

    -- Rust LSP (via rustup)
    rust_analyzer = function()
      require('lspconfig').rust_analyzer.setup({
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
      })
    end,

    -- Markdown LSP (Marksman)
    marksman = function()
      require('lspconfig').marksman.setup({})
    end,
  },
})

