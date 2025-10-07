
-- Setup nvim-orgmode
require('orgmode').setup({
  org_agenda_files = "/mnt/onedrive/github/wiki/docs/orgfiles/**/*",
  org_default_notes_file = "/mnt/onedrive/github/wiki/docs/orgfiles/refile.org",
  org_todo_keywords = {'TODO(n)', 'INPROGRESS(p)', 'WAITING', '|', 'DONE'},
  org_todo_keyword_faces = {
    INPROGRESS = ':background yellow :foreground black :slant italic :underline on',
    WAITING = ':foreground blue :weight bold',
    TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
  },
  win_split_mode = function(name)
  -- Make sure it's not a scratch buffer by passing false as 2nd argument
  local bufnr = vim.api.nvim_create_buf(false, false)
  --- Setting buffer name is required
  vim.api.nvim_buf_set_name(bufnr, name)

  local fill = 0.8
  local width = math.floor((vim.o.columns * fill))
  local height = math.floor((vim.o.lines * fill))
  local row = math.floor((((vim.o.lines - height) / 2) - 1))
  local col = math.floor(((vim.o.columns - width) / 2))

  vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded"
  })
end
})
-- Setup org-bullets
require('org-bullets').setup()

-- Setup blink.cmp
-- Assuming nvim-cmp is set up elsewhere, this just adds the orgmode source
-- require('blink.cmp').setup({
--   fuzzy = {
--     implementation = "lua",
--   },
--   sources = {
--     per_filetype = {
--       org = { 'orgmode' }
--     },
--     providers = {
--       orgmode = {
--         name = 'Orgmode',
--         module = 'orgmode.org.autocompletion.blink',
--         fallbacks = { 'buffer' },
--       },
--     },
--   },
-- })

-- Setup Telescope and load the orgmode extension
-- If Telescope is already set up in 'user/telescp.lua', you may only need the next line
-- but setting it up again here doesn't hurt.
-- require('telescope').setup()
require('telescope').load_extension('orgmode')

-- Define Keymaps
-- Added 'desc' for better WhichKey integration if you use it.
vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading, { desc = 'Org Refile Heading' })
vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings,
  { desc = 'Org Search Headings' })
vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link, { desc = 'Org Insert Link' })

