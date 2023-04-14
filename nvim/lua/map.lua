local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- neoclip
map("n", "<leader>n", "<cmd>Telescope neoclip<cr>")

-- Resize windows
map("n", "<Left>", "<cmd>5winc <<cr>")
map("n", "<Right>", "<cmd>5winc ><cr>")

-- treeTS
map("n", "gm", "<cmd>TSJToggle<cr>")
map("n", "gs", "<cmd>TSJSplit<cr>")
map("n", "gj", "<cmd>TSJJoin<cr>")

-- barbar
map("n", "<C-n>", "<cmd>BufferNext<cr>")
map("n", "<C-p>", "<cmd>BufferPrevious<cr>")
map("n", "<leader>a", "<cmd>BufferPick<cr>")
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>")

-- git signs
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')

-- hop
map('x', 's', "<cmd>HopChar1<cr>")
map('v', 's', "<cmd>HopChar1<cr>")

-- other
map("i", "<F7>", "<C-o><cmd>set spell!<cr>")
map("i", "<F8>", "<C-o><cmd>set list!<cr>")
map("i", "<F9>", '<C-o><cmd>lua require"toggle-cmp".toggle_completion()<cr>')
map("n", "<C-s>", "<cmd>w<cr>")
map("n", "<F7>", "<cmd>set spell!<cr>")
map("n", "<F8>", "<cmd>set list!<cr>")
map("n", "<F9>", '<cmd>lua require"toggle-cmp".toggle_completion()<cr>')
map("n", "<leader>'", "<C-w>s")
map("n", "<leader>;", "<C-w>v")
map("n", "<leader>P", '"+P')
map("n", "<leader>p", '"+p')
map("n", "ZZ", "<cmd>wqa!<cr>")
map("n", "[l", "<cmd>lprevious<CR>")
map("n", "[q", "<cmd>cprevious<CR>")
map("n", "[t", "<cmd>tprevious<CR>")
map("n", "]l", "<cmd>lnext<CR>")
map("n", "]q", "<cmd>cnext<CR>")
map("n", "]t", "<cmd>tnext<CR>")
map("v", "<C-s>", "<Esc><cmd>w<cr>")
map("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- tmux navigator
map("n", "<C-h>", '<cmd>NavigatorLeft<cr>')
map("n", "<C-l>", '<cmd>NavigatorRight<cr>')
map("n", "<C-k>", '<cmd>NavigatorUp<cr>')
map("n", "<C-j>", '<cmd>NavigatorDown<cr>')

-- refactoring
map("v", "<leader>re", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>")
map("v", "<leader>re", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>")
map("v", "<leader>rf", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>")
map("v", "<leader>ri", "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>")
map("v", "<leader>rr", "<Cmd>lua require('refactoring').select_refactor()<CR>")
map("v", "<leader>rv", "<Cmd>lua require('refactoring').debug.print_var({})<CR>")
map("v", "<leader>rv", "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>")

-- yank
map("v", "<leader>y", ":OSCYankVisual<cr>")
map("n", "<leader>y", "<Plug>OSCYankOperator", { noremap = false })

-- neotest
map("n", "[t", '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>')
map("n", "]t", '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>')

-- glow
map("n", "<leader>m", "<cmd>Glow<cr>")
map("n", "<C-w>z", "<C-w>|<C-w>_")


-- LSP
map("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float()<CR>')
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>")

-- trouble
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- dasht
map("n", "<leader><leader>K", ":Dasht!<Space>")
map("n", "<leader><leader>k", ":call Dasht(dasht#cursor_search_terms(), '!')<CR>")
map("n", "<leader>K", ":Dasht<Space>")
map("n", "<leader>k", ":call Dasht(dasht#cursor_search_terms())<CR>")
map("v", "<leader><leader>k", "y:<C-U>call Dasht(getreg(0), '!' )<CR>")
map("v", "<leader>k", "y:<C-U>call Dasht(getreg(0))<CR>")

-- Which Key Mappings
local wk = require("which-key")
wk.register({
  b = {
    name = "+Buffer",
    p = { "<cmd>BufferPin<cr>", "Pin" },
    c = { "<cmd>BufferClose<cr>", "Close" },
    d = { "<cmd>BufferPickDelete<cr>", "Pick Delete" },
    f = { "<cmd>bdelete!<cr>", "Force Delete Buffer" },
    r = { "<cmd>BufferRestore<cr>", "Restore" },
    s = {
      b = { "<cmd>BufferOrderByBufferNumber<cr>", "Order By Number" },
      d = { "<cmd>BufferOrderByDirectory<cr>", "Order By Directory" },
      l = { "<cmd>BufferOrderByLanguage<cr>", "Order By Language" },
      w = { "<cmd>BufferOrderByWindowNumber<cr>", "Order By Window Number" },
    }
  },
  c = {
    name = "+ChatGPT",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
    c = { '<cmd>ChatGPT<cr>', "ChatGPT" },
    d = { '<cmd>ChatGPTRun docstring<cr>', "DocString" },
    e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    f = { '<cmd>ChatGPTRun fix_bugs<cr>', "Fix Bugs" },
    g = { '<cmd>ChatGPTRun grammer_correction<cr>', "Grammer Correction" },
    i = { '<cmd>ChatGPTRun edit_with_instructions<cr>', "Edit with Instructions" },
    k = { '<cmd>ChatGPTRun keywords<cr>', "Keywords" },
    o = { '<cmd>ChatGPTRun optimize_code<cr>', "Optimize Code" },
    r = { '<cmd>ChatGPTRun roxygen_edit<cr>', "Roxygen Edit" },
    s = { '<cmd>ChatGPTRun summarize<cr>', "Summarize" },
    t = { '<cmd>ChatGPTRun add_tests<cr>', "Add Tests" },
  },
  d = {
    name = "+Diff",
    b = { '<cmd>Telescope advanced_git_search diff_branch_file<cr>', "Diff Git Branch" },
    C = { '<cmd>lua require("telescope").extensions.diff.diff_files({ hidden = true })<cr>', "Compare 2 files" },
    c = { '<cmd>lua require("telescope").extensions.diff.diff_current({ hidden = true })<cr>',
      "Compare file with current" },
    l = { '<cmd>Telescope advanced_git_search diff_commit_line<cr>', "Diff Commit Lines" },
    f = { '<cmd>Telescope advanced_git_search diff_commit_file<cr>', "Diff commit Files" },
  },
  f = {
    name = "+Telescope",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diags" },
    f = { "<cmd>Telescope find_files<cr>", "FindFiles" },
    g = { "<cmd>Telescope live_grep<cr>", "LiveGrep" },
    h = { "<cmd>Telescope help_tags<cr>", "HelpTags" },
    i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "FindInBuffer" },
    j = { "<cmd>Telescope jumplist<cr>", "JumpList" },
    l = { "<cmd>Telescope loclist<cr>", "LocList" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    y = { "<cmd>Telescope yaml_schema<cr>", "YamlSchema" }
  },
  g = {
    name = "+Git",
    B = { '<cmd>Telescope advanced_git_search changed_on_branch<cr>', "List changes on current branch" },
    L = { '<cmd>Telescope advanced_git_search search_log_content<cr>', "Search all commits" },
    D = { '<cmd>Gitsigns diffthis ~ split=botright<CR>', "Diff File" },
    R = { '<cmd>lua require("gitsigns").reset_buffer()<CR>', "Reset Buffer" },
    S = { '<cmd>lua require("gitsigns").stage_buffer()<CR>', "Stage Buffer" },
    U = { '<cmd>lua require("gitsigns").reset_buffer_index()<CR>', "Reset Buffer Index", },
    b = { '<cmd>lua require("gitsigns").blame_line{full=true}<CR>', "Blame Line" },
    c = { "<cmd>lua require('neogit').open({'commit'})<cr>", "Neogit Commit" },
    d = { '<cmd>Gitsigns diffthis split=botright<CR>', "Diff This" },
    f = { '<cmd>Telescope advanced_git_search search_log_content_file<cr>', "Search commits on file" },
    l = {
      name = "+Linker",
      u = { '<cmd>lua require"gitlinker".get_repo_url()<cr>', "RepoUrl" },
      b = {
        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        "OpenLine",
      },
      r = {
        '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        "OpenRepo",
      },
      l = { "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>", "LineUrl" },
    },
    n = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
    p = { '<cmd>lua require("gitsigns").preview_hunk()<CR>', "Preview Hunk" },
    r = { '<cmd>lua require("gitsigns").reset_hunk()<CR>', "Reset Hunk" },
    s = { '<cmd>lua require("gitsigns").stage_hunk()<CR>', "Stage Hunk" },
    t = {
      d = { '<cmd>Gitsigns toggle_deleted<CR>', "Toggle Deleted" },
      b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', "Toggle Current Line Blame" },
    },
    u = { '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', "Undo Hunk Stage" },
  },
  L = { "<cmd>HopLineStart<cr>", "HopLineStart" },
  l = {
    name = "+LSP",
    c = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "Code Action" },
    h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature Help" },
    d = { '<cmd>Telescope lsp_type_definitions<CR>', "Type Definitions" },
    f = { '<cmd>lua vim.lsp.buf.format()<CR>', "Format" },
    o = { '<cmd>Telescope lsp_document_symbols<CR>', "Document Symbols" },
    q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', "Location List" },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', "Rename" },
  },
  o = {
    name = "+Octo",
    a = { "<cmd>Octo actions<cr>", "List Actions" },
    c = { "<cmd>Octo comment add<cr>", "Add Comment" },
    d = { "<cmd>Octo comment delete<cr>", "Delete Comment" },
    p = {
      name = "+PR",
      a = { "<cmd>Octo pr checks<cr>", "Show PR Checks" },
      b = { "<cmd>Octo pr browser<cr>", "Open PR in Browser" },
      C = { "<cmd>Octo pr create<cr>", "Create PR" },
      c = { "<cmd>Octo pr changes<cr>", "Show PR Changes" },
      d = { "<cmd>Octo pr diff<cr>", "Show PR Diffs" },
      l = { "<cmd>Octo pr list<cr>", "List PRs" },
      r = { "<cmd>Octo pr ready<cr>", "Mark PR Ready" },
      u = { "<cmd>Octo pr url<cr>", "Copy PR URL to clipboard" },
    },
    r = {
      name = "+Review",
      R = { "<cmd>Octo review resume<cr>", "Resume Review" },
      C = { "<cmd>Octo pr checkout<cr>", "Checkout PR" },
      c = { "<cmd>Octo review commit<cr>", "Choose a commit" },
      n = { "<cmd>Octo review start<cr>", "Start Review" },
      s = { "<cmd>Octo review submit<cr>", "Submit Review" },
      r = { "<cmd>Octo thread resolve<cr>", "Mark thread resolved" },
      t = { "<cmd>Octo review comments<cr>", "View pending comments" },
      u = { "<cmd>Octo thread unresolve<cr>", "Mark thread unresolved" },
      x = { "<cmd>Octo review close<cr>", "Close Review" },
    },
    u = { "<cmd>Octo repo url<cr>", "Copy repo url to clipboard" },
  },
  t = {
    name = "+NeoTest",
    a = { '<cmd>lua require("neotest").run.attach()<CR>', "Attach" },
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "CurrentFile" },
    d = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', "DAP" },
    e = { '<cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>', "Everything" },
    l = { '<cmd>lua require("neotest").run.run_last()<CR>', "Last" },
    n = { '<cmd>lua require("neotest").run.run()<CR>', "Run" },
    o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "Output" },
    s = { '<cmd>lua require("neotest").summary.toggle()<CR>', "Summary" },
    x = { '<cmd>lua require("neotest").run.stop()<CR>', "Stop" },
  },
  r = {
    name = "+Refactor",
    b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
    c = { "<cmd>lua require('refactoring').debug.cleanup({})<CR>", "Debug Cleanup" },
    f = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File" },
    i = { "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Var" },
    p = { "<cmd>lua require('refactoring').debug.printf({below = false})<CR>", "Debug" },
    r = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Telescope" },
    v = { "<cmd>lua require('refactoring').debug.print_var({ normal = true })<CR>", "Debug Print Var" },
  },
  s = { "<cmd>HopChar1<cr>", "HopChar 1" },
  w = {
    name = "+Window",
    o = { "<C-w>o", "Close Other Windows" },
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    x = { "<cmd>close<cr>", "Close" }
  },
  x = {
    name = "+Trouble",
    c = { "<cmd>TroubleClose<cr>", "Close" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "DocDiag" },
    l = { "<cmd>Trouble loclist<cr>", "LocList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "WorkSpaceDiag" },
    x = { "<cmd>Trouble<cr>", "Trouble" },
  },
  Y = {
    name = "+Yaml",
    k = { "<cmd>YAMLYankKey<cr>", "YankKey" },
    l = { "<cmd>YAMLView<cr>", "View" },
    q = { "<cmd>YAMLQuickfix<cr>", "QuickFix" },
    t = { "<cmd>YAMLTelescope<cr>", "Telescope" },
    v = { "<cmd>YAMLYankValue<cr>", "YankValue" },
    y = { "<cmd>YAMLYank<cr>", "Yank" },
  },
  ["/"] = { "<cmd>HopPattern<cr>", "HopPattern" },
}, { prefix = "<leader>" })

wk.register({
  c = {
    name = "+ChatGPT",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
    d = { '<cmd>ChatGPTRun docstring<cr>', "DocString" },
    e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    f = { '<cmd>ChatGPTRun fix_bugs<cr>', "Fix Bugs" },
    g = { '<cmd>ChatGPTRun grammer_correction<cr>', "Grammer Correction" },
    i = { '<cmd>ChatGPTRun edit_with_instructions<cr>', "Edit with Instructions" },
    k = { '<cmd>ChatGPTRun keywords<cr>', "Keywords" },
    o = { '<cmd>ChatGPTRun optimize_code<cr>', "Optimize Code" },
    r = { '<cmd>ChatGPTRun roxygen_edit<cr>', "Roxygen Edit" },
    s = { '<cmd>ChatGPTRun summarize<cr>', "Summarize" },
    t = { '<cmd>ChatGPTRun add_tests<cr>', "Add Tests" },
  },
}, {
  prefix = "<leader>",
  mode = "v",
})
