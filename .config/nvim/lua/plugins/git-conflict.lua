return {
  "akinsho/git-conflict.nvim",
  event = { "BufReadPre", "BufNewFile" },
  version = "1.1.2",
  config = function()
    require("git-conflict").setup({
      highlights = {
        incoming = "DiffText",
        current = "DiffAdd",
      },
    })

    vim.api.nvim_set_hl(0, "DiffText", { fg = "#ffffff", bg = "#1d3b40" })
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#ffffff", bg = "#1d3450" })
  end,
}
