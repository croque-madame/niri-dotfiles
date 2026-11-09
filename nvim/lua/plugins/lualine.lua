return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
        require("lualine").setup({
            options = {
                disabled_filetypes = {
                    statusline = { "snacks_dashboard" },
                },
                theme = "auto",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "diagnostics" },
                lualine_y = { "venv-selector", "filetype" },
                lualine_z = {
                    function()
                        return " " .. os.date("%H:%M")
                    end,
                },
            },
        })
    end,
}
