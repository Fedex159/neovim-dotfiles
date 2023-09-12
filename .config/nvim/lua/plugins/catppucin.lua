return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      kitty = false,
      color_overrides = {
        mocha = {
          base = "#1F2430",
          mantle = "#1F2430",
          crust = "#000000",
        },
      },
    })
  end,
}
