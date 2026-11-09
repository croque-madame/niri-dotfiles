return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        { "folke/snacks.nvim", version = "*" },
    },
    ft = "python",
    opts = {
        options = {},
        search = {},
    },
    config = function(_, opts)
        require("venv-selector").setup(opts)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "python",
            callback = function(ev)
                vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", {
                    buffer = ev.buf,
                    desc = "Select VEnv",
                })
            end,
        })
    end,
}
