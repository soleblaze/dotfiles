local M = {}

M.quickfix = function()
  for _, info in ipairs(vim.fn.getwininfo()) do
    if info.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end

  if next(vim.fn.getqflist()) == nil then
    print("quickfix list empty")
    return
  end
  vim.cmd("copen")
end

M.location = function()
  for _, info in ipairs(vim.fn.getwininfo()) do
    if info.loclist == 1 then
      vim.cmd("lclose")
      return
    end
  end

  if next(vim.fn.getloclist(0)) == nil then
    vim.notify("location list empty")
    return
  end
  vim.cmd("lopen")
end


M.relativenumber = function()
  if vim.o.relativenumber then
    vim.o.relativenumber = false
    vim.notify("relativenumber disabled")
  else
    vim.o.relativenumber = true
    vim.notify("relativenumber enabled")
  end
end


local diagnostictoggle = true

M.diagnostic = function()
  if diagnostictoggle then
    vim.diagnostic.disable()
    vim.diagnostic.config({ virtual_text = false })
    diagnostictoggle = false
    vim.notify("diagnostic disabled")
  else
    vim.diagnostic.enable()
    vim.diagnostic.config({ virtual_text = true })
    diagnostictoggle = true
    vim.notify("diagnostic enabled")
  end
end

return M
