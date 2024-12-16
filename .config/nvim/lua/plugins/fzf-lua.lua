local config = require("fzf-lua.config")
local actions = require("fzf-lua.actions")

config.defaults.actions.files["ctrl-w"] = actions.file_tabedit

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
}
