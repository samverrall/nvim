-- PRETTIER
require'prettier'.setup()

-- TREESITTER
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "lua", "vim", "go", "javascript", "typescript", "rust"},
	highlight = {
		enable = true,
	}
}

-- GRUVBOX
require("gruvbox").setup({
	contrast = "hard",
	palette_overrides = {
		gray = "#2ea542",
		dark0_hard = "#000000"
	}
})

-- LUALINE
require("lualine").setup{
	options = {
		icons_enabled = false,
		theme = "onedark",
		component_separators = "|",
		section_separators = "",
	},
}

-- COMMENT
require("nvim_comment").setup({
	operator_mapping = "<leader>c"
})

-- TERMINAL SETUP
require("toggleterm").setup{
	direction = "horizontal",
	size = 15,
	open_mapping = [[<leader>tt]]
}


