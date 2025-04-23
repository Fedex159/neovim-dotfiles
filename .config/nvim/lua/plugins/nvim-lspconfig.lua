return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      vtsls = {
        keys = {
          {
            "gd",
            function()
              local function on_list(options)
                vim.fn.setqflist({}, " ", options)
                vim.cmd.cfirst()
              end

              vim.lsp.buf.definition({ on_list = on_list })
            end,
            desc = "Goto Source Definition",
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
