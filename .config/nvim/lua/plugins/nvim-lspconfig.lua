return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      vtsls = {
        handlers = {
          ["textDocument/definition"] = function(err, result, ...)
            result = vim.islist(result) and result[1] or result
            vim.lsp.handlers["textDocument/definition"](err, result, ...)
          end,
        },
        keys = {
          {
            "gd",
            function()
              vim.lsp.buf.definition()
            end,
            desc = "Goto Source Definition",
          },
          {
            "gr",
            function()
              require("telescope.builtin").lsp_references({ show_line = false })
            end,
            desc = "File References",
          },
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
          {
            "<leader>cM",
            LazyVim.lsp.action["source.addMissingImports.ts"],
            desc = "Add missing imports",
          },
          {
            "<leader>cu",
            LazyVim.lsp.action["source.removeUnused.ts"],
            desc = "Remove unused imports",
          },
          {
            "<leader>cD",
            LazyVim.lsp.action["source.fixAll.ts"],
            desc = "Fix all diagnostics",
          },
          {
            "<leader>cV",
            function()
              LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
            end,
            desc = "Select TS workspace version",
          },
        },
      },
    },
  },
}
