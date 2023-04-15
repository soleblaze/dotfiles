local wk = require('which-key')

wk.register({
  ["<C-s>"] = { function()
    vim.api.nvim_feedkeys(
      vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
  end, 'Accept Copilot', {
    silent = true, expr = true } },
  ["C-e"] = { '<Plug>(copilot-dismiss)', 'Dismiss Copilot' },
  ["C-n"] = { '<Plug>(copilot-next)', 'Next Copilot Suggestion' },
  ["C-p"] = { '<Plug>(copilot-previous)', 'Previous Copilot Suggestion' },
  ["<F7>"] = { '<cmd>set spell!<cr>', 'Toggle Spell' },
  ["<F8>"] = { '<cmd>set list!<cr>', 'Toggle List' },
  ["<F9>"] = { '<cmd>lua require("toggle-cmp").toggle_completion()<cr>', 'Toggle Completion' },
}, {
  mode = "i",
})

wk.register({
  K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover Buffer' },
  ZZ = { '<cmd>wqa!<cr>', 'Save and Quit' },
  ["<C-h>"] = { '<cmd>NavigatorLeft<cr>', 'Move to Left Pane' },
  ["<C-j>"] = { '<cmd>NavigatorDown<cr>', 'Move to Down Pane' },
  ["<C-k>"] = { '<cmd>NavigatorUp<cr>', 'Move to Up Pane' },
  ["<C-l>"] = { '<cmd>NavigatorRight<cr>', 'Move to Right Pane' },
  ["<C-n>"] = { '<cmd>BufferNext<cr>', 'Next Buffer' },
  ["<C-p>"] = { '<cmd>BufferPrevious<cr>', 'Previous Buffer' },
  ["<F7>"] = { '<cmd>set spell!<cr>', 'Toggle Spell' },
  ["<F8>"] = { '<cmd>set list!<cr>', 'Toggle List' },
  ["<F9>"] = { '<cmd>lua require"toggle-cmp".toggle_completion()<cr>', 'Toggle Completion' },
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
    end, 'Previous Hunk', { expr = true } },
    d = { '<cmd>lua vim.diagnostic.goto_next()<CR>', "Next Diagnostic" },
    l = { '<cmd>lnext<CR>', "Next Location" },
    q = { '<cmd>cnext<CR>', "Next Quickfix" },
    t = { '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>', "Next Test" },
  },
  g = {
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', "Declaration" },
    R = { '<cmd>Trouble lsp_references<cr>', "References" },
    d = { '<cmd>Telescope lsp_definitions<CR>', "Definition" },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', "Implementation" },
    j = { '<cmd>TSJJoin<cr>', "Join" },
    m = { '<cmd>TSJToggle<cr>', "Toggle" },
    r = { '<cmd>Telescope lsp_references<CR>', "References" },
    s = { '<cmd>TSJSplit<cr>', "Split" },
  },
  i = {
    h = { '<cmd><C-U>Gitsigns select_hunk<CR>', "Select Hunk" },
  },
  s = { '<cmd>HopChar1<cr>', 'Hop Char 1' },
}, {
  mode = "n",
})

wk.register({
  c = {
    name = "+ChatGPT",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
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
  k = {
    name = "+Dasht",
    s = { "y:<C-U>call Dasht(getreg(0))<CR>", "Search" },
    b = { "y:<C-U>call Dasht(getreg(0), '!' )<CR>", "Search in Browser" },
  },
  r = {
    name = "+Refactor",
    e = { "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    f = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function to File" },
    i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Var" },
    r = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Telescope" },
    v = { "<cmd>lua require('refactoring').debug.print_var({})<CR>", "Debug Print Var" },
    V = { "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
  },
  y = { '<Plug>OSCYankVisual', 'Yank' },
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
  K = { '<cmd>Dasht!<Space>', 'Dasht' },
  L = { "<cmd>HopLineStart<cr>", "HopLineStart" },
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
  [";"] = { '<C-w>v', "Vertical Split" },
  ["\""] = { '<C-w>s', "Split" },
  a = { '<cmd>BufferPick<cr>', "Pick Buffer" },
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
    name = "+ChatGPT and Copilot",
    T = { '<cmd>ChatGPTRun translate<cr>', "Translate" },
    c = { '<cmd>ChatGPT<cr>', "ChatGPT" },
    C = { '<cmd>CopilotToggle<cr>', "Toggle CoPilot" },
    d = { '<cmd>ChatGPTRun docstring<cr>', "DocString" },
    e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    f = { '<cmd>ChatGPTRun fix_bugs<cr>', "Fix Bugs" },
    g = { '<cmd>ChatGPTRun grammer_correction<cr>', "Grammer Correction" },
    i = { '<cmd>ChatGPTRun edit_with_instructions<cr>', "Edit with Instructions" },
    k = { '<cmd>ChatGPTRun keywords<cr>', "Keywords" },
    o = { '<cmd>ChatGPTRun optimize_code<cr>', "Optimize Code" },
    r = { '<cmd>ChatGPTRun code_readability_analysis<cr>', "Code Readability Analysis" },
    R = { '<cmd>ChatGPTRun roxygen_edit<cr>', "Roxygen Edit" },
    s = { '<cmd>ChatGPTRun summarize<cr>', "Summarize" },
    p = { '<cmd>Copilot panel<cr>', "Opens Copilot Panel" },
    t = { '<cmd>ChatGPTRun add_tests<cr>', "Add Tests" },
  },
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
  k = { '<cmd>call Dasht(dasht#cursor_search_terms())<CR>', 'Dasht Search Term' },
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
  m = { '<cmd>Glow<cr>', 'Glow' },
  n = { '<cmd>Telescope neoclip<cr>', 'Neoclip' },
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
  u = { '<cmd>Telescope undo<cr>', 'Undo' },
  w = {
    name = "+Window",
    o = { "<C-w>o", "Close Other Windows" },
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    x = { "<cmd>close<cr>", "Close" },
    z = { '<C-w>|<C-w>_', 'Maximize' },
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
  y = { '<Plug>OSCYankOperator', 'Yank' },
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
