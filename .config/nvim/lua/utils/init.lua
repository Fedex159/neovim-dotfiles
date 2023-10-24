local Util = require("lazyvim.util")

---@param opts? {addCwd?:boolean, disableEsc?:boolean}
local getTermOpts = function(opts)
  local termOpts = {
    border = "rounded",
    margin = { bottom = 2 },
  }

  if opts and opts.addCwd then
    termOpts.cwd = Util.root.get()
  end

  if opts and opts.disableEsc then
    termOpts.esc_esc = false
  end

  return termOpts
end

return {
  getTermOpts = getTermOpts,
}
