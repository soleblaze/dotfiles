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


M.conceal = function()
  if vim.o.conceallevel ~= 0 then
    vim.o.conceallevel = 0
    vim.notify("conceal disabled")
  else
    vim.o.conceallevel = 2
    vim.notify("conceal enabled")
  end
end


local diagnostictoggle = true

M.diagnostic = function()
  if diagnostictoggle then
    vim.diagnostic.enable(false)
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

vim.api.nvim_create_autocmd({
  "BufWritePre",
}, {
  callback = function()
    if vim.g.autoFormat then
      vim.lsp.buf.format()
    end
  end,
})

vim.g.autoFormat = true

M.autoFormat = function()
  if vim.g.autoFormat then
    vim.g.autoFormat = false
    vim.notify("autoFormat disabled")
  else
    vim.g.autoFormat = true
    vim.notify("autoFormat enabled")
  end
end

vim.g.cmp_toggle = false

M.cmp = function()
  local ok, cmp = pcall(require, "cmp")
  if ok then
    local next_cmp_toggle = not vim.g.cmp_toggle
    if next_cmp_toggle then
      print("completion on")
    else
      print("completion off")
    end
    cmp.setup({
      enabled = function()
        vim.g.cmp_toggle = next_cmp_toggle
        if next_cmp_toggle then
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        else
          return next_cmp_toggle
        end
      end,
    })
  else
    print("completion not available")
  end
end

return M
