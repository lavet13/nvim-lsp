# Neovim Dotfiles Reference

---

## Installation (Windows)

### Prerequisites

Install all prerequisites via Chocolatey in PowerShell as Administrator:

```bash
# Package manager
choco install chocolatey

# Core
choco install neovim --version=0.11.6
choco install git
choco install nodejs
choco install ripgrep        # required for Telescope live grep
choco install make           # required for some treesitter parsers

# Optional but recommended
choco install stylua         # Lua formatter (used by conform.nvim)
choco install python         # required for some LSP servers
```

> To install a specific Neovim version in the future:
>
> ```bash
> choco install neovim --version=X.X.X
> ```
>
> To upgrade to latest:
>
> ```bash
> choco upgrade neovim
> ```

---

### Neovim Config Location (Windows)

Your config lives at:

```
%LOCALAPPDATA%\nvim\
# Which resolves to:
C:\Users\YourName\AppData\Local\nvim\
```

---

### Clone Dotfiles

The repo IS the Neovim config — clone it directly into the `nvim` folder:

```bash
cd $LOCALAPPDATA
git clone -c core.symlinks=true <your-repo-url> nvim
```

No symlinking needed. Neovim will pick it up automatically.

---

### Repo Structure

```
nvim/  (this IS the repo)
├── README.md
├── init.lua
├── after/
│   └── plugin/
│       ├── cloak.lua
│       ├── colors.lua
│       ├── commentary.lua
│       ├── conform.lua
│       ├── fugitive.lua
│       ├── gitsigns.lua
│       ├── harpoon.lua
│       ├── lsp.lua
│       ├── luasnip.lua
│       ├── rose-pine.lua
│       ├── surround.lua
│       ├── telescope.lua
│       └── undotree.lua
├── lua/
│   └── lavet13/
│       ├── init.lua
│       ├── lazy.lua
│       ├── remap.lua
│       └── set.lua
└── plugin/
    └── packer_compiled.lua
```

---

### Install Lazy.nvim (Plugin Manager)

Lazy.nvim installs itself automatically on first Neovim launch via the bootstrap code in `lazy.lua`. Just open Neovim after cloning and run:

```
:Lazy sync
```

---

### Lazy Commands

| Command         | Action                            |
| --------------- | --------------------------------- |
| `:Lazy`         | Open Lazy UI                      |
| `:Lazy sync`    | Install + update all plugins      |
| `:Lazy install` | Install missing plugins only      |
| `:Lazy update`  | Update installed plugins          |
| `:Lazy clean`   | Remove unused plugins             |
| `:Lazy restore` | Restore plugins to lockfile state |

---

### Install LSP Servers via Mason

Open Neovim and run:

```
:Mason
```

Your config auto-installs these via `ensure_installed`:

- `ts_ls` — TypeScript/JavaScript
- `lua_ls` — Lua
- `prismals` — Prisma
- `cssls` — CSS
- `jsonls` — JSON
- `html` — HTML

---

## WezTerm Setup (Windows)

### Current Version

```
wezterm 20260331-040028-577474d8 (nightly)
```

### Install WezTerm

**Stable** (latest stable as of writing: `20240203-110809-5046fc22`):

```bash
choco install wezterm
```

**Nightly** (recommended — stable has not been updated since February 2024):

Download the nightly `.exe` installer directly from:

```
https://github.com/wezterm/wezterm/releases/tag/nightly
```

---

### WezTerm Config Location

WezTerm loads config from `~/.wezterm.lua` on Windows.

### Creating Symlinks via Git Bash

> **Note:** Windows paths are written as `/c/` instead of `C:\` in Git Bash.
> The wezterm config lives inside the nvim repo at `~/appdata/local/nvim/.wezterm/`.

**Symlink for the config file:**

```bash
ln -s ~/appdata/local/nvim/.wezterm/wezterm.lua ~/.wezterm.lua
```

**Symlink for the themes folder:**

```bash
ln -s ~/appdata/local/nvim/.wezterm/themes ~/.wezterm/themes
```

### Enable Symlinks in Git

```bash
# When cloning
git clone -c core.symlinks=true <your-repo-url>

