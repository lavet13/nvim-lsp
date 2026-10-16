-- Capabilities: merge cmp_nvim_lsp into default capabilities for all servers
local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)
local luasnip = require("luasnip")

-- Apply capabilities and on_attach to ALL servers globally
vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, remap = false }
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Symbol highlighting
		if client and client:supports_method("textDocument/documentHighlight") then
			--- Highlight other uses of the word under the cursor.
			--- The request is async: with a 50ms updatetime, a reply for a word the
			--- cursor already LEFT can land after CursorMoved cleared, leaving two
			--- words lit. So the reply is dropped unless the cursor is still where
			--- the request was made, and old highlights are cleared before painting.
			local function highlight_word()
				local win = vim.api.nvim_get_current_win()
				local pos = vim.api.nvim_win_get_cursor(win) -- {row, col} at request time
				local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
				client:request("textDocument/documentHighlight", params, function(err, result)
					if err or not result then
						return
					end
					-- stale: cursor moved (or window changed) while the server answered
					if
						not vim.api.nvim_win_is_valid(win)
						or not vim.deep_equal(vim.api.nvim_win_get_cursor(win), pos)
					then
						return
					end
					vim.lsp.util.buf_clear_references(bufnr)
					vim.lsp.util.buf_highlight_references(bufnr, result, client.offset_encoding)
				end, bufnr)
			end

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				callback = highlight_word,
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				buffer = bufnr,
				callback = function()
					vim.lsp.util.buf_clear_references(bufnr)
				end,
			})
		end

		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float({ focus = true })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
		end)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>vri", vim.lsp.buf.implementation, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		vim.keymap.set({ "n", "x" }, "gq", function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end, opts)

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({
				lsp_format = "fallback",
				async = true,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range", buffer = bufnr })
	end,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

-- lua_ls custom config
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
		},
	},
})

-- clangd custom config
vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "lua_ls", "prismals", "cssls", "jsonls", "html", "pyright", "ruff" },
	automatic_enable = true,
})

-- Completion
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	mapping = cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-k>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<C-j>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})
