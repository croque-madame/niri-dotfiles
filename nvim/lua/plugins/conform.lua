return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            cpp = { "clang-format" },
            c = { "clang-format" },
            tex = { "latexindent" },
            markdown = { "prettier" },
            html = { "prettier" },
            htmldjango = { "djlint" },
            css = { "prettier" },
            python = { "black" },
        },
    },
}
