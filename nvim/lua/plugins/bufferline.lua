return {
    {
        "tiagovla/scope.nvim",
        lazy = false,
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                show_buffer_close_icons = false,
                show_close_icon = false,
                mode = "buffers",
                always_show_bufferline = true,
                indicator = {
                    style = "icon",
                    icon = "->",
                },
                numbers = "none",
                separator_style = { "", "" },
            },
        },
    },
}
