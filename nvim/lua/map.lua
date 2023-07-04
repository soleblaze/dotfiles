local wk = require('which-key')

wk.register({
  ["<C-a>"] = { function()
    vim.api.nvim_feedkeys(
      vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
  end, 'Accept Copilot', {
    silent = true, expr = true } },
  ["<C-s>"] = { '<Esc>l<Cmd>lua require("nvim-autopairs.fastwrap").show()<CR>', 'FastWrap' },
  ["<C-e>"] = { '<Plug>(copilot-dismiss)', 'Dismiss Copilot' },
  ["<C-n>"] = { '<Plug>(copilot-next)', 'Next Copilot Suggestion' },
  ["<C-p>"] = { '<Plug>(copilot-previous)', 'Previous Copilot Suggestion' },
  ["<F3>"] = { '<cmd>lua require("toggle").diagnostic()<cr>', 'Toggle diagnostics' },
  ["<F5>"] = { '<cmd>lua require("toggle").relativenumber()<cr>', 'Toggle relative number' },
  ["<F6>"] = { '<cmd>lua require("toggle").autoFormat()<cr>', 'Toggle auto format' },
  ["<F7>"] = { '<cmd>set spell!<cr>', 'Toggle Spell' },
  ["<F8>"] = { '<cmd>set list!<cr>', 'Toggle List' },
  ["<F4>"] = { '<cmd>lua require("toggle").cmp()<cr>', 'Toggle cmp' },
}, {
  mode = "i",
})

wk.register({
  ["<Esc>"] = { '<C-\\><C-n>', 'Escape Terminal Mode' },
}, {
  mode = "t"
})
wk.register({
  K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover Buffer' },
  ZZ = { '<cmd>wqa!<cr>', 'Save and Quit' },
  ["<C-;>"] = { '<C-w>s', "Split Horizontal" },
  ["<C-'>"] = { '<C-w>v', "Split Vertical" },
  ["<C-h>"] = { '<C-w>h', 'Split Left' },
  ["<C-j>"] = { '<C-w>j', 'Split Down' },
  ["<C-k>"] = { '<C-w>k', 'Split Up' },
  ["<C-l>"] = { '<C-w>l', 'Split Right' },
  ["<C-n>"] = { '<cmd>BufferNext<cr>', 'Next Buffer' },
  ["<C-p>"] = { '<cmd>BufferPrevious<cr>', 'Previous Buffer' },
  ["<F3>"] = { '<cmd>lua require("toggle").diagnostic()<cr>', 'Toggle diagnostics' },
  ["<F4>"] = { '<cmd>lua require("toggle").cmp()<cr>', 'Toggle cmp' },
  ["<F5>"] = { '<cmd>lua require("toggle").relativenumber()<cr>', 'Toggle relative number' },
  ["<F6>"] = { '<cmd>lua require("toggle").autoFormat()<cr>', 'Toggle auto format' },
  ["<F7>"] = { '<cmd>set spell!<cr>', 'Toggle Spell' },
  ["<F8>"] = { '<cmd>set list!<cr>', 'Toggle List' },
  ["<Left>"] = { '<cmd>5winc <<cr>', 'Shift Pane Left' },
  ["<Right>"] = { '<cmd>5winc ><cr>', 'Shift Pane Right' },
  ["["] = {
    c = { function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() require('gitsigns').prev_hunk() end)
      return '<Ignore>'
    end, 'Previous Hunk', { expr = true } },
    d = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', "Previous Diagnostic" },
    l = { '<cmd>lprevious<CR>', "Previous Location" },
    q = { '<cmd>cprevious<CR>', "Previous Quickfix" },
    t = { '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>', "Previous Test" },
  },
  [']'] = {
    c = { function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() require('gitsigns').next_hunk() end)
      return '<Ignore>'
    end, 'Next Hunk', { expr = true } },
    d = { '<cmd>lua vim.diagnostic.goto_next()<CR>', "Next Diagnostic" },
    l = { '<cmd>lnext<CR>', "Next Location" },
    q = { '<cmd>cnext<CR>', "Next Quickfix" },
    t = { '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>', "Next Test" },
  },
  g = {
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', "Declaration" },
    d = { '<cmd>Telescope lsp_definitions<CR>', "Definition" },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', "Implementation" },
    j = { '<cmd>TSJJoin<cr>', "Join" },
    m = { '<cmd>TSJToggle<cr>', "Toggle" },
    r = { '<cmd>Telescope lsp_references<CR>', "References" },
    s = { '<cmd>TSJSplit<cr>', "Split" },
  },
}, {
  mode = "n",
})

