local wezterm = require("wezterm")
local M = {}

local appearance = wezterm.gui.get_appearance()

M.is_dark = function()
	return appearance:find("Dark")
end

M.get_random_entry = function(tbl)
	-- Check if the table is empty
	if #tbl == 0 then
		wezterm.log_error("get_random_entry: The table is empty!")
		return nil -- Return nil or some default value if the table is empty
	end

	local keys = {}
	for key, _ in ipairs(tbl) do
		table.insert(keys, key)
	end

	-- Ensure that the table has entries before calling math.random
	if #keys > 0 then
		local randomKey = keys[math.random(1, #keys)]
		return tbl[randomKey]
	else
		wezterm.log_error("get_random_entry: No valid keys in the table!")
		return nil -- Return nil or some default value if no valid keys are found
	end
end

return M
