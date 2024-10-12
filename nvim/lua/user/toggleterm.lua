require("toggleterm").setup{

      size = 20,  -- Example option to change terminal size
    open_mapping = [[<c-/>]],
    terminal_mappings = true,
    vim.keymap.set('n', '<C-t>1', '<Cmd>ToggleTerm 1<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<C-t>2', '<Cmd>ToggleTerm 2<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<C-t>3', '<Cmd>ToggleTerm 3<CR>', { noremap = true, silent = true }),
    -- Function to set terminal-specific key mappings
    on_open = function()
      local opts = { buffer = 0 }
      vim.keymap.set('n', '<C-b>t', '<Cmd>TermSelect<CR>', { noremap = true, silent = true })
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-t>1', [[<C-\><C-n><Cmd>ToggleTerm 1<CR>]], opts)
    vim.keymap.set('t', '<C-t>2', [[<C-\><C-n><Cmd>ToggleTerm 2<CR>]], opts)
    vim.keymap.set('t', '<C-t>3', [[<C-\><C-n><Cmd>ToggleTerm 3<CR>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end,
  }

