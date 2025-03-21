# WezTerm Installation Guide

## Introduction
WezTerm is a powerful, GPU-accelerated terminal emulator that supports multiple platforms. This guide focuses on installing and configuring WezTerm on Linux using **Flatpak**.

## Installation

### 1. Install WezTerm via Flatpak
Before installing WezTerm, ensure **Flatpak** is installed and configured on your system. If Flatpak is not installed, follow the [Flatpak setup guide](https://flatpak.org/setup/).

Once Flatpak is set up, install WezTerm with the following command:

```sh
flatpak install flathub org.wezfurlong.wezterm
```

### 2. Running WezTerm
After installation, run WezTerm with:

```sh
flatpak run org.wezfurlong.wezterm
```

For convenience, you can create an alias:

```sh
alias wezterm='flatpak run org.wezfurlong.wezterm'
```

## Configuration
### Setting Up WezTerm Configuration File
Your configuration file should be placed at `~/.wezterm.lua`.

Use the following custom configuration to enhance your WezTerm experience:

```lua
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
    },
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
        active_titlebar_bg = '#1E1E2E',
        inactive_titlebar_bg = '#1E1E2E',
        border_left_width = '0.3cell',
        border_right_width = '0.3cell',
        border_top_height = '0.2cell',
        border_bottom_height = '0.2cell',
        border_left_color = '#45475A',
        border_right_color = '#45475A',
        border_top_color = '#45475A',
        border_bottom_color = '#45475A',
    },

    -- Background customization
    background = {
        {
            source = { File = '/home/akhil/Downloads/pexels.jpg' },
            opacity = 1.0,
            hsb = {
                hue = 1.0,
                saturation = 0.9,
                brightness = 0.1,
            },
        },
    },

    -- Colors for minimalism
    colors = {
        foreground = '#D3D3D3',
        selection_bg = 'rgba(255, 255, 255, 0.3)',
        selection_fg = 'white',
        split = '#45475A',
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
        { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'f', mods = 'CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'd', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = false } },
        { key = 'x', mods = 'CTRL', action = act.CloseCurrentPane { confirm = false } },
    },
}
```

## Troubleshooting
### Font Issues
- Ensure you have installed a **Nerd Font** like **JetBrainsMono Nerd Font**.
- Set the font manually in your terminal settings if necessary.

### Flatpak Issues
- If WezTerm does not start, run:
  ```sh
  flatpak run --command=sh org.wezfurlong.wezterm
  ```
  Then manually check logs for issues.

### Configuration Not Applying
- Restart WezTerm after editing `~/.wezterm.lua`:
  ```sh
  wezterm cli reload
  ```

## Additional Resources
- **WezTerm Official Site:** [https://wezfurlong.org/wezterm/](https://wezfurlong.org/wezterm/)
- **Flatpak Setup Guide:** [https://flatpak.org/setup/](https://flatpak.org/setup/)

---
Now go forth and customize your **WezTerm** like a pro! 🚀


