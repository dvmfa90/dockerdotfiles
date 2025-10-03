-- In your /home/diogo/.config/nvim/lua/user/orgmode.lua file:

-- Setup nvim-orgmode
require('orgmode').setup({
  org_agenda_files = "/mnt/onedrive/github/wiki/docs/orgfiles/**/*",
  org_default_notes_file = "/mnt/onedrive/github/wiki/docs/orgfiles/refile.org",
})

-- Setup org-bullets
require('org-bullets').setup()

-- Setup blink.cmp
-- Assuming nvim-cmp is set up elsewhere, this just adds the orgmode source
require('blink.cmp').setup({
  fuzzy = {
    implementation = "lua",
  },
  sources = {
    per_filetype = {
      org = { 'orgmode' }
    },
    providers = {
      orgmode = {
        name = 'Orgmode',
        module = 'orgmode.org.autocompletion.blink',
        fallbacks = { 'buffer' },
      },
    },
  },
})

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

