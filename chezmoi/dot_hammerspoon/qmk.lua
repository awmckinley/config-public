--[[
Automatically switch to QWERTY when QMK keyboard is plugged in.
--]]

local sourceIDs = {
	dvorak = "org.sil.ukelele.keyboardlayout.realprogrammers dvorak.realprogrammers dvorak",
	qwerty = "com.apple.keylayout.US",
}

local function setInputSource(key)
	local oldSource = hs.keycodes.currentSourceID()
	local newSource = sourceIDs[key]
	if oldSource ~= newSource then
		hs.alert("set input source: " .. key)
		hs.keycodes.currentSourceID(newSource)
	end
end

local function isQMK(keyboard)
	return keyboard["vendorName"] == "QMK"
end

local function hasQMK()
	for _, v in ipairs(hs.usb.attachedDevices()) do
		if isQMK(v) then
			return true
		end
	end
end

if hasQMK() then
	setInputSource("qwerty")
else
	setInputSource("dvorak")
end

local usbWatcher = hs.usb.watcher.new(function(e)
	-- only switch if device is QMK
	if isQMK(e) then
		if e["eventType"] == "added" then
			setInputSource("qwerty")
		else
			setInputSource("dvorak")
		end
	end
end)

usbWatcher:start()
