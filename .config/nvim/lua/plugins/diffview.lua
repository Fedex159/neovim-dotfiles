return {
  "sindrets/diffview.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
    })
  end,
}
