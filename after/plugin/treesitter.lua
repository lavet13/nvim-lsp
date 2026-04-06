require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"vimdoc",
		"javascript",
		"typescript",
		"c",
		"lua",
		"rust",
		"graphql",
		"tsx",
		"html",
		"vim",
		"yaml",
	},
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	indent = {
		enable = true,
		disable = {},
	},
	highlight = {
		enable = true,
		disable = { "php" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-o>", -- start selection at cursor
			node_incremental = "<A-o>", -- expand to next syntax node
			scope_incremental = "<A-O>", -- scope
			node_decremental = "<A-i>", -- shrink back (backspace)
		},
	},
})
