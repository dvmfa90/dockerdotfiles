require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "vim", "query" }, -- add more languages as needed
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- Default text objects for functions and classes
        ["af"] = "@function.outer", -- select entire function
        ["if"] = "@function.inner", -- select inside function
        ["ac"] = "@class.outer",    -- select entire class
        ["ic"] = "@class.inner",    -- select inside class

        -- Add support for if statements and loops
        ["al"] = "@loop.outer",        -- select entire loop (for, while, etc.)
        ["il"] = "@loop.inner",        -- select inside loop
        ["ai"] = "@conditional.outer", -- select entire if/else block
        ["ii"] = "@conditional.inner", -- select inside if/else block
      },
    },
  },
}


