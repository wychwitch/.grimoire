-- remember to save using noa like this -> :noa w

local wezterm = require 'wezterm'

local themes = {
    "FairyFloss",
    "aikofog (terminal.sexy)",
    "Harper",
    "Heetch Light (base16)",
    "Hopscotch",
    "Invisibone (terminal.sexy)",
    "jubi",
    "Pasque",
    "purplepeter",
    "rose-pine-dawn",
    "Sakura (base16)",
    "seulbones_dark",
    "seulbones_light",
    "Sequia Moonlight",
    "Whimsy",
    "wilmersdorf",
}

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
     if value == "on" then
       overrides.font_size = {{zenmode_text_size}}
     else
       overrides.font_size = nil
    end
  end
  window:set_config_overrides(overrides) 
end)

return {
    font = wezterm.font '{{font}}',
    font_size = {{font_size}},
    color_scheme = themes[15],
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
