return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        explorer = {
            -- your explorer configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        picker = {
            sources = {
                explorer = {
                    win = {
                        list = {
                            wo = {
                                number = true,
                                relativenumber = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
