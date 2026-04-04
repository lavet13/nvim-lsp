local luasnip = require("luasnip");

require("luasnip.loaders.from_vscode").lazy_load({
  paths = vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets"
});

luasnip.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

-- Jump forward through snippet placeholders
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end)

-- Jump backward through snippet placeholders
vim.keymap.set({ "i", "s" }, "<C-b>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)
