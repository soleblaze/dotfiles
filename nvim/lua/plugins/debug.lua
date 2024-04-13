return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>D"] = { name = "+debug" } })
      for k in pairs(opts.defaults) do
        if k == "<leader>d" then
          opts.defaults[k] = nil
        end
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    keys = function()
      return {
        {
          "<leader>DB",
          function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end,
          desc = "Breakpoint Condition",
        },
        {
          "<leader>Db",
          function()
            require("dap").toggle_breakpoint()
          end,
          desc = "Toggle Breakpoint",
        },
        {
          "<leader>Dc",
          function()
            require("dap").continue()
          end,
          desc = "Continue",
        },
        {
          "<leader>DC",
          function()
            require("dap").run_to_cursor()
          end,
          desc = "Run to Cursor",
        },
        {
          "<leader>Dg",
          function()
            require("dap").goto_()
          end,
          desc = "Go to Line (No Execute)",
        },
        {
          "<leader>Di",
          function()
            require("dap").step_into()
          end,
          desc = "Step Into",
        },
        {
          "<leader>Dj",
          function()
            require("dap").down()
          end,
          desc = "Down",
        },
        {
          "<leader>Dk",
          function()
            require("dap").up()
          end,
          desc = "Up",
        },
        {
          "<leader>Dl",
          function()
            require("dap").run_last()
          end,
          desc = "Run Last",
        },
        {
          "<leader>Do",
          function()
            require("dap").step_out()
          end,
          desc = "Step Out",
        },
        {
          "<leader>DO",
          function()
            require("dap").step_over()
          end,
          desc = "Step Over",
        },
        {
          "<leader>Dp",
          function()
            require("dap").pause()
          end,
          desc = "Pause",
        },
        {
          "<leader>Dr",
          function()
            require("dap").repl.toggle()
          end,
          desc = "Toggle REPL",
        },
        {
          "<leader>Ds",
          function()
            require("dap").session()
          end,
          desc = "Session",
        },
        {
          "<leader>Dt",
          function()
            require("dap").terminate()
          end,
          desc = "Terminate",
        },
        {
          "<leader>Dw",
          function()
            require("dap.ui.widgets").hover()
          end,
          desc = "Widgets",
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = function()
      return {
        {
          "<leader>DPt",
          function()
            require("dap-python").test_method()
          end,
          desc = "Debug Method",
          ft = "python",
        },
        {
          "<leader>DPc",
          function()
            require("dap-python").test_class()
          end,
          desc = "Debug Class",
          ft = "python",
        },
      }
    end,
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = function()
      return {
        {
          "<leader>Du",
          function()
            require("dapui").toggle({})
          end,
          desc = "Dap UI",
        },
        {
          "<leader>De",
          function()
            require("dapui").eval()
          end,
          desc = "Eval",
          mode = { "n", "v" },
        },
      }
    end,
  },
}
