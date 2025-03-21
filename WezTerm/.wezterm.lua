local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
    local tab, pane, window = mux.spawn_window({})
    window:gui_window():maximize()
end)

return {
    default_prog = { '/usr/bin/zsh', '-l' },
    window_decorations = "RESIZE", -- Minimal decorations
    window_padding = {
        left = 12,
        right = 12,
        top = 12,
        bottom = 12,
    }, -- Increased padding for a "soft" edge effect
    inactive_pane_hsb = {
        saturation = 0.8,
        brightness = 0.7,
    },
    color_scheme = 'Dracula (Official)',
    font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' }),
    font_size = 14,
    line_height = 1.2,
    use_dead_keys = false,
    scrollback_lines = 5000,
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = true,

    -- Window frame customization
    window_frame = {
        font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
        active_titlebar_bg = '#1E1E2E', -- Dracula background
        inactive_titlebar_bg = '#1E1E2E',
        border_left_width = '0.3cell',   -- Thin borders for a subtle separation
        border_right_width = '0.3cell',
        border_top_height = '0.2cell',
        border_bottom_height = '0.2cell',
        border_left_color = '#45475A',   -- Subtle gray for pane/window edges
        border_right_color = '#45475A',
        border_top_color = '#45475A',
        border_bottom_color = '#45475A',
    },

    -- Background with full opacity
    background = {
        {
            source = { File = '/home/akhil/Downloads/pexels.jpg' },
            opacity = 1.0, -- Fully opaque as requested
            hsb = {
                hue = 1.0,
                saturation = 0.9,
                brightness = 0.1, -- Keep it dark for contrast
            },
        },
    },

    -- Colors for minimalism
    colors = {
        foreground = '#D3D3D3',
        selection_bg = 'rgba(255, 255, 255, 0.3)', -- Subtle selection
        selection_fg = 'white',
        split = '#45475A', -- Pane split color
    },

    -- Key bindings
    disable_default_key_bindings = true,
    keys = {
        { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
        { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
        { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
        { key = 'Enter', mods = 'CTRL', action = act.ActivateCopyMode },
        { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
        { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
        { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
        { key = '0', mods = 'CTRL', action = act.ResetFontSize },
        { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
        { key = 'n', mods = 'CTRL|SHIFT', action = act.SpawnWindow },
        { key = 'u', mods = 'CTRL|SHIFT', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
        { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
        { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
        { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
        { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
        { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
        { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
        { key = 'f', mods = 'CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'd', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
        { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
        { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = false } },
        { key = 'x', mods = 'CTRL', action = act.CloseCurrentPane { confirm = false } },
        { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02' },
        { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode },
        { key = 'p', mods = 'LEADER', action = act.PasteFrom 'PrimarySelection' },
        { key = 'k', mods = 'CTRL|ALT', action = act.Multiple {
            act.ClearScrollback 'ScrollbackAndViewport',
            act.SendKey { key = 'L', mods = 'CTRL' }
        }},
        { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false } },
    },
}