wk.register({
  a = {
    name = "+AI",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
    c = {
      name = "+Copilot",
      d = { '<CMD>Copilot disable<CR>', "Disable" },
      e = { '<CMD>Copilot enable<CR>', "Enable" },
      p = { '<CMD>Copilot panel<CR>', "Panel" },
      s = { '<CMD>Copilot status<CR>', "Status" },
      t = { '<cmd>CopilotToggle<cr>', "Toggle Copilot" },
    },
    d = { '<cmd>ChatGPTRun docstring<cr>', "DocString" },
    e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    f = { '<cmd>ChatGPTRun fix_bugs<cr>', "Fix Bugs" },
    g = { '<cmd>ChatGPTRun grammer_correction<cr>', "Grammer Correction" },
    i = { function() require("chatgpt").edit_with_instructions() end, "Edit with Instructions" },
    k = { '<cmd>ChatGPTRun keywords<cr>', "Keywords" },
    o = { '<cmd>ChatGPTRun optimize_code<cr>', "Optimize Code" },
    r = { '<cmd>ChatGPTRun code_readability_analysis<cr>', "Code Readability Analysis" },
    R = { '<cmd>ChatGPTRun roxygen_edit<cr>', "Roxygen Edit" },
    s = { '<cmd>ChatGPTRun summarize<cr>', "Summarize" },
    t = { '<cmd>ChatGPTRun add_tests<cr>', "Add Tests" },
  },
  h = {
    name = "+GitSigns",
    r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
  },
  y = { '"+y', 'Yank' },
}, {
  prefix = "<leader>",
  mode = "v",
})

