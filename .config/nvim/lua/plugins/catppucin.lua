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
      highlight_overrides = {
        mocha = function(cp)
          return {
            ["@tag"] = { fg = cp.lavender },
            ["@tag.attribute.tsx"] = { fg = cp.mauve, style = { "italic" } },
            ["@tag.builtin"] = { fg = cp.mauve },
          }
        end,
      },
    })
  end,
}
