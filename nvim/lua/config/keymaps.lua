-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Render Markdown Toggle
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        Snacks.toggle({
            name = "Markdown Rendering",
            get = function()
                return vim.b[ev.buf].render_markdown_enabled ~= false
            end,
            set = function(state)
                local m = require("render-markdown")
                if state then
                    m.buf_enable()
                    vim.b[ev.buf].render_markdown_enabled = true
                else
                    m.buf_disable()
                    vim.b[ev.buf].render_markdown_enabled = false
                end
            end,
        }):map("<leader>um", { buffer = ev.buf })
    end,
})
-- Black hole paste, overwrite visual section with pasted
vim.keymap.set("x", "p", [["_dP]])

-- Disable Ctrl-z suspend
vim.keymap.set({ "n", "v", "i" }, "<C-z>", "<Nop>", { silent = true })
