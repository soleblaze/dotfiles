local wk = require('which-key')

wk.register({
}, {
  name = "Go",
  T = {
    name = "+Test",
    A = { "<cmd>GoAddAllTest<cr>", "Add all tests" },
    a = { "<cmd>GoAddTest<cr>", "Add test" },
    b = { "<cmd>GoTestBench<cr>", "Test benchmark" },
    c = { "<cmd>GoTestCov<cr>", "Test coverage" },
    e = { "<cmd>GoAddExpTest<cr>", "Add tests to exported" },
    r = { "<cmd>GoTestR<cr>", "Test repeat" },
    t = { "<cmd>GoTest<cr>", "Test" },
  },
  a = { "<cmd>GoAddTag<cr>", "Add tag" },
  b = { "<cmd>GoBuild<cr>", "Build" },
  c = { "<cmd>GoCmt<cr>", "Comment" },
  d = { "<cmd>GoDoc<cr>", "Doc" },
  f = { "<cmd>GoFillStruct<cr>", "Fill struct" },
  o = { "<cmd>GoPkgOutline<cr>", "Outline" },
  r = { "<cmd>GoRun<cr>", "Run" },
  s = { "<cmd>GoAltS<cr>", "Alternate split" },
  t = {
    name = "+Tags",
    a = { "<cmd>GoAddTag<cr>", "Add tag" },
    c = { "<cmd>GoClearTag<cr>", "Clear tag" },
    r = { "<cmd>GoRmTag<cr>", "Remove tag" },
  },
  v = { "<cmd>GoAltV<cr>", "Alternate vsplit" },
  mode = "n",
}, { prefix = "<leader>G" })


local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
