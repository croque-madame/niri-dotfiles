return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_imaps_enabled = 0
    end,
    config = function()
        -- Register the localleader prefix with Which-Key
        require("which-key").add({
            { "<localleader>l", group = "VimTeX" },
        })
    end,
}
