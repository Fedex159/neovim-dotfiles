return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
  -- stylua: ignore start
    keys[#keys + 1] = { "gr", "<cmd>lua require('telescope.builtin').lsp_references({ show_line=false })<cr>", desc = "References" }
    keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition", has = "definition" }
    -- stylua: ignore end
  end,
  opts = {
    servers = {
      tsserver = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            quotePreference = "double",
            includeCompletionsWithSnippetText = true,
            generateReturnInDocTemplate = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        settings = {
          format = false,
        },
      },
      eslint = {
        root_dir = require("lspconfig.util").root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json"
        ),
        settings = {
          format = {
            enable = false,
          },
          workingDirectory = { mode = "auto" },
        },
        handlers = {
          -- this error shows up occasionally when formatting
          -- formatting actually works, so this will supress it
          ["window/showMessageRequest"] = function(_, result)
            if result.message:find("ENOENT") then
              return vim.NIL
            end

            return vim.lsp.handlers["window/showMessageRequest"](nil, result)
          end,
        },
        setup = {
          eslint = function()
            require("lazyvim.util").lsp.on_attach(function(client)
              if client.name == "eslint" then
                client.server_capabilities.documentFormattingProvider = true
              elseif client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
              end
            end)
          end,
        },
      },
    },
  },
}
