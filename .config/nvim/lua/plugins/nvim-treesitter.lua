return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "json",
        "css",
        "html",
        "lua",
        "typescript",
        "javascript",
        "markdown",
        "markdown_inline",
      })
    end
  end,
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
