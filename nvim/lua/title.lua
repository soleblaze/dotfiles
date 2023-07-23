local project_env = vim.env.PROJECT

if project_env and project_env ~= '' then
  vim.opt.titlestring = "[" .. project_env .. "] %{fnamemodify(expand('%:p'), ':~')} - NVIM"
else
  vim.opt.titlestring = "%{fnamemodify(expand('%:p'), ':~')} - NVIM"
end

vim.opt.title = true
