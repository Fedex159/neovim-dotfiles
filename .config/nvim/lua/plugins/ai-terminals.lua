return {
  "aweis89/ai-terminals.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    { "<C-h>", "<cmd>lua require('ai-terminals').toggle('cursor')<cr>", mode = { "n", "v" }, desc = "Ai Toggle Chat" },
  },
  opts = {
    backend = "tmux",
    auto_terminal_keymaps = {
      prefix = "<leader>a",
      terminals = {
        { name = "cursor", key = "i" },
      },
    },
  },
  config = function(_, opts)
    require("ai-terminals").setup(opts)
    local sa = require("ai-terminals.snacks_actions")
    sa.apply(require("snacks").config)
  end,
}
