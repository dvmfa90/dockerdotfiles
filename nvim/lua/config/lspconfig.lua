-- lua/config/lspconfig.lua

-- Import necessary modules
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Define the capabilities for nvim-cmp integration
-- This is crucial for autocompletion features.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- This function runs when a Language Server successfully attaches to a buffer.
-- All buffer-local LSP keymaps and autocmds go here.
local on_attach = function(client, bufnr)
    -- Options for buffer-local keymaps
    -- 'buffer=bufnr' restricts the map to the current buffer.
    local opts = { noremap=true, silent=true, buffer=bufnr }

    -- 1. LSP Navigation Keymaps (Your existing keys)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Go to Definition
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- Go to Declaration
    -- Note: This requires 'nvim-telescope/telescope-fzf-native.nvim' for performance
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- Go to References (Telescope)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Go to Implementation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- Hover Documentation

    -- 2. LSP Actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code Action (lightbulb menu)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)   -- Rename symbol

    -- 3. Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)    -- Go to Previous Diagnostic
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)    -- Go to Next Diagnostic

    -- 4. Autocmd for Format on Save (Optional, but common)
    -- Check if the client supports formatting before setting the autocmd.
    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePost', {
            group = vim.api.nvim_create_augroup('LspFormatting', {}),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })
    end
end


-- -----------------------------------------------------
-- Set up Mason-LSPConfig Handlers
-- -----------------------------------------------------

mason_lspconfig.setup({
    -- This block defines how ALL language servers are configured
    handlers = {
        -- The default handler: This is called for every LSP installed by Mason
        function(server_name)
            lspconfig[server_name].setup({
                -- Pass the capabilities for nvim-cmp
                capabilities = capabilities,
                -- Pass the on_attach function for keymaps/autocmds
                on_attach = on_attach,
            })
        end,
        
        -- EXAMPLE: Custom handler for Lua Language Server (lua_ls)
        -- You can uncomment and modify this block if you need specific settings
        -- for a particular server (e.g., suppressing warnings, custom settings).
        -- ['lua_ls'] = function()
        --     lspconfig.lua_ls.setup({
        --         settings = {
        --             Lua = { 
        --                 diagnostics = { globals = { 'vim' } } 
        --             }
        --         },
        --         capabilities = capabilities,
        --         on_attach = on_attach,
        --     })
        -- end,
    },
})
