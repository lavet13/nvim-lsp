require('ts_context_commentstring').setup({
  enable_autocmd = false,
})

require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})


-- | Key           | Action                     |
-- | ------------- | -------------------------- |
-- | `gcc`         | Toggle line comment        |
-- | `gbc`         | Toggle block comment       |
-- | `gc` (visual) | Comment selected lines     |
-- | `gb` (visual) | Block comment selection    |
-- | `gcO`         | Add comment on line above  |
-- | `gco`         | Add comment on line below  |
-- | `gcA`         | Add comment at end of line |
