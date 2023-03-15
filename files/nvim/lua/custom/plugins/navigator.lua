--https://github.com/ray-x/navigator.lua

return {
	{
		'ray-x/navigator.lua',
		dependencies = {
			{ 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
	}
}
