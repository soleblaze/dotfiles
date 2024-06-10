local wk = require("which-key")

-- Terminal Mode
wk.register({
  ["<Esc>"] = { "<C-\\><C-n>", "Escape Terminal Mode" },
}, {
  mode = "t",
})

-- Normal Mode
wk.register({
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Buffer" },
  ZZ = { "<cmd>wqa!<cr>", "Save and Quit" },
  ["<C-;>"] = { "<C-w>s", "Split Horizontal" },
  ["<C-'>"] = { "<C-w>v", "Split Vertical" },
  ["<C-n>"] = { "<cmd>BufferNext<cr>", "Next Buffer" },
  ["<C-p>"] = { "<cmd>BufferPrevious<cr>", "Previous Buffer" },
  ["<Left>"] = { "<cmd>5winc <<cr>", "Shift Pane Left" },
  ["<Right>"] = { "<cmd>5winc ><cr>", "Shift Pane Right" },
  ["["] = {
    c = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Previous Hunk",
      { expr = true },
    },
    d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
    l = { "<cmd>lprevious<CR>", "Previous Location" },
    q = { "<cmd>cprevious<CR>", "Previous Quickfix" },
    t = { '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>', "Previous Test" },
  },
  ["]"] = {
    c = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Next Hunk",
      { expr = true },
    },
    d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    l = { "<cmd>lnext<CR>", "Next Location" },
    q = { "<cmd>cnext<CR>", "Next Quickfix" },
    t = { '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>', "Next Test" },
  },
  g = {
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    j = { "<cmd>TSJJoin<cr>", "Join" },
    m = { "<cmd>TSJToggle<cr>", "Toggle" },
    r = { "<cmd>Telescope lsp_references<CR>", "References" },
    s = { "<cmd>TSJSplit<cr>", "Split" },
  },
}, {
  mode = "n",
})

