-- https://github.com/Pocco81/true-zen.nvim/tree/main
return {
	"Pocco81/true-zen.nvim",
	config = function()
		require("true-zen").setup {
			-- your config goes here
			-- or just leave it empty :)

			modes = {
				ataraxis = {
					callbacks = {
						-- run functions when opening/closing Ataraxis mode
						open_pos = vim.cmd('PencilSoft')
						--close_pos = function()
						--	require('lualine').hide({ unhide = true })
						--end,
					},
				},
			},
			integrations = {
				twilight = false, -- enable twilight (ataraxis)
				lualine = true -- hide nvim-lualine (ataraxis)
			},


		}
	end,
}
