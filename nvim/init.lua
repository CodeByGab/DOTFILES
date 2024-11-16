local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.number = true

require("options")
require("lazy").setup("plugins")

local time = os.date("*t")
if time.hour <= 9 or time.hour >= 18 then
  vim.cmd.colorscheme("catppuccin-macchiato")
else
  vim.o.background = "light"
  vim.cmd([[colorscheme gruvbox]])
end
