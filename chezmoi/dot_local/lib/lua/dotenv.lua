local M = {}

function M.load(filename)
	local env = {}
	local file = io.open(filename, "r")

	if not file then
		error("Unable to open file: " .. filename)
	end

	for line in file:lines() do
		local key, value = line:match("^(.-)='(.*)'$")
		if key and value then
			env[key] = value
		end
	end

	file:close()
	return env
end

function M.theme(mode)
	return M.load("/etc/theme." .. mode .. ".env")
end

return M
