return {
  "williamboman/mason-lspconfig.nvim",
  build = ":MasonUpdate",
  dependencies = {
    { "b0o/schemastore.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ansiblels",
        "awk_ls",
        "bashls",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "helm_ls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "regols",
        "ruff",
        "rust_analyzer",
        "taplo",
        "terraformls",
        "yamlls",
      },
    })

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
      ["jsonls"] = function()
        lspconfig.jsonls.setup({
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
      end,
      ["python"] = function()
        lspconfig.python.setup({
          servers = {
            pyright = {
              enabled = lsp == "pyright",
            },
            basedpyright = {
              enabled = lsp == "basedpyright",
            },
            [lsp] = {
              enabled = true,
            },
            ruff_lsp = {
              enabled = ruff == "ruff_lsp",
            },
            ruff = {
              enabled = ruff == "ruff",
            },
          },
          on_attach = function(client, _)
            if client.name == ruff then
              client.server_capabilities.hoverProvider = false
            end
          end
        })
      end,
      ["gopls"] = function()
        lspconfig.gopls.setup({
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        })
      end,
      ["yamlls"] = function()
        lspconfig.yamlls.setup({
          on_attach = function(client, bufnr)
            if vim.api.nvim_get_option_value("filetype", { buf = buffer }) == "helm" then
              vim.schedule(function()
                vim.cmd("LspStop ++force yamlls")
              end)
            end
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              telemetry = { enable = false },
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.stdpath("config") .. "/lua",
                },
              },
            },
          },
        })
      end,
    })
  end,
}
