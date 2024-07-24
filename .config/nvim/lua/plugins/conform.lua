return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "prettier", "prettierd" },
      typescriptreact = { "prettier", "prettierd" },
      javascript = { "prettier", "prettierd" },
      javascriptreact = { "prettier", "prettierd" },

      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}
