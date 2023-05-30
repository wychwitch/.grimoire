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
       overrides.font_size = {{zenmode_font_size}}
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
window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10. on Windows but 12.0 on other systems
  font_size = 15.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#29283B',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#29283B',
  
},

colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
active_tab = {
      -- The color of the background area for the tab
      bg_color = '#232136',
      -- The color of the text for the tab
      fg_color = '#A3A1C4',
    },
new_tab = {
      bg_color = '#232136',
      fg_color = '#A3A1C4',
  },

},
},

    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0.5cell',
    },
}
