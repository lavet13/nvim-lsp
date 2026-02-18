-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
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
	})

	use("nvim-treesitter/playground")

	use("theprimeagen/harpoon")

	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	use("nvim-treesitter/nvim-treesitter-context")

  use("neovim/nvim-lspconfig")
  use("mason-org/mason.nvim")
  use("mason-org/mason-lspconfig.nvim")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip")

	use("laytan/cloak.nvim")

	use("stevearc/conform.nvim")

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("erikbackman/brightburn.vim")
end)
