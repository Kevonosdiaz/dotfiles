-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.color_scheme = "Catppuccin Mocha"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Disable font ligatures

config.enable_scroll_bar = true
config.default_prog = { "bash" }

config.use_fancy_tab_bar = false

-- The filled in variant of the < symbol
local TAB_END_LEFT = utf8.char(0x2588)

-- The filled in variant of the > symbol
local TAB_END_RIGHT = utf8.char(0x2588)

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#181825"
	local foreground = "#585b70"

	if tab.is_active then
		background = "#1E1E2F"
		foreground = "#b4befe"
	elseif hover then
		background = "#6c7086"
		foreground = "#9399b2"
	end

	local edge_foreground = background

	-- local title = tab_title(tab)
	local title = string.format("%d", tab.tab_index + 1)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = TAB_END_LEFT .. utf8.char(0x2588) .. utf8.char(0x2588) },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = utf8.char(0x2588) .. utf8.char(0x2588) .. TAB_END_RIGHT },
	}
end)

-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({
-- 	options = {
-- 		theme = config.colors,
-- 	},
-- })

-- Keymapping stuff
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "w",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "v",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- window navigation
	-- {
	-- 	key = "h",
	-- 	mods = "ALT",
	-- 	action = wezterm.action_callback(function(window, pane)
	-- 		local tab = window:mux_window():active_tab()
	-- 		if tab:get_pane_direction("Left") ~= nil then
	-- 			window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
	-- 		else
	-- 			window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
	-- 		end
	-- 	end),
	-- },
	-- { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	-- { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	-- {
	-- 	key = "l",
	-- 	mods = "ALT",
	-- 	action = wezterm.action_callback(function(window, pane)
	-- 		local tab = window:mux_window():active_tab()
	-- 		if tab:get_pane_direction("Right") ~= nil then
	-- 			window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
	-- 		else
	-- 			window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
	-- 		end
	-- 	end),
	-- },

	-- shortcuts
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

smart_splits.apply_to_config(config)
-- smart_splits.apply_to_config(config, {
-- 	-- the default config is here, if you'd like to use the default keys,
-- 	-- you can omit this configuration table parameter and just use
-- 	-- smart_splits.apply_to_config(config)
--
-- 	-- directional keys to use in order of: left, down, up, right
-- 	direction_keys = { "h", "j", "k", "l" },
-- 	-- if you want to use separate direction keys for move vs. resize, you
-- 	-- can also do this:
-- 	direction_keys = {
-- 		move = { "h", "j", "k", "l" },
-- 		resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
-- 	},
-- 	-- modifier keys to combine with direction_keys
-- 	modifiers = {
-- 		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
-- 		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
-- 	},
-- 	-- log level to use: info, warn, error
-- 	log_level = "info",
-- })
config.show_tab_index_in_tab_bar = true
-- Finally, return the configuration to wezterm:
return config
