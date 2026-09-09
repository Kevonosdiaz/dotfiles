-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 188
config.initial_rows = 40

-- or, changing the font size and color scheme.
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "luna"
config.color_scheme = "DoomOne"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Disable font ligatures

config.enable_scroll_bar = true
config.default_prog = { "bash" }
config.enable_wayland = false
config.front_end = "OpenGL"

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
  -- Tab title theming for Catppuccin
  -- local edge_background = "#0b0022"
  -- local background = "#181825"
  -- local foreground = "#585b70"
  --
  -- if tab.is_active then
  --   background = "#1E1E2F"
  --   foreground = "#b4befe"
  -- elseif hover then
  --   background = "#6c7086"
  --   foreground = "#9399b2"
  -- end

  -- Tab title theming for luna.nvim
  -- local edge_background = "#0b0022"
  -- local background = "#000000"
  -- local foreground = "#6d6d6d"
  --
  -- if tab.is_active then
  --   background = "#212121"
  --   foreground = "#e4e4e8"
  -- elseif hover then
  --   background = "#c4c4c4"
  --   foreground = "#1c1c1c"
  -- end

  -- Tab title theming for DoomOne theme
  local edge_background = "#0b0022"
  local background = "#282C34"
  local foreground = "#6d6d6d"

  if tab.is_active then
    background = "#21242B"
    foreground = "#e4e4e8"
  elseif hover then
    background = "#818a8a"
    foreground = "#000000"
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

config.colors = {
  tab_bar = {
    -- Background color of the entire tab bar strip
    background = "#282C34",

    -- New tab button
    new_tab = {
      bg_color = "#21242B",
      fg_color = "#A9A1E1",
    },
  },

  cursor_bg = "#A9A1E1",
  cursor_border = "#A9A1E1",
}

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

-- Switch to tab # with <Alt + #>
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

smart_splits.apply_to_config(config)
config.show_tab_index_in_tab_bar = true
-- Finally, return the configuration to wezterm:
return config
