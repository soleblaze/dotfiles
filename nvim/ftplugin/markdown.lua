if not vim.g.vscode then
  vim.opt.spell = true
  local _, cmp = pcall(require, "cmp")
  cmp.setup({ enabled = false })
end
