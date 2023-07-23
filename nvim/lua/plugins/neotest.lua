return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
      },
      require("neotest-python")({
        dap = { justMyCode = false },
      }),
      consumers = {
        notify = function(client)
          client.listeners.results = function(_, results, partial)
            -- Partial results can be very frequent
            if partial then
              return
            end
            local pass = 0
            local fail = 0
            local skip = 0
            for _, result in pairs(results) do
              if result.status == "failed" then
                fail = fail + 1
              elseif result.status == "passed" then
                pass = pass + 1
              elseif result.status == "skipped" then
                skip = skip + 1
              end
            end

            local output = "Tests completed:\n" .. pass .. " passed, " .. fail ..
                " failed, " .. skip .. " skipped"
            if fail > 0 then
              vim.notify(output, vim.log.levels.ERROR, { title = "Neotest" })
            else
              vim.notify(output, vim.log.levels.INFO, { title = "Neotest" })
            end
          end
          return {}
        end,
      },
    })
  end,
}
