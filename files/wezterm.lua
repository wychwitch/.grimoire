local wezterm = require 'wezterm'

return {
    font = wezterm.font 'Fantasque Sans Mono',
    font_size = 14.0,
    color_scheme = "Catppuccin Frappe",
    default_prog = { "{{shell}}" },
    default_cwd = "{{directory}}",
    default_cursor_style = 'BlinkingUnderline',
}
