-- LaTeX backtick pairing
vim.keymap.set("i", "`", "`'<Left>", { buffer = true, desc = "LaTeX `' pair" })

vim.keymap.set("i", "'", function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col(".")
    if line:sub(col, col) == "'" then
        return "<Right>"
    end
    return "'"
end, { buffer = true, expr = true, desc = "Skip over closing '" })
