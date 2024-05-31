return {
  "neovim/nvim-lspconfig",
  version = "*",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      tsserver = {
        enabled = false,
      },
      vtsls = {
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
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
            function()
              require("vtsls").commands.organize_imports(0)
            end,
            desc = "Organize Imports",
          },
          {
            "<leader>cM",
            function()
              require("vtsls").commands.add_missing_imports(0)
            end,
            desc = "Add missing imports",
          },
          {
            "<leader>cu",
            function()
              require("vtsls").commands.remove_unused_imports(0)
            end,
            desc = "Remove unused imports",
          },
          {
            "<leader>cD",
            function()
              require("vtsls").commands.fix_all(0)
            end,
            desc = "Fix all diagnostics",
          },
          {
            "<leader>cV",
            function()
              require("vtsls").commands.select_ts_version(0)
            end,
            desc = "Select TS workspace version",
          },
        },
      },
    },
    setup = {
      tsserver = function()
        -- disable tsserver
        return true
      end,
      vtsls = function(_, opts)
        -- copy typescript settings to javascript
        opts.settings.javascript =
          vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
        local plugins = vim.tbl_get(opts.settings, "vtsls", "tsserver", "globalPlugins")
        -- allow plugins to have a key for proper merging
        -- remove the key here
        if plugins then
          opts.settings.vtsls.tsserver.globalPlugins = vim.tbl_values(plugins)
        end
      end,
    },
  },
}
