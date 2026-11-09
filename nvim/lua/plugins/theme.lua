return {
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        main = "everforest",
        config = function()
            require("everforest").setup({
                background = "soft",
                transparent_background_level = 2,
                dim_inactive_windows = false,
                disable_italic_comments = false,
            })
        end,
    },

    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            nord_disable_background = true,
        },
        config = function(_, opts) end,
    },

    {
        "tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
}
