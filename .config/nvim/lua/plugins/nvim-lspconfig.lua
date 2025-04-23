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
    setup = {
      tailwindcss = function(_, opts)
        local tw = LazyVim.lsp.get_raw_config("tailwindcss")
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, tw.default_config.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        -- Additional settings
        opts.settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "tw`([^`]*)", -- tw`...`
                "tw\\.[^`]+`([^`]*)`", -- tw.xxx<xxx>`...`
                "tw\\(.*?\\).*?`([^`]*)", -- tw(Component)<xxx>`...`
                "clsx`([^`]*)`",
              },
            },
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
            },
          },
        }

        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,
    },
  },
}
