return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "actionlint",
      "ansible-lint",
      "beautysh",
      "cbfmt",
      "delve",
      "fixjson",
      "gofumpt",
      "goimports",
      "gomodifytags",
      "hadolint",
      "hclfmt",
      "impl",
      "markdownlint",
      "markdownlint-cli2",
      "opa",
      "prettier",
      "pyright",
      "rubocop",
      "ruff",
      "salt-lint",
      "shfmt",
      "stylua",
      "tfsec",
      "tflint",
      "trivy",
      "yamlfmt",
      "yamllint",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
