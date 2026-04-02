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

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>pf` | Find files                  |
| `<C-p>`      | Find git files              |
| `<leader>ps` | Grep string (prompts input) |
| `<leader>fg` | Live grep with args         |

---

## LSP

> Active when LSP is attached to a buffer.

| Key              | Action                                  |
| ---------------- | --------------------------------------- |
| `K`              | Hover docs (press twice to enter float) |
| `gd`             | Go to definition                        |
| `gD`             | Go to declaration                       |
| `grr`            | References                              |
| `grn`            | Rename                                  |
| `gra`            | Code action                             |
| `<leader>vws`    | Workspace symbol search                 |
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

---

## Misc

| Key           | Action                                 |
| ------------- | -------------------------------------- |
| `<C-f>`       | Open tmux sessionizer (WSL/Linux only) |
| `<leader>mr`  | Cellular Automaton make it rain 🌧️     |
| `<leader>vpp` | Open packer.lua directly               |
