return {
  "akinsho/git-conflict.nvim",
  event = { "BufReadPre", "BufNewFile" },
  version = "2.0.0",
  config = function()
    require("git-conflict").setup({
      default_mappings = true,
      default_commands = true,
      disable_diagnostics = false,
      debug = false,
      list_opener = "copen",
      highlights = {
        incoming = "DiffText",
        current = "DiffAdd",
      },
    })

    vim.api.nvim_set_hl(0, "DiffText", { fg = "#ffffff", bg = "#1d3b40" })
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#ffffff", bg = "#1d3450" })
  end,
}
