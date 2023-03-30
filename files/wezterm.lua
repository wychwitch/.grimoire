-- remember to save using noa like this -> :noa w

local wezterm = require 'wezterm'

return {
    font = wezterm.font '{{font}}',
    font_size = { { font_size } },
    color_scheme = "rose-pine",
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
