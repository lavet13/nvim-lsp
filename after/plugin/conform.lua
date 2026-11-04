require("conform").setup({
	log_level = vim.log.levels.DEBUG,
	formatters = {
		prisma_format = {
			-- search upward from the buffer for node_modules/.bin/prisma,
			-- falling back to a plain "prisma" on PATH
			command = require("conform.util").from_node_modules("prisma"),
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
		python = { "ruff_format" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
})
