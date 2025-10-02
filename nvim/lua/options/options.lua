local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for d
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    hlsearch = false,                         -- highlight all matches on previous search patt  ern
    incsearch = true,
    colorcolumn = {120},
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT --   anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below curren  t window
    splitright = true,                       -- force all vertical splits to go to the right o  f current window
    -- termguicolors = true,                    -- set term gui colors (most terminals support   this)
    timeoutlen = 400,                        -- time to wait for a mapped sequence to complete   (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (  or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 2,                          -- the number of spaces inserted for each indenta  tion
    tabstop = 2,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                  -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it woul  d shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    textwidth = 120,
    conceallevel = 3,
    -- guifont = "monospace:h17",               -- the font used in graphical neovim applicati  ons
  }

  for k, v in pairs(options) do
    vim.opt[k] = v
  end
  vim.cmd "set whichwrap+=<,>,[,],h,l"
  vim.cmd [[set iskeyword+=-]]
  -- vim.cmd "colorscheme gruvbox"
  -- vim.cmd "set background=dark"
  -- vim.cmd ":imap ii <ESC>"

