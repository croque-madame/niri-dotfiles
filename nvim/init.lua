require("config.lazy")
vim.o.shell = "bash"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
    aux_dir = "aux",
    out_dir = "out",
}
vim.opt.scrolloff = 15
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
