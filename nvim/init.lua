if not vim.g.vscode then
  require("config.lazy")
else
  local lazypath = vim.fn.stdpath("data") .. "/vscode/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)

  require("vscode.options")

  require("lazy").setup("vscode.plugins", {
    root = vim.fn.stdpath("data") .. "/vscode",
    checker = {
      enabled = true,
      frequency = 604800,
      notify = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })

  local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
      if require("lazy.status").has_updates then
        require("lazy").update({ show = false })
      end
    end,
  })

  require("vscode.keymaps")
end
