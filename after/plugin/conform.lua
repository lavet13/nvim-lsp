require("conform").setup({
	log_level = vim.log.levels.DEBUG,
	formatters = {
		prisma_format = {
			command = "prisma",
			args = { "format", "--schema", "$FILENAME" },
			stdin = false,
		},
	},
	formatters_by_ft = {
		prisma = { "prisma_format" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
})
