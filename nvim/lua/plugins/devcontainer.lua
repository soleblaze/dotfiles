return {
  "https://codeberg.org/esensar/nvim-dev-container",
  opts = {
    generate_commands = true,
    autocommands = {
      init = true,
      clean = true,
      update = true,
    },
    attach_mounts = {
      neovim_config = {
        enabled = true,
        options = { "readonly" },
      },
      neovim_data = {
        enabled = true,
        options = {},
      },
      neovim_state = {
        enabled = true,
      },
    },
  },
}
