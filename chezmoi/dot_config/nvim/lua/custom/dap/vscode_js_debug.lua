--[[
DAP-compatible JavaScript debugger.
--]]

if vim.fn.executable("vscode-js-debug") == 1 then
	for _, language in ipairs({ "javascript", "typescript" }) do
		-- TODO: extend list
		require("dap").configurations[language] = {
			{
				type = "pwa-chrome",
				request = "launch",
				name = "Launch & Debug Chrome",
				url = function()
					local co = coroutine.running()
					return coroutine.create(function()
						vim.ui.input({
							prompt = "Enter URL: ",
							default = "http://localhost:3000",
						}, function(url)
							if url == nil or url == "" then
								return
							else
								coroutine.resume(co, url)
							end
						end)
					end)
				end,
				webRoot = "${workspaceFolder}",
				skipFiles = { "<node_internals>/**/*.js" },
				protocol = "inspector",
				sourceMaps = true,
				userDataDir = false,
			},
		}
	end
end
