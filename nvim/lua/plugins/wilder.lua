return {
  'gelguy/wilder.nvim',
  dependencies = "romgrk/fzy-lua-native",
  config = function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })
    -- Disable Python remote plugin
    wilder.set_option('use_python_remote_plugin', 0)

    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.python_search_pipeline({
          pattern = 'fuzzy',
        })
      ),
    })

    local highlighters = {
      wilder.lua_fzy_highlighter(),
    }

    local popupmenu_renderer = wilder.popupmenu_renderer(
      wilder.popupmenu_border_theme({
        border = 'rounded',
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = highlighters,
      })
    )

    local wildmenu_renderer = wilder.wildmenu_renderer({
      highlighter = highlighters,
      separator = ' · ',
      left = { ' ', wilder.wildmenu_spinner(), ' ' },
      right = { ' ', wilder.wildmenu_index() },
    })

    wilder.set_option('renderer', wilder.renderer_mux({
      [':'] = popupmenu_renderer,
      ['/'] = wildmenu_renderer,
      substitute = wildmenu_renderer,
    }))
  end,
}
