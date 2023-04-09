-- https://github.com/Pocco81/true-zen.nvim/tree/main
local function getWords()
	if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
		if vim.fn.wordcount().visual_words == 1 then
			return tostring(vim.fn.wordcount().visual_words) .. " word"
		elseif not (vim.fn.wordcount().visual_words == nil) then
			return tostring(vim.fn.wordcount().visual_words) .. " words"
		else
			return tostring(vim.fn.wordcount().words) .. " words"
		end
	else
		return ""
	end
end

local function minimizeLualine(switch)
	local lualine_default = {
		options = {
			icons_enabled = false,
			theme = 'duskfox',
			component_separators = '|',
			section_separators = '',
		},
	};
	local lualine_minimum = {
		options = {
			icons_enabled = false,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_z = { getWords }
		},
		inactive_sections = {
		},
	};
	local themem;

	if switch then
		themem = lualine_default;
	else
		themem = lualine_minimum;
	end

	require('lualine').setup {
		opts = themem

	}
	require('lualine').refresh()
end



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
						open_pos = function()
							vim.cmd('PencilSoft');
							vim.cmd('Limelight');
							minimizeLualine(true);
							require('lualine').refresh()
						end,
						close_pos = function()
							vim.cmd('Limelight!');
							minimizeLualine(false);
							require('lualine').refresh()
						end,
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
