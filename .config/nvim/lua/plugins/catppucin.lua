return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  commit = "e762a47478377612e59f01aa51db961f605c9aa4",
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
            ["@tag.attribute.javascript"] = { fg = cp.mauve, style = { "italic" } },
            ["@_jsx_attribute.javascript"] = { fg = cp.mauve, style = { "italic" } },
            ["@tag.builtin"] = { fg = cp.mauve },
          }
        end,
      },
    })
  end,
}
