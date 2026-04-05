-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.3",
		lazy = false,
		build = ":TSUpdate",
		config = function()
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
						init_selection = "<C-Space>", -- start selection at cursor
						node_incremental = "<C-Space>", -- expand to next syntax node
						node_decremental = "<bs>", -- shrink back (backspace)
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
	},
	"lewis6991/gitsigns.nvim",
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = false,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "personal",
						path = "C:/Users/Ivan/notes/personal",
					},
					{
						name = "donbass-post",
						path = "C:/Users/Ivan/notes/donbass-post",
					},
					{
						name = "donbass-tour",
						path = "C:/Users/Ivan/notes/donbass-tour",
					},
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_italics = true,
				highlight_groups = {
					Comment = { italic = true },
				},
			})
		end,
	},
	"theprimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"nvim-treesitter/nvim-treesitter-context",
	"neovim/nvim-lspconfig",
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"laytan/cloak.nvim",
	"stevearc/conform.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"kylechui/nvim-surround",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"erikbackman/brightburn.vim",
})
