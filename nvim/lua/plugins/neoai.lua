return {
  "Bryley/neoai.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "NeoAI",
    "NeoAIOpen",
    "NeoAIClose",
    "NeoAIToggle",
    "NeoAIContext",
    "NeoAIContextOpen",
    "NeoAIContextClose",
    "NeoAIInject",
    "NeoAIInjectCode",
    "NeoAIInjectContext",
    "NeoAIInjectContextCode",
    "NeoAIShortcut",
  },
  keys = {
    { "<leader>aws", desc = "fix text" },
    { "<leader>ag",  desc = "generate git message" },
    { "<leader>awb", desc = "convert to bullet points" },
    { "<leader>awB", desc = "convert from bullet points" },
    { "<leader>ad",  desc = "debug code" },
    { "<leader>arg", desc = "refactor go code" },
    { "<leader>arp", desc = "refactor python code" },
  },
  config = function()
    require("neoai").setup({
      shortcuts = {
        {
          name = "textify",
          key = "<leader>aws",
          desc = "fix text",
          use_context = true,
          prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "frombulletpoints",
          key = "<leader>awB",
          desc = "Convert from bullet points",
          use_context = true,
          prompt = [[
                Please convert the bullet points to text, concise, and fix
                any grammatical, punctuation, or spelling errors
            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "tobulletpoints",
          key = "<leader>awb",
          desc = "Convert to bullet points",
          use_context = true,
          prompt = [[
                Please convert the text to bullet points, making it more
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "debugcode",
          key = "<leader>ad",
          desc = "Debug Code",
          use_context = true,
          prompt = [[
                You're a senior programmer and you're reviewing the code
                of a junior programmer. Please debug the code and fix any
                errors, and make it more in line with the style of the language
                used.
            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "gitcommit",
          key = "<leader>ag",
          desc = "Create Commit Message",
          use_context = false,
          prompt = function()
            return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less and starts with the branch
                    name:
                ]] .. vim.fn.system("git diff --cached")
          end,
          modes = { "n" },
          strip_function = nil,

        },
        {
          name = "refactorgo",
          key = "<leader>arg",
          desc = "Refactor Go Code",
          use_context = true,
          prompt = [[
                You are GoAI, a powerful AI that can write simple, clear,
                and idiomatic Go code. Please review and refactor the
                following code:

            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "refactorpython",
          key = "<leader>ahttps://zed.dev/https://zed.dev/rp",
          desc = "Refactor Python Code",
          use_context = true,
          prompt = [[
                You are PythonAI, a powerful AI that can write simple, clear,
                and idiomatic python code. Please review and refactor the
                following code:

            ]],
          modes = { "v" },
          strip_function = nil,
        },
      },
    })
  end,
}
