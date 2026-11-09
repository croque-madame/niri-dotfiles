return {
    "peik-etzell/persist-theme.nvim",
    config = function()
        require("persist-theme").setup({
            file_path = vim.fn.stdpath("state") .. "/persisted_theme",
            default_colorscheme = nil,
        })
    end,
}
