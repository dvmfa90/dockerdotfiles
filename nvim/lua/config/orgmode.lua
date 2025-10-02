require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })
    require('org-bullets').setup()
    require('blink.cmp').setup({
      sources = {
        per_filetype = {
          org = {'orgmode'}
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
  require('telescope').setup()
  require('telescope').load_extension('orgmode')
  vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading)
  vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings)
  vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link)
