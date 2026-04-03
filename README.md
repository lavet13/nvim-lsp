# Neovim Keybindings Reference

> Leader key is `<Space>`

---

## General / Navigation

| Key                | Action                                 |
| ------------------ | -------------------------------------- |
| `<leader>pv`       | Open file explorer (netrw)             |
| `<C-d>`            | Scroll down, keep cursor centered      |
| `<C-u>`            | Scroll up, keep cursor centered        |
| `n` / `N`          | Next/prev search result, centered      |
| `J` (normal)       | Join line, keep cursor in place        |
| `J` / `K` (visual) | Move selected lines down/up            |
| `Q`                | Disabled (prevents accidental Ex mode) |
| `<leader><leader>` | Source current file                    |

---

## Clipboard / Editing

| Key                       | Action                                           |
| ------------------------- | ------------------------------------------------ |
| `<leader>y` / `<leader>Y` | Yank to system clipboard                         |
| `<leader>p` (visual)      | Paste without overwriting register               |
| `<leader>d`               | Delete to void register (no clipboard pollution) |
| `<C-c>` (insert)          | Escape insert mode                               |
| `<leader>s`               | Search & replace word under cursor (global)      |
| `<leader>x`               | Make current file executable (chmod +x)          |

---

## Quickfix / Location List

| Key         | Action                  |
| ----------- | ----------------------- |
| `<C-k>`     | Next quickfix item      |
| `<C-j>`     | Prev quickfix item      |
| `<leader>k` | Next location list item |
| `<leader>j` | Prev location list item |

---

## Harpoon

| Key         | Action                    |
| ----------- | ------------------------- |
| `<leader>a` | Add file to harpoon       |
| `<C-e>`     | Toggle harpoon quick menu |
| `<C-h>`     | Jump to harpoon file 1    |
| `<C-t>`     | Jump to harpoon file 2    |
| `<C-n>`     | Jump to harpoon file 3    |
| `<C-s>`     | Jump to harpoon file 4    |

---

## Telescope

| Key          | Action                         |
| ------------ | ------------------------------ |
| `<leader>pf` | Find files                     |
| `<C-p>`      | Find git files                 |
| `<leader>ps` | Grep string (prompts input)    |
| `<leader>fg` | Live grep with args            |
| `<leader>pb` | Switch between open buffers    |
| `<leader>pr` | Recently opened files          |
| `<leader>pd` | All diagnostics across project |
| `<leader>pk` | Search all keymaps             |

---

## LSP

> Active when LSP is attached to a buffer.

| Key              | Action                                  |
| ---------------- | --------------------------------------- |
| `K`              | Hover docs (press twice to enter float) |
| `gd`             | Go to definition                        |
| `gD`             | Go to declaration                       |
| `gri`            | Go to implementation                    |
| `grr`            | References                              |
| `grn`            | Rename                                  |
| `gra`            | Code action                             |
| `<leader>vws`    | Workspace symbol search                 |
| `<leader>vri`    | Go to implementation (alternative)      |
| `<leader>vd`     | Open diagnostics float (focusable)      |
| `[d`             | Next diagnostic + open float            |
| `]d`             | Prev diagnostic + open float            |
| `<leader>vca`    | Code action                             |
| `<leader>vrr`    | References                              |
| `<leader>vrn`    | Rename                                  |
| `<C-h>` (insert) | Signature help                          |
| `gq`             | Format with LSP (sync)                  |
| `<leader>f`      | Format with conform (async)             |

---

## Completion (nvim-cmp)

> Active in insert mode.

| Key               | Action                                      |
| ----------------- | ------------------------------------------- |
| `<C-Space>`       | Manually open completion menu               |
| `<Up>` / `<Down>` | Navigate completion items (select behavior) |
| `<C-k>` / `<C-j>` | Navigate completion items (insert behavior) |
| `<Tab>`           | Next completion item (insert behavior)      |
| `<S-Tab>`         | Prev completion item (insert behavior)      |
| `<CR>` (Enter)    | Confirm only if explicitly selected         |
| `<C-y>`           | Confirm and auto-select first item          |
| `<C-e>`           | Abort / close completion menu               |
| `<C-u>`           | Scroll docs up                              |
| `<C-d>`           | Scroll docs down                            |

---

## Treesitter Incremental Selection

| Key                    | Action                            |
| ---------------------- | --------------------------------- |
| `<C-Space>` (normal)   | Start selecting node under cursor |
| `<C-Space>` (visual)   | Expand selection to parent node   |
| `<Backspace>` (visual) | Shrink selection back             |

---

## Comment.nvim

| Key           | Action                     |
| ------------- | -------------------------- |
| `gcc`         | Toggle line comment        |
| `gbc`         | Toggle block comment       |
| `gc` (visual) | Comment selected lines     |
| `gb` (visual) | Block comment selection    |
| `gcO`         | Add comment on line above  |
| `gco`         | Add comment on line below  |
| `gcA`         | Add comment at end of line |

---

## Git (Fugitive)

| Key          | Action          |
| ------------ | --------------- |
| `<leader>gs` | Open Git status |

### Inside the Fugitive buffer

| Key         | Action                         |
| ----------- | ------------------------------ |
| `s`         | Stage file/hunk under cursor   |
| `u`         | Unstage file/hunk              |
| `=`         | Toggle inline diff             |
| `X`         | Discard changes                |
| `-`         | Toggle stage/unstage           |
| `dd`        | Open diff of file under cursor |
| `o`         | Open file in split             |
| `cc`        | Open commit message buffer     |
| `ca`        | Amend last commit              |
| `cw`        | Reword last commit message     |
| `<leader>p` | Git push                       |
| `<leader>P` | Git pull                       |
| `<leader>t` | Push with upstream tracking    |

---

## Undotree

| Key         | Action          |
| ----------- | --------------- |
| `<leader>u` | Toggle Undotree |

### Inside Undotree

| Key       | Action                      |
| --------- | --------------------------- |
| `j` / `k` | Navigate undo states        |
| `<CR>`    | Jump to selected undo state |
| `p`       | Preview diff of that state  |
| `q`       | Close Undotree              |

---

## Cloak (secret masking in .env files)

| Command         | Action                         |
| --------------- | ------------------------------ |
| `:CloakToggle`  | Toggle cloaking on/off         |
| `:CloakEnable`  | Enable cloaking                |
| `:CloakDisable` | Temporarily reveal all secrets |

---

## WezTerm

| Key             | Action                  |
| --------------- | ----------------------- |
| `<C-S-\|>`      | Split pane horizontally |
| `<C-S-Minus>`   | Split pane vertically   |
| `<C-S-h/l/k/j>` | Navigate between panes  |
| `<C-S-Arrows>`  | Resize panes            |
| `<C-S-N>`       | New window              |

---

## Misc

| Key           | Action                                 |
| ------------- | -------------------------------------- |
| `<C-f>`       | Open tmux sessionizer (WSL/Linux only) |
| `<leader>mr`  | Cellular Automaton make it rain        |
| `<leader>vpp` | Open packer.lua directly               |