# Or on an existing repo
git config core.symlinks true
```

### Enable Developer Mode (allows symlinks without admin)

`Settings → Privacy & Security → For Developers → Developer Mode → On`

---

## Keybindings Reference

> Leader key is `<Space>`

---

### General / Navigation

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

### Clipboard / Editing

| Key                       | Action                                           |
| ------------------------- | ------------------------------------------------ |
| `<leader>y` / `<leader>Y` | Yank to system clipboard                         |
| `<leader>p` (visual)      | Paste without overwriting register               |
| `<leader>d`               | Delete to void register (no clipboard pollution) |
| `<C-c>` (insert)          | Escape insert mode                               |
| `<leader>s`               | Search & replace word under cursor (global)      |
| `<leader>x`               | Make current file executable (chmod +x)          |

---

### Quickfix / Location List

| Key         | Action                  |
| ----------- | ----------------------- |
| `<C-k>`     | Next quickfix item      |
| `<C-j>`     | Prev quickfix item      |
| `<leader>k` | Next location list item |
| `<leader>j` | Prev location list item |

---

### Harpoon

| Key         | Action                    |
| ----------- | ------------------------- |
| `<leader>a` | Add file to harpoon       |
| `<C-e>`     | Toggle harpoon quick menu |
| `<C-h>`     | Jump to harpoon file 1    |
| `<C-t>`     | Jump to harpoon file 2    |
| `<C-n>`     | Jump to harpoon file 3    |
| `<C-s>`     | Jump to harpoon file 4    |

---

### Telescope

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

### LSP

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

### Completion (nvim-cmp)

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

### LuaSnip (Snippets)

> Requires `friendly-snippets` and `cmp_luasnip` installed.

| Key                     | Action                                              |
| ----------------------- | --------------------------------------------------- |
| `<C-l>` (insert/select) | Expand snippet or jump forward through placeholders |
| `<C-b>` (insert/select) | Jump backward through placeholders                  |

#### Common React/TSX Snippet Triggers

| Trigger     | Expands to                                 |
| ----------- | ------------------------------------------ |
| `rafce`     | React arrow function component with export |
| `rafc`      | React arrow function component             |
| `rfc`       | React functional component                 |
| `useState`  | `const [state, setState] = useState()`     |
| `useEffect` | `useEffect(() => {}, [])`                  |
| `imp`       | import statement                           |
| `imd`       | destructured import                        |

---

### Treesitter Incremental Selection

> Pinned to nvim-treesitter v0.9.3 for incremental selection support.

| Key                    | Action                            |
| ---------------------- | --------------------------------- |
| `<C-Space>` (normal)   | Start selecting node under cursor |
| `<C-Space>` (visual)   | Expand selection to parent node   |
| `<Backspace>` (visual) | Shrink selection back             |

---

### Comment.nvim

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

### nvim-surround

> `ys` waits for a motion then a surrounding character — it's a 3 part command.
> Think of it like `d` needing `dw`, `dd` etc.

#### Add surrounding — `ys{motion}{char}`

| Key     | Action                                     |
| ------- | ------------------------------------------ |
| `ysiw"` | Surround word under cursor with `"`        |
| `ysiw)` | Surround word under cursor with `()`       |
| `yss"`  | Surround entire line with `"`              |
| `ySS"`  | Surround entire line with `"` on new lines |

#### Change surrounding — `cs{old}{new}`

| Key      | Action                             |
| -------- | ---------------------------------- |
| `cs"'`   | Change `"` to `'`                  |
| `cs'`` ` | Change `'` to `` ` ``              |
| `cs)]`   | Change `)` to `]`                  |
| `cst"`   | Change surrounding HTML tag to `"` |

#### Delete surrounding — `ds{char}`

| Key   | Action                      |
| ----- | --------------------------- |
| `ds"` | Delete surrounding `"`      |
| `ds)` | Delete surrounding `()`     |
| `dst` | Delete surrounding HTML tag |

#### Visual mode — select text then `S{char}`

| Key      | Action                          |
| -------- | ------------------------------- |
| `S"`     | Wrap selection in `"`           |
| `S)`     | Wrap selection in `()`          |
| `S<div>` | Wrap selection in `<div></div>` |

---

### Gitsigns

| Key          | Action          |
| ------------ | --------------- |
| `]h`         | Next hunk       |
| `[h`         | Prev hunk       |
| `<leader>hs` | Stage hunk      |
| `<leader>hr` | Reset hunk      |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk    |
| `<leader>hb` | Blame line      |
| `<leader>hd` | Diff this       |

---

### Git (Fugitive)

| Key          | Action          |
| ------------ | --------------- |
| `<leader>gs` | Open Git status |

#### Inside the Fugitive buffer

| Key         | Action                                     |
| ----------- | ------------------------------------------ |
| `s`         | Stage file/hunk under cursor               |
| `u`         | Unstage file/hunk                          |
| `=`         | Toggle inline diff                         |
| `X`         | Discard changes                            |
| `-`         | Toggle stage/unstage                       |
| `dd`        | Open diff of file under cursor             |
| `o`         | Open file in split                         |
| `cc`        | Open commit message buffer                 |
| `ca`        | Amend last commit (message + staged files) |
| `cw`        | Reword last commit message only            |
| `<leader>p` | Git push                                   |
| `<leader>P` | Git pull                                   |
| `<leader>t` | Push with upstream tracking                |

> **Force push** (only safe when you're the sole contributor):
>
> ```
> :Git push --force
> ```

---

### Undotree

| Key         | Action          |
| ----------- | --------------- |
| `<leader>u` | Toggle Undotree |

#### Inside Undotree

| Key       | Action                      |
| --------- | --------------------------- |
| `j` / `k` | Navigate undo states        |
| `<CR>`    | Jump to selected undo state |
| `p`       | Preview diff of that state  |
| `q`       | Close Undotree              |

---

### Cloak (secret masking in .env files)

| Command         | Action                         |
| --------------- | ------------------------------ |
| `:CloakToggle`  | Toggle cloaking on/off         |
| `:CloakEnable`  | Enable cloaking                |
| `:CloakDisable` | Temporarily reveal all secrets |

---

### WezTerm

| Key             | Action                  |
| --------------- | ----------------------- |
| `<C-S-\|>`      | Split pane horizontally |
| `<C-S-Minus>`   | Split pane vertically   |
| `<C-S-h/l/k/j>` | Navigate between panes  |
| `<C-S-Arrows>`  | Resize panes            |
| `<C-S-N>`       | New window              |

---

### Misc

| Key           | Action                                 |
| ------------- | -------------------------------------- |
| `<C-f>`       | Open tmux sessionizer (WSL/Linux only) |
| `<leader>mr`  | Cellular Automaton make it rain 🌧️     |
| `<leader>vpp` | Open packer.lua directly               |
