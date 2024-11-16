return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*",

      -- Available modes: foreground, background
    })
  end,
}
