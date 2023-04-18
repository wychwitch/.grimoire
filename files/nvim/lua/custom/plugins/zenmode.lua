-- https://github.com/folke/zen-mode.nvim
return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			window = {
				backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = .70, -- width of the Zen window
				height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					-- relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					-- cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				kitty = {
					enabled = false,
					font = "+4", -- font size increment
				},
				-- this will change the font size on alacritty when in zen mode
				-- requires  Alacritty Version 0.10.0 or higher
				-- uses `alacritty msg` subcommand to change font size
				alacritty = {
					enabled = false,
					font = "14", -- font size
				},
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win)
				require("lualine").hide({})
				local o = vim.o
				local cmd = vim.cmd

				cmd "highlight StatusLeft guifg=#9591B8 guibg=#232136"
				cmd "highlight StatusRight guifg=gray guibg=#232136"

				o.statusline = ""
				o.statusline = o.statusline .. "%#StatusLeft#"
				o.statusline = o.statusline .. "%t"
				o.statusline = o.statusline .. "%="
				o.statusline = o.statusline .. tostring(vim.fn.wordcount().words) .. " words"

				vim.cmd('PencilSoft');
				vim.cmd('Limelight');
				os.execute('printf "\033]1337;SetUserVar=%s=%s\007" ZEN_MODE `echo -n on | base64`')
			end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function()
				require("lualine").hide({ unhide = true })
				vim.cmd('PencilSoft');
				vim.cmd('Limelight!');
				os.execute('printf "\033]1337;SetUserVar=%s=%s\007" ZEN_MODE `echo -n off | base64`')
			end,
		}
	end
}