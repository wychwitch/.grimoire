--https://github.com/gnikdroy/projections.nvim
vim.opt.sessionoptions:append("localoptions")
return {
	"gnikdroy/projections.nvim",
	config = function()
		require("projections").setup({
			workspaces = { -- Default workspaces to search for
				-- { "~/Documents/dev", { ".git" } },        Documents/dev is a workspace. patterns = { ".git" }
				{ "/mnt/c/Git",  {} }, --                      An empty pattern list indicates that all subdirectories are considered projects
				{ "~/local-git", {} },
				-- "~/dev",                                  dev is a workspace. default patterns is used (specified below)
			},
		})

		-- Bind <leader>fp to Telescope projections
		require('telescope').load_extension('projections')
		vim.keymap.set("n", "<leader>pa", function() vim.cmd("Telescope projections") end,
		{ desc = "[P]rojects All" })

		-- Autostore session on VimExit
		local Session = require("projections.session")
		vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
			callback = function() Session.store(vim.loop.cwd()) end,
		})

		-- Switch to project if vim was started in a project dir
		local switcher = require("projections.switcher")
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			callback = function()
				if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
			end,
		})
	end
}
