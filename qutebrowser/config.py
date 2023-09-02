c.colors.completion.category.bg = "#193549"
c.colors.completion.category.border.bottom = "#073642"
c.colors.completion.category.border.top = "#073642"
c.colors.completion.even.bg = "#214561"
c.colors.completion.item.selected.bg = "#0050a4"
c.colors.completion.item.selected.fg = "#c7c7c7"
c.colors.completion.odd.bg = "#193549"
c.colors.completion.scrollbar.bg = "#193549"
c.colors.downloads.bar.bg = "#193549"
c.colors.hints.bg = "#193549"
c.colors.hints.fg = "white"
c.colors.completion.fg = ["#c7c7c7", "#c7c7c7", "#c7c7c7"]
c.colors.completion.scrollbar.fg = "#c7c7c7"
c.colors.completion.category.fg = "#c7c7c7"
c.colors.statusbar.progress.bg = "#c7c7c7"
c.colors.hints.match.fg = "#555555"
c.colors.keyhint.bg = "rgba(25,53,73, 80%)"
c.colors.messages.error.bg = "#ff0900"
c.colors.messages.error.border = "#bb0000"
c.colors.messages.info.bg = "#193549"
c.colors.messages.info.border = "#073642"
c.colors.messages.warning.border = "#ff9d00"
c.colors.prompts.bg = "#193549"
c.colors.statusbar.command.bg = "#193549"
c.colors.statusbar.insert.bg = "darkgreen"
c.colors.statusbar.insert.fg = "#c7c7c7"
c.colors.statusbar.normal.bg = "#193549"
c.colors.statusbar.normal.fg = "#c7c7c7"
c.colors.statusbar.url.success.https.fg = "#c7c7c7"
c.colors.tabs.bar.bg = "#193549"
c.colors.tabs.even.bg = "#193549"
c.colors.tabs.indicator.start = "#0000aa"
c.colors.tabs.odd.bg = "#193549"
c.colors.tabs.selected.even.bg = "#214561"
c.colors.tabs.selected.even.fg = "#c7c7c7"
c.colors.tabs.selected.odd.bg = "#214561"
c.colors.tabs.selected.odd.fg = "#c7c7c7"
c.editor.command = ["hx", "{file}"]
c.fonts.completion.category = "bold 12pt default_family"
c.fonts.completion.entry = "12pt default_family"
c.fonts.debug_console = "12pt default_family"
c.fonts.default_family = ["DejaVu Sans Mono"]
c.fonts.default_size = "12pt"
c.fonts.downloads = "default_size default_family"
c.fonts.hints = "bold 12pt default_family"
c.fonts.web.family.fixed = "DejaVu Sans Mono"
c.fonts.web.family.sans_serif = "DejaVu Sans"
c.fonts.web.family.serif = "DejaVu Serif"
c.fonts.web.family.standard = "DejaVu Sans"
c.fonts.web.size.default = 14
c.fonts.web.size.default_fixed = 14
c.fonts.web.size.minimum = 14
c.fonts.web.size.minimum_logical = 14
c.hints.chars = "asdfghjklerui"
c.qt.highdpi = True
c.zoom.default = "100%"
c.tabs.background = True
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aur": "https://aur.archlinux.org/packages/?O=0&K={}",
    "g": "https://www.google.com/search?q={}",
    "b": "https://pinboard.in/search/u:soleblaze?query={}",
    "wa": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}&go=Go",
    "gw": "https://gswiki.play.net/index.php?search={}&title=Special%3ASearch&go=Go",
    "ps": "https://ps.lichproject.org/items?s={}&f=F_B",
}
config.bind("e", "scroll-page 0 -1")
config.bind("sb", "set-cmd-text -s :spawn --userscript pin add")
config.bind("sr", "set-cmd-text -s :spawn --userscript pin readLater")
config.bind("sp", "print --pdf /home/qb/Downloads/saved-websites/{title}.pdf")
config.bind("j", "tab-prev")
config.bind("k", "tab-next")
config.load_autoconfig()
