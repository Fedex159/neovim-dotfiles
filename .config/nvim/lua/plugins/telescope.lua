return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<c-e>"] = require("telescope.actions").to_fuzzy_refine,
          ["<c-r>"] = require("telescope.actions").select_tab,
        },
      },
    },
  },
}
