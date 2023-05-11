-- map functions
if not vim.g.vscode then
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end

  map("n", "<leader>Ga", "<cmd>GoAlt<cr>")
  map("n", "<leader>Gb", "<cmd>GoBuild<cr>")
  map("n", "<leader>Gcc", "<cmd>GoCmt<cr>")
  map("n", "<leader>Gct", "<cmd>GoCoverage<cr>")
  map("n", "<leader>Gd", "<cmd>GoDoc<cr>")
  map("n", "<leader>Gf", "<cmd>GoFillStruct<cr>")
  map("n", "<leader>Go", "<cmd>GoPkgOutline<cr>")
  map("n", "<leader>Gr", "<cmd>GoRun<cr>")
  map("n", "<leader>Gs", "<cmd>GoAltS<cr>")
  map("n", "<leader>Gta", "<cmd>GoAddTag<cr>")
  map("n", "<leader>Gtc", "<cmd>GoClearTag<cr>")
  map("n", "<leader>Gtd", "<cmd>GoModeTidy<cr>")
  map("n", "<leader>Gte", "<cmd>GoAddExpTest<cr>")
  map("n", "<leader>Gtn", "<cmd>GoAddTest<cr>")
  map("n", "<leader>Gtr", "<cmd>GoRmTag<cr>")
  map("n", "<leader>Gtt", "<cmd>GoTest<cr>")
  map("n", "<leader>Gv", "<cmd>GoAltV<cr>")

  local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require('go.format').goimport()
    end,
    group = format_sync_grp,
  })
end
