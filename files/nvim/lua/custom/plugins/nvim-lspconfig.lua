return {
	"neovim/nvim-lspconfig",
	config = function()
		require 'lspconfig'.uiua.setup {}
	end
}