wk.register({
  D = {
    name = "+Diff",
    b = { '<cmd>Telescope advanced_git_search diff_branch_file<cr>', "Diff Git Branch" },
    C = { '<cmd>lua require("telescope").extensions.diff.diff_files({ hidden = true })<cr>', "Compare 2 files" },
    c = { '<cmd>lua require("telescope").extensions.diff.diff_current({ hidden = true })<cr>',
      "Compare file with current" },
    l = { '<cmd>Telescope advanced_git_search diff_commit_line<cr>', "Diff Commit Lines" },
    f = { '<cmd>Telescope advanced_git_search diff_commit_file<cr>', "Diff commit Files" },
  },
  P = { '"+P', 'Paste' },
  ["1"] = { '<cmd>BufferGoto 1<CR>', "Buffer 1" },
  ["2"] = { '<cmd>BufferGoto 2<CR>', "Buffer 2" },
  ["3"] = { '<cmd>BufferGoto 3<CR>', "Buffer 3" },
  ["4"] = { '<cmd>BufferGoto 4<CR>', "Buffer 4" },
  ["5"] = { '<cmd>BufferGoto 5<CR>', "Buffer 5" },
  ["6"] = { '<cmd>BufferGoto 6<CR>', "Buffer 6" },
  ["7"] = { '<cmd>BufferGoto 7<CR>', "Buffer 7" },
  ["8"] = { '<cmd>BufferGoto 8<CR>', "Buffer 8" },
  ["9"] = { '<cmd>BufferGoto 9<CR>', "Buffer 9" },
  a = {
    name = "+AI",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
    c = {
      name = "+Copilot",
      d = { '<CMD>Copilot disable<CR>', "Disable" },
      e = { '<CMD>Copilot enable<CR>', "Enable" },
      p = { '<CMD>Copilot panel<CR>', "Panel" },
      s = { '<CMD>Copilot status<CR>', "Status" },
      t = { '<cmd>CopilotToggle<cr>', "Toggle Copilot" },
    },
    d = { '<cmd>ChatGPTRun docstring<cr>', "DocString" },
    e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    f = { '<cmd>ChatGPTRun fix_bugs<cr>', "Fix Bugs" },
    g = { '<cmd>ChatGPTRun grammer_correction<cr>', "Grammer Correction" },
    i = { function() require("chatgpt").edit_with_instructions() end, "Edit with Instructions" },
    k = { '<cmd>ChatGPTRun keywords<cr>', "Keywords" },
    o = { '<cmd>ChatGPTRun optimize_code<cr>', "Optimize Code" },
    r = { '<cmd>ChatGPTRun code_readability_analysis<cr>', "Code Readability Analysis" },
    R = { '<cmd>ChatGPTRun roxygen_edit<cr>', "Roxygen Edit" },
    s = { '<cmd>ChatGPTRun summarize<cr>', "Summarize" },
    t = { '<cmd>ChatGPTRun add_tests<cr>', "Add Tests" },
  },
  b = {
    name = "+Buffer",
    a = { "<cmd>Hbac toggle_autoclose<cr>", "Toggle Auto Close" },
    p = { "<cmd>Hbac toggle_pin<cr>", "Pin" },
    c = { "<cmd>close<cr>", "Close" },
    C = { "<cmd>Hbac close_unpinned<cr>", "Close Unpinned" },
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
  c = { "<cmd>close<cr>", "Close" },
  d = { '<cmd>bd<cr>', 'Close Buffer' },
  e = { '<cmd>lua vim.diagnostic.open_float()<CR>', "Open Float" },
  f = {
    name = "+Telescope",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diags" },
    f = { "<cmd>Telescope find_files<cr>", "FindFiles" },
    g = { "<cmd>Telescope live_grep<cr>", "LiveGrep" },
    h = { "<cmd>Telescope help_tags<cr>", "HelpTags" },
    i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find In Buffer" },
    j = { "<cmd>Telescope jumplist<cr>", "JumpList" },
    l = { "<cmd>Telescope loclist<cr>", "LocList" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    n = { "<cmd>Telescope notify<cr>", "Notifications" },
    s = { "<cmd>Telescope luasnip<cr>", "Luasnip" },
    y = { "<cmd>Telescope yaml_schema<cr>", "YamlSchema" }
  },
  g = {
    name = "+Git",
    B = { '<cmd>Telescope advanced_git_search changed_on_branch<cr>', "List changes on current branch" },
    L = { '<cmd>Telescope advanced_git_search search_log_content<cr>', "Search all commits" },
    D = { '<cmd>Gitsigns diffthis ~ split=botright<CR>', "Diff File" },
    P = { "<cmd>lua require('neogit').open({'push'})<cr>", "Neogit Push" },
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
  h = {
    name = "+Harpoon",
    f = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
    m = { "<cmd>Telescope harpoon marks<cr>", "Marks" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev" },
  },
  i = {
    name = "+DAP",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    d = { "<cmd>lua require('dap').disconnect()<cr>", "Disconnect" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
    p = { function() require('dap-python').test_method() end, "Debug Python Method" },
    r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
  },
  l = {
    name = "+LSP",
    C = { '<cmd>Telescope lsp_outgoing_calls<CR>', "Outgoing Calls" },
    D = { '<cmd>Telescope lsp_type_definitions<CR>', "Type Definitions" },
    F = { '<cmd>lua vim.lsp.buf.format()<CR>', "Format" },
    S = { '<cmd>Telescope lsp_workspace_symbols<CR>', "Workspace Symbols" },
    c = { '<cmd>Telescope lsp_incoming_calls<CR>', "Incoming Calls" },
    d = { '<cmd>Telescope lsp_definitions<CR>', "Definitions" },
    h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature Help" },
    i = { '<cmd>Telescope lsp_implementations<CR>', "Implementations" },
    n = { '<cmd>lua vim.lsp.buf.rename()<CR>', "Rename" },
    r = { '<cmd>Telescope lsp_references<CR>', "References" },
    s = { '<cmd>Telescope lsp_document_symbols<CR>', "Document Symbols" },
  },
  m = { '<cmd>Glow<cr>', 'Glow' },
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
  p = { '"+p', 'Paste' },
  t = {
    name = "+Test",
    a = { '<cmd>lua require("neotest").run.attach()<CR>', "Attach" },
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "Current File" },
    c = {
      C = { '<cmd>CoverageClear<CR>', 'Clear Coverage' },
      c = { '<cmd>Coverage<CR>', 'Coverage' },
      g = {
        '<cmd>lua require("neotest").run.run({vim.fn.getcwd(), extra_args = {"--coverprofile=coverage.out"}})<CR>',
        "Generate Test Coverage" },
      s = { '<cmd>CoverageSummary<CR>', 'Show Coverage Summary' },
      t = { '<cmd>CoverageToggle<CR>', 'Toggle Coverage' },
    },
    d = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%:p:h"))<CR>', "Current Directory" },
    D = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', "DAP" },
    e = { '<cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>', "Everything" },
    l = { '<cmd>lua require("neotest").run.run_last()<CR>', "Last" },
    n = { '<cmd>lua require("neotest").run.run()<CR>', "Run" },
    o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "Output" },
    s = { '<cmd>lua require("neotest").summary.toggle()<CR>', "Summary" },
    x = { '<cmd>lua require("neotest").run.stop()<CR>', "Stop" },
  },
  r = {
    name = "+Repl",
    F = { '<cmd>IronFocus<cr>', 'Focus' },
    H = { '<cmd>IronReplHere<cr>', 'Here' },
    R = { '<cmd>IronRestart<cr>', 'Restart' },
    S = { '<cmd>IronRepl<cr>', 'Start' },
    h = { '<cmd>IronHide<cr>', 'Hide' },
  },
  u = { '<cmd>Telescope undo<cr>', 'Undo' },
  w = {
    name = "+Window",
    c = { '<cmd>lua require("toggle").quickfix()<CR>', "Toggle Quickfix" },
    l = { '<cmd>lua require("toggle").location()<CR>', "Toggle Location List" },
    o = { "<C-w>o", "Close Other Windows" },
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    x = { "<cmd>close<cr>", "Close" },
    z = { '<C-w>|<C-w>_', 'Maximize' },
  },
  y = { '"+y', 'Yank' },
  Y = {
    name = "+Yaml",
    k = { "<cmd>YAMLYankKey<cr>", "YankKey" },
    l = { "<cmd>YAMLView<cr>", "View" },
    q = { "<cmd>YAMLQuickfix<cr>", "QuickFix" },
    t = { "<cmd>YAMLTelescope<cr>", "Telescope" },
    v = { "<cmd>YAMLYankValue<cr>", "YankValue" },
    y = { "<cmd>YAMLYank<cr>", "Yank" },
  },
  z = { "<cmd>Lazy update<cr>", "Lazy Update" },
}, { prefix = "<leader>" })
