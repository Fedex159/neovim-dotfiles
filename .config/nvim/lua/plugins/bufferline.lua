return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
      always_show_bufferline = true,
      color_icons = true,
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      indicator = {
        style = "icon",
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
