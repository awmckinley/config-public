return {
	name = "python",
	builder = function()
		return {
			cmd = {
				"python",
			},
			args = {
				vim.fn.expand("%"),
			},
		}
	end,
	condition = {
		filetype = {
			"python",
		},
	},
}
