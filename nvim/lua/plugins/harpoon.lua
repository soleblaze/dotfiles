local harpoon = require("harpoon")

harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-;>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-'>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})

local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>fh",
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = "List Harpoons",
      },
      {
        "<leader>h",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>H",
        function()
          harpoon:list():remove()
        end,
        desc = "Unharpoon File",
      },
    },
  },
}
