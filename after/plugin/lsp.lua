local lsp_zero = require('lsp-zero')

local null_ls = require('null-ls')

local null_opts = lsp_zero.build_options('null-ls', {})

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/AppData/Local/nvim/utils/linter-config/.prettierrc.json"),
      },
    }),
    null_ls.builtins.code_actions.eslint_d,
  }
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ name = "null-ls", async = false, bufnr = bufnr }) end,
    opts)
end)


lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.format_mapping('<leader>gq', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
  }
})

lsp_zero.setup()

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer', 'cssls', 'jsonls', 'html' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    -- `Super` Tab
    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
    -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    -- Navigate to the next/previous item on the list
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

    -- Go to the next/previous item in the completion menu, or trigger
    -- completion menu
    ['<C-k>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-j>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),

    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    -- Cancel completion
    ['<C-e>'] = cmp.mapping.abort(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
})
