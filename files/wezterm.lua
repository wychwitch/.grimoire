local wezterm = require 'wezterm'

return {
    font = wezterm.font('{{font}}', { weight = "{{font_weight}}", italic = {{font_italic}} }),
    font_size = {{font_size}},
    color_scheme = "Catppuccin Frappe",
    default_prog = { "{{shell}}" },
    default_cwd = "{{directory}}",
    default_cursor_style = 'BlinkingUnderline',
    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0.5cell',
    },
}
