require('neorg').setup {
    load = {
        ["core.ui"] = {},
        ["core.dirman"] = {},
        ["core.defaults"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.concealer"] = {
          config = {
            foldnestmax = true,
          }
        },
        ["core.dirman"] = {
            config = {
                use_popup = true,
                workspaces = {
                    work = "/mnt/onedrive/Empresa/ITLAB/",
                    main = "~/notes/main",
                    wiki = "/mnt/onedrive/Pessoal/WIKI",

                }
            }
        },
        -- ["core.ui.calendar"] = {},

    }
}
