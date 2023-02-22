local _unpack = unpack or table.unpack

local function highlight(group, keys, args)
  local result = table.concat(keys, '=%s ')
  local resultLength = string.len(result)
  local lastChar = string.sub(result, resultLength - 2)

  if (lastChar ~= '=%s') then
    result = result .. '=%s'
  end

  local color = string.format(result, _unpack(args))
  local cmd = string.format('highlight %s %s', group, color)
  vim.cmd(cmd)
end

return {
  highlight = highlight
}
