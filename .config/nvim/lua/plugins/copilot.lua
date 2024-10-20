local prompts = {
  Explain = "Por favor, explica cómo funciona el siguiente código.",
  Review = "Por favor, revisa el siguiente código y proporciona sugerencias para mejorarlo.",
  Tests = "Por favor, explica cómo funciona el código seleccionado y luego genera pruebas unitarias para él.",
  Refactor = "Por favor, refactoriza el siguiente código para mejorar su claridad y legibilidad.",
  FixCode = "Por favor, corrige el siguiente código para que funcione como se pretende.",
  FixError = "Por favor, explica el error en el siguiente texto y proporciona una solución.",
  BetterNamings = "Por favor, proporciona mejores nombres para las siguientes variables y funciones.",
  Documentation = "Por favor, proporciona documentación para el siguiente código.",
  JsDocs = "Por favor, proporciona JsDocs para el siguiente código.",
  DocumentationForGithub = "Por favor, proporciona documentación para el siguiente código lista para GitHub usando markdown.",
  CreateAPost = "Por favor, proporciona documentación para el siguiente código para publicarlo en redes sociales, como LinkedIn. Debe set profunda, bien explicada y fácil de entender. También hazlo de manera divertida y atractiva.",
  SwaggerApiDocs = "Por favor, proporciona documentación para la siguiente API usando Swagger.",
  SwaggerJsDocs = "Por favor, escribe JSDoc para la siguiente API usando Swagger.",
  Summarize = "Por favor, resume el siguiente texto.",
  Spelling = "Por favor, corrige cualquier error gramatical y ortográfico en el siguiente texto.",
  Wording = "Por favor, mejora la gramática y redacción del siguiente texto.",
  Concise = "Por favor, reescribe el siguiente texto para hacerlo más conciso.",
}

return {
  {
    "zbirenbaum/copilot.lua",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C-\\>",
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      prompts = prompts,
      auto_follow_cursor = false,
      show_help = false,
      mappings = {
        complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" },
        close = { normal = "q", insert = "<C-c>" },
        reset = { normal = "<C-x>", insert = "<C-x>" },
        submit_prompt = { normal = "<CR>", insert = "<C-CR>" },
        accept_diff = { normal = "<C-y>", insert = "<C-y>" },
        yank_diff = { normal = "gmy" },
        show_diff = { normal = "gmd" },
        show_system_prompt = { normal = "gmp" },
        show_user_selection = { normal = "gms" },
        show_help = { normal = "gmh" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      -- Set default selection method
      opts.selection = select.unnamed

      -- Define custom prompts for commit messages
      opts.prompts.Commit = {
        prompt = "Write commit message for the change with commitizen convention",
        selection = select.gitdiff,
      }
      opts.prompts.CommitStaged = {
        prompt = "Write commit message for the change with commitizen convention",
        selection = function(source)
          return select.gitdiff(source, true)
        end,
      }

      -- Setup Copilot Chat with the provided options
      chat.setup(opts)
      require("CopilotChat.integrations.cmp").setup()

      -- Create user commands for different chat modes
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      -- Set buffer-specific options when entering Copilot buffers
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>ah",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      { "<leader>av", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
      { "<leader>ax", ":CopilotChatInline<cr>", mode = "x", desc = "CopilotChat - Inline chat" },
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      { "<leader>am", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Generate commit message for all changes" },
      {
        "<leader>aM",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "CopilotChat - Generate commit message for staged changes",
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
      { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
    },
  },
}
