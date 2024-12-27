return {
	name = "browser-sync",
	builder = function()
		-- TODO: warn user if HTML has no <body>
		return {
			cmd = {
				"browser-sync",
			},
			args = {
				"start",
				"--server",
				"--watch",
			},
		}
	end,
	condition = {
		filetype = {
			"html",
		},
	},
}
