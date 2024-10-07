local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_wallpaper = function(dir)
	local wallpapers = {}
	for _, v in ipairs(wezterm.glob(dir)) do
		wezterm.log_error(v)
		if not string.match(v, "%.DS_Store$") then
			table.insert(wallpapers, v)
		end
	end
	local wallpaper = h.get_random_entry(wallpapers)
	local myCurrentFavWallpaper = os.getenv("HOME")
		.. "/Documents/Obsidian Vault/03 - Resources/Macos/Wallpapers Macos/wallpaperflare.com_wallpaper (1).jpg"
	return {
		source = { File = { path = myCurrentFavWallpaper } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

M.set_nvim_wallpaper = function(dir, name)
	return {
		source = { File = { path = os.getenv("HOME") .. "/.config/wezterm/wallpapers/nvim/" .. name } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

M.set_tmux_session_wallpaper = function(value)
	local path = os.getenv("HOME") .. "/.config/wezterm/wallpapers/sessions/" .. value .. ".jpeg"
	print(path)
	return {
		source = { File = { path = path } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

return M