-- Normal Mode - Leader
wk.register({
  D = {
    name = "+Diff",
    b = { "<cmd>Telescope advanced_git_search diff_branch_file<cr>", "Diff Git Branch" },
    C = { '<cmd>lua require("telescope").extensions.diff.diff_files({ hidden = true })<cr>', "Compare 2 files" },
    c = {
      '<cmd>lua require("telescope").extensions.diff.diff_current({ hidden = true })<cr>',
      "Compare file with current",
    },
    l = { "<cmd>Telescope advanced_git_search diff_commit_line<cr>", "Diff Commit Lines" },
    f = { "<cmd>Telescope advanced_git_search diff_commit_file<cr>", "Diff commit Files" },
  },
  P = { '"+P', "Paste" },
  a = {
    name = "+AI",
    c = {
      name = "+Copilot",
      d = { "<CMD>Copilot disable<CR>", "Disable Copilot" },
      e = { "<CMD>Copilot enable<CR>", "Enable Copilot" },
      P = { "<CMD>Copilot panel<CR>", "Panel" },
      S = { "<CMD>Copilot status<CR>", "Status Copilot" },
      R = { "<cmd>CopilotChatRefactor<cr>", "Refactor Code" },
    },
    b = { function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end,
      "Chat with buffer",
    },
    C = { "<cmd>CopilotChatCommit<cr>", "Write Commit Message" },
    s = { "<cmd>CopilotChatCommitStaged<cr>", "Write Commit Message for Staged" },
    f = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix Diagnostic" },
    i = { "<cmd>CopilotChat<cr>", "Chat" },
    t = { "<cmd>CopilotChatTests<cr>", "Generate Tests" },
    w = { "<cmd>CopilotChatToggle<cr>", "Toggle Chat" },
    h = { function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.help_actions())
    end,
      "Help actions",
    },
    p = { function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
    end,
      "Prompt actions",
    },
  },
  b = {
    name = "+Buffer",
    P = { "<cmd>BufferPin<CR>", "Pin Buffer" },
    p = { "<cmd>BufferPick<CR>", "Pick Buffer" },
    r = { "<cmd>BufferRestore<CR>", "Restore Buffer" },
    b = { "<cmd>BufferOrderByBufferNumber<CR>", "Order By Buffer" },
    n = { "<cmd>BufferOrderByName<CR>", "Order By Name" },
    d = { "<cmd>BufferOrderByDirectory<CR>", "Order By Directory" },
    l = { "<cmd>BufferOrderByLanguage<CR>", "Order By Language" },
    w = { "<cmd>BufferOrderByWindowNumber<CR>", "Order By Window" },
    c = { "<cmd>BufferClose<CR>", "Close Buffer" },
  },
  c = { "<cmd>close<cr>", "Close" },
  d = { "<cmd>BufferClose<cr>", "Close Buffer" },
  e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Float" },
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
    r = { "<cmd>Telescope oldfiles<CR>", "Recent" },
    S = { "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", "Switch Buffer" },
    s = { "<cmd>Telescope luasnip<cr>", "Luasnip" },
    u = { "<cmd>Telescope undo<cr>", "Undo history" },
    y = { "<cmd>Telescope yaml_schema<cr>", "YamlSchema" },
  },
  g = {
    name = "+Git",
    B = { "<cmd>Telescope advanced_git_search changed_on_branch<cr>", "List changes on current branch" },
    L = { "<cmd>Telescope advanced_git_search search_log_content<cr>", "Search all commits" },
    D = { "<cmd>Gitsigns diffthis ~ split=botright<CR>", "Diff File" },
    P = { "<cmd>lua require('neogit').open({'push'})<cr>", "Neogit Push" },
    R = { '<cmd>lua require("gitsigns").reset_buffer()<CR>', "Reset Buffer" },
    S = { '<cmd>lua require("gitsigns").stage_buffer()<CR>', "Stage Buffer" },
    U = { '<cmd>lua require("gitsigns").reset_buffer_index()<CR>', "Reset Buffer Index" },
    a = { "<cmd>AdvancedGitSearch<cr>", "Advanced Git Search" },
    b = { '<cmd>lua require("gitsigns").blame_line{full=true}<CR>', "Blame Line" },
    c = { "<cmd>lua require('neogit').open({'commit'})<cr>", "Neogit Commit" },
    d = { "<cmd>Gitsigns diffthis split=botright<CR>", "Diff This" },
    f = { "<cmd>Telescope advanced_git_search search_log_content_file<cr>", "Search commits on file" },
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
      d = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
      b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame" },
    },
    u = { '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', "Undo Hunk Stage" },
  },
  i = {
    name = "+DAP",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    d = { "<cmd>lua require('dap').disconnect()<cr>", "Disconnect" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
    p = {
      function()
        require("dap-python").test_method()
      end,
      "Debug Python Method",
    },
    r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
  },
  l = {
    name = "+LSP",
    C = { "<cmd>Telescope lsp_outgoing_calls<CR>", "Outgoing Calls" },
    D = { "<cmd>Telescope lsp_type_definitions<CR>", "Type Definitions" },
    F = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    S = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
    c = { "<cmd>Telescope lsp_incoming_calls<CR>", "Incoming Calls" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
    n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    r = { "<cmd>Telescope lsp_references<CR>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
  },
  m = { "<cmd>Glow<cr>", "Glow" },
  o = {
    name = "+obsidian",
    e = { "<cmd>ObsidianExtractNote<cr>", "Extract Note" },
    t = {
      name = "tech vault",
      n = { "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianNew<cr>", "Create Note" },
      s = { "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianSearch<cr>", "Search" },
      t = { "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianTemplate<cr>", "Template Note" },
      q = { "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
    },
    m = {
      name = "main vault",
      n = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianNew<cr>", "Create Note" },
      s = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianSearch<cr>", "Search" },
      t = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianTemplate<cr>", "Template Note" },
      q = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianQuickSwitch<cr>", "Quick Switch" }
    },
    D = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianDailies<cr>", "Select Daily Note" },
    d = { "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianToday<cr>", "Open Daily Note" },
    v = { "<cmd>ObsidianWorkspace<cr>", "Change Vault" },
  },
  O = {
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
  p = { '"+p', "Paste" },
  s = {
    name = "+Snippets",
    e = { function() require("scissors").editSnippet() end, "Edit Snippets" },
    a = { function() require("scissors").addNewSnippet() end, "Add Snippets" },
  },
  t = {
    name = "+Test",
    a = { '<cmd>lua require("neotest").run.attach()<CR>', "Attach" },
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "Current File" },
    c = {
      C = { "<cmd>CoverageClear<CR>", "Clear Coverage" },
      c = { "<cmd>Coverage<CR>", "Coverage" },
      g = {
        '<cmd>lua require("neotest").run.run({vim.fn.getcwd(), extra_args = {"--coverprofile=coverage.out"}})<CR>',
        "Generate Test Coverage",
      },
      s = { "<cmd>CoverageSummary<CR>", "Show Coverage Summary" },
      t = { "<cmd>CoverageToggle<CR>", "Toggle Coverage" },
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
    F = { "<cmd>IronFocus<cr>", "Focus" },
    H = { "<cmd>IronReplHere<cr>", "Here" },
    R = { "<cmd>IronRestart<cr>", "Restart" },
    S = { "<cmd>IronRepl<cr>", "Start" },
    h = { "<cmd>IronHide<cr>", "Hide" },
  },
  u = {
    name = "+UI",
    d = { '<cmd>lua require("toggle").diagnostic()<cr>', "Toggle diagnostics" },
    c = { '<cmd>lua require("toggle").conceal()<cr>', "Toggle Conceal" },
    C = { '<cmd>lua require("toggle").cmp()<cr>', "Toggle cmp" },
    n = { '<cmd>lua require("toggle").relativenumber()<cr>', "Toggle relative number" },
    f = { '<cmd>lua require("toggle").autoFormat()<cr>', "Toggle auto format" },
    s = { "<cmd>set spell!<cr>", "Toggle Spell" },
    l = { "<cmd>set list!<cr>", "Toggle List" },
    a = { "<cmd>CopilotToggle<cr>", "Toggle Copilot" },
    w = { "<cmd>set wrap!<cr>", "Toggle Wrap" },
  },
  w = {
    name = "+Window",
    c = { '<cmd>lua require("toggle").quickfix()<CR>', "Toggle Quickfix" },
    l = { '<cmd>lua require("toggle").location()<CR>', "Toggle Location List" },
    o = { "<C-w>o", "Close Other Windows" },
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    z = { "<C-w>|<C-w>_", "Maximize" },
  },
  y = { '"+y', "Yank" },
  z = { "<cmd>Lazy update<cr>", "Lazy Update" },
}, { prefix = "<leader>" })

-- Visual Mode - Leader
wk.register({
  a = {
    name = "+AI",
    c = {
      name = "+Copilot",
      d = { "<cmd>CopilotChatDocs<cr>", "Add Docs" },
      e = { "<cmd>CopilotChatExplain<cr>", "Explain code" },
      f = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix Diagnostic" },
      o = { "<cmd>CopilotChatOptimize<cr>", "Optimize Code" },
      r = { "<cmd>CopilotChatReview<cr>", "Review code" },
      t = { "<cmd>CopilotChatTests<cr>", "Generate tests" },
      w = { "<cmd>CopilotChatToggle<cr>", "Toggle" },
    },
  },
  h = {
    name = "+GitSigns",
    r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
  },
  s = {
    name = "+Snippets",
    a = { function() require("scissors").addNewSnippet() end, "Add Snippets" },
  },
  y = { '"+y', "Yank" },
}, {
  prefix = "<leader>",
  mode = "v",
})
