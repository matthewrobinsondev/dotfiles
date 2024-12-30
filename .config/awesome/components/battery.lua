local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local utf8 = require("utf8")

local battery_widget = wibox.widget({
	{
		id = "icon",
		widget = wibox.widget.textbox,
	},
	{
		id = "text",
		widget = wibox.widget.textbox,
	},
	layout = wibox.layout.fixed.horizontal,
})

local battery_icons = {
	[100] = utf8.char(0xf240), -- Full battery
	[75] = utf8.char(0xf241), -- Three quarters
	[50] = utf8.char(0xf242), -- Half
	[25] = utf8.char(0xf243), -- Quarter
	[0] = utf8.char(0xf244), -- Empty
	charging = utf8.char(0xf0e7), -- Lightning bolt
	unknown = utf8.char(0xf128), -- Question mark
}

local colors = {
	charging = "#ffffff",
	good = "#00ff00",
	medium = "#ffff00",
	low = "#ff0000",
	unknown = "#ffffff",
}

local function get_battery_icon(percentage, is_charging)
	if is_charging then
		return battery_icons.charging
	end

	for level, icon in pairs(battery_icons) do
		if percentage >= level then
			return icon
		end
	end
	return battery_icons[0]
end

local function get_battery_color(percentage, is_charging)
	if is_charging then
		return colors.charging
	end
	if percentage >= 50 then
		return colors.good
	end
	if percentage >= 30 then
		return colors.medium
	end

	return colors.low
end

local function show_battery_details()
	awful.spawn.easy_async([[bash -c "acpi -i"]], function(stdout)
		naughty.notify({
			title = "Battery Status",
			text = stdout,
			timeout = 5,
			position = "top_right",
			width = 300,
		})
	end)
end

battery_widget:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		show_battery_details()
	end
end)

local function update_battery(widget)
	awful.spawn.easy_async([[bash -c "acpi"]], function(stdout)
		local first_line = stdout:match("^[^\n]+") -- Only need first battery, for some reason external monitor shows up
		local status, percentage = first_line:match("Battery 0: ([%w%s]+), (%d+)%%")
		percentage = tonumber(percentage) or 0
		local is_charging = status == "Charging"

		local icon = get_battery_icon(percentage, is_charging)
		local color = get_battery_color(percentage, is_charging)

		local charging_indicator = is_charging and " ⚡" or ""
		widget:get_children_by_id("icon")[1]:set_markup(string.format('<span color="%s">%s</span>', color, icon))
		widget
			:get_children_by_id("text")[1]
			:set_markup(string.format('<span color="%s"> %d%%%s</span>', color, percentage, charging_indicator))

		if percentage < 15 and not is_charging and status ~= nil then
			naughty.notify({
				title = "Battery Low!",
				text = "Battery level is " .. percentage .. "%\nPlease connect charger",
				timeout = 10,
				position = "top_right",
				bg = "#ff0000",
				fg = "#ffffff",
				width = 300,
			})
		end
	end)
end

awful.widget.watch("acpi", 30, function(widget)
	update_battery(widget)
end, battery_widget)

update_battery(battery_widget)

battery_widget:connect_signal("mouse::enter", function()
	local wb = mouse.current_wibox
	if wb then
		wb.cursor = "hand1"
	end
end)

battery_widget:connect_signal("mouse::leave", function()
	local wb = mouse.current_wibox
	if wb then
		wb.cursor = "left_ptr"
	end
end)

return battery_widget
