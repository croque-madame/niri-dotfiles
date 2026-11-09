return {
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                header = [[
███████╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗
██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║
█████╗  ███████╗   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║
██╔══╝  ╚════██║   ██║   ██╔══██╗╚██████╔╝╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗███████║   ██║   ██║  ██║ ╚═██╔═╝  ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ██████╗   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                    ╚██╔═╝                        
                                     ╚═╝                          
        ]],
                keys = {
                    { icon = "󰱽 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = "󱩾 ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = "󱋢 ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "s",
                        desc = "Restore Session",
                        action = ":lua require('persistence').select()",
                    },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = "󱐥 ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                    {
                        icon = " ",
                        key = "p",
                        desc = "Projects",
                        action = function()
                            Snacks.picker.projects()
                        end,
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
    end,
}
