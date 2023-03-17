local wezterm = require 'wezterm'

return {
    font = wezterm.font 'Fantasque Sans Mono',
    font_size = 18.0,
    color_scheme = "Catppuccin Frappe",
    default_prog = { "{{shell}}" },
    default_cwd = "{{directory}}",
    default_cursor_style = 'BlinkingUnderline',
    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '2cell',
    },
}
