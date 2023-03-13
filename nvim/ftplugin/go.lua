-- map functions
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>b", "<cmd>GoBuild<cr>")
map("n", "<leader>c", '<cmd>lua require"go.lsp".telescope_code_actions()<CR>', opts)
map("n", "<leader>ga", "<cmd>GoAlt<cr>")
map("n", "<leader>gcc", "<cmd>GoCmt<cr>")
map("n", "<leader>gct", "<cmd>GoCoverage<cr>")
map("n", "<leader>gd", "<cmd>GoDoc<cr>")
map("n", "<leader>gf", "<cmd>GoFillStruct<cr>")
map("n", "<leader>gs", "<cmd>GoAltS<cr>")
map("n", "<leader>gta", "<cmd>GoAddTag<cr>")
map("n", "<leader>gtc", "<cmd>GoClearTag<cr>")
map("n", "<leader>gtd", "<cmd>GoModeTidy<cr>")
map("n", "<leader>gte", "<cmd>GoAddExpTest<cr>")
map("n", "<leader>gtn", "<cmd>GoAddTest<cr>")
map("n", "<leader>gtr", "<cmd>GoRmTag<cr>")
map("n", "<leader>gv", "<cmd>GoAltV<cr>")
map("n", "<leader>ru", "<cmd>GoRun<cr>")
map("n", "<leader>tg", "<cmd>GoTest<cr>")

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
