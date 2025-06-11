-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14
config.color_scheme = 'Catppuccin Mocha'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disable font ligatures

config.enable_scroll_bar = true

-- Keymapping stuff
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- splitting
    {
        mods   = "LEADER",
        key    = "w",
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods   = "LEADER",
        key    = "v",
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },

    -- window navigation
    {
        key = "h",
        mods = "ALT",
        action = wezterm.action_callback(function(window, pane)
            local tab = window:mux_window():active_tab()
            if tab:get_pane_direction("Left") ~= nil then
                window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
            else
                window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
            end
        end),
    },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
    {
        key = "l",
        mods = "ALT",
        action = wezterm.action_callback(function(window, pane)
            local tab = window:mux_window():active_tab()
            if tab:get_pane_direction("Right") ~= nil then
                window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
            else
                window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
            end
        end)
    }
}

-- Finally, return the configuration to wezterm:
return config
