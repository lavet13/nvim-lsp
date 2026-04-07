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
git clone <your-repo-url> nvim
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
│       ├── obsidian.lua
│       ├── rose-pine.lua
│       ├── surround.lua
│       ├── telescope.lua
│       ├── textobjects.lua
│       ├── todo-comments.lua
│       └── undotree.lua
└── lua/
    └── lavet13/
        ├── init.lua
        ├── lazy.lua
        ├── remap.lua
        └── set.lua
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

> **Note:** `~` doesn't expand inside Neovim's `:!` commands on Windows.
> Run these from Git Bash directly using `cmd //c`.

**Symlink for the config file (file — use mklink):**

```bash
cmd //c "mklink %USERPROFILE%\.wezterm.lua %USERPROFILE%\appdata\local\nvim\.wezterm\wezterm.lua"
```

**Symlink for the themes folder (directory — use mklink /j):**

```bash
cmd //c "mklink /j %USERPROFILE%\.wezterm\themes %USERPROFILE%\appdata\local\nvim\.wezterm\themes"
```

> `/j` creates a directory junction which doesn't require admin privileges.

---

## Notes & Task Management

### Obsidian.nvim (Personal Notes)

Obsidian is for **personal notes and ideas** that live outside the codebase. Notes are stored as markdown files in dedicated workspace folders.

#### Setup

Create your workspace folders:

```bash
mkdir -p ~/notes/personal ~/notes/project1 ~/notes/project2
```

Add to `set.lua` for proper markdown rendering inside Neovim:

```lua
vim.opt.conceallevel = 2
```

A good starting structure per workspace:

```
project1/
├── ideas.md        -- random ideas dump
├── architecture.md -- technical decisions
└── bugs.md         -- known issues and findings
```

> You can delete the auto-generated frontmatter (`id`, `aliases`, `tags`) if you don't need it — obsidian.nvim works fine without it for basic note taking. Keeping `aliases` with the note's own name causes self-referencing in backlinks, so either clear it or remove the frontmatter entirely.

#### Workspaces

| Workspace  | Purpose                                                 |
| ---------- | ------------------------------------------------------- |
| `personal` | Personal thoughts, ideas, anything not project-specific |
| `project1` | Notes for project 1                                     |
| `project2` | Notes for project 2                                     |

Switch between workspaces with `<leader>ow`.

#### Keymaps

| Key          | Action                                               |
| ------------ | ---------------------------------------------------- |
| `<leader>on` | Create new note                                      |
| `<leader>oo` | Open note                                            |
| `<leader>os` | Search notes in current workspace                    |
| `<leader>oq` | Quick switch between notes (full Telescope picker)   |
| `<leader>ob` | Show backlinks — notes that link TO the current note |
| `<leader>ow` | Switch workspace                                     |

#### Linking Notes

Type `[[` then start typing the note name — obsidian triggers its own completion picker (separate from nvim-cmp). You must type at least 1-2 characters to get results.

| Key                  | Action                                       |
| -------------------- | -------------------------------------------- |
| `[[` + typing        | Link to another note (obsidian autocomplete) |
| `gf` on a `[[link]]` | Jump to that note                            |
| `<leader>ob`         | Show all notes that link TO current note     |

> **Backlinks explained:** `<leader>ob` shows notes that contain a `[[link]]` pointing to the current note. If your cursor is ON a `[[link]]`, obsidian shows backlinks for that linked note instead. When cursor is elsewhere, it shows backlinks for the current note.

> **Quick switch tip:** Use `<leader>oq` instead of `[[` when you want to see all notes immediately without typing — it opens a full Telescope picker.

---

### todo-comments.nvim (Shared Notes in Codebase)

Todo comments are for **notes inside the codebase** — visible to everyone who opens the project. Highlighted in different colors based on type.

#### Comment Types

| Tag     | Aliases                             | Color  | Purpose                          |
| ------- | ----------------------------------- | ------ | -------------------------------- |
| `TODO:` | —                                   | Blue   | Things that need to be done      |
| `FIX:`  | `FIXME:` `BUG:` `FIXIT:` `ISSUE:`   | Red    | Broken things that need fixing   |
| `HACK:` | —                                   | Yellow | Temporary workaround             |
| `WARN:` | `WARNING:` `XXX:`                   | Yellow | Be careful here                  |
| `PERF:` | `OPTIM:` `PERFORMANCE:` `OPTIMIZE:` | Purple | Performance concern              |
| `NOTE:` | `INFO:`                             | Green  | Important context or explanation |
| `TEST:` | `TESTING:` `PASSED:` `FAILED:`      | Pink   | Test-related notes               |

#### Usage example

```typescript
// TODO: add input validation here
// FIXME: this crashes when user has no avatar, needs null check
// NOTE: this component re-renders on every keystroke, intentional
// HACK: using setTimeout because the animation library has no callback
// WARN: changing this function signature breaks three other components
```

#### Keymaps

| Key          | Action                                    |
| ------------ | ----------------------------------------- |
| `<leader>td` | Search all TODOs in project via Telescope |
| `[t`         | Jump to next TODO                         |
| `]t`         | Jump to prev TODO                         |

> **Tip:** Use `<leader>td` before a PR to review all leftover TODOs and FIXMEs across the entire project in one Telescope window.

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
> Neovim 0.12 is expected to bring native incremental selection — migration planned then.

| Key              | Action                            |
| ---------------- | --------------------------------- |
| `<A-o>` (normal) | Start selecting node under cursor |
| `<A-o>` (visual) | Expand selection to parent node   |
| `<A-i>` (visual) | Shrink selection back             |

---

### nvim-treesitter-textobjects

> Syntax-aware text objects powered by treesitter.
> Works as motions — composable with nvim-surround, `d`, `y`, `c` etc.
>
> Functions and classes are selected **linewise** (`V`) — the entire line(s) are
> included, which makes delete/yank/paste cleaner for block-level constructs.
> Parameters are selected charwise as usual.

#### Select text objects (visual / operator pending)

| Key  | Action                                      |
| ---- | ------------------------------------------- |
| `af` | Around function (entire function)           |
| `if` | Inner function (body only)                  |
| `ac` | Around class                                |
| `ic` | Inner class                                 |
| `aa` | Around argument/parameter                   |
| `ia` | Inner argument/parameter                    |
| `as` | Around scope (function, if, for block etc.) |

#### Move between text objects

| Key  | Action                     |
| ---- | -------------------------- |
| `]f` | Next function start        |
| `[f` | Prev function start        |
| `]M` | Next function end          |
| `[M` | Prev function end          |
| `]c` | Next class start           |
| `[c` | Prev class start           |
| `][` | Next class end             |
| `[]` | Prev class end             |
| `]a` | Next parameter start       |
| `[a` | Prev parameter start       |
| `]A` | Next parameter end         |
| `[A` | Prev parameter end         |
| `]o` | Next loop (inner or outer) |
| `[o` | Prev loop (inner or outer) |
| `]i` | Next conditional (if/else) |
| `[i` | Prev conditional (if/else) |

> **`]i` / `[i` note:** Uses `goto_next` (not `goto_next_start`) — lands on whichever
> boundary of the conditional (start or end) is closest to your cursor.

#### Repeatable move

> `;` and `,` repeat the last textobject jump — same direction or opposite.
> `f`, `F`, `t`, `T` are also part of this system so everything is unified.

| Key | Action                      |
| --- | --------------------------- |
| `;` | Repeat last move (forward)  |
| `,` | Repeat last move (backward) |

#### Swap parameters

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>sa` | Swap parameter with next     |
| `<leader>sA` | Swap parameter with previous |

#### nvim-surround combinations

| Key           | Action                                   |
| ------------- | ---------------------------------------- |
| `ysaf"`       | Surround entire function with `"`        |
| `ysif)`       | Surround function body with `()`         |
| `ysac<div>`   | Surround entire class with `<div></div>` |
| `ysaa"`       | Surround entire argument with `"`        |
| `dsaf`        | Delete surrounding of entire function    |
| `vaf then S"` | Select function then surround with `"`   |

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

> **Space rule:** opening delimiter adds spaces, closing does not.
> `ysiw(` → `( word )` — `ysiw)` → `(word)`. Same applies to `[`/`]` and `{`/`}`.

> **Quote alias:** `q` matches the nearest set of quotes regardless of type (`` ` ``, `'`, `"`).
> Useful when you don't know or care which quote type you're inside — `csqb` replaces
> the nearest quotes with parentheses, `dsq` deletes them.

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
| `csqb`   | Change nearest quotes to `()`      |

#### Delete surrounding — `ds{char}`

| Key   | Action                                                                   |
| ----- | ------------------------------------------------------------------------ |
| `ds"` | Delete surrounding `"`                                                   |
| `ds)` | Delete surrounding `()`                                                  |
| `dst` | Delete surrounding HTML tag                                              |
| `dsf` | Delete surrounding function call, keeping arguments — `foo(bar)` → `bar` |
| `dsq` | Delete nearest quotes (any type)                                         |

#### Visual mode — select text then `S{char}`

| Key      | Action                          |
| -------- | ------------------------------- |
| `S"`     | Wrap selection in `"`           |
| `S)`     | Wrap selection in `()`          |
| `S<div>` | Wrap selection in `<div></div>` |

#### Insert mode

| Key      | Action                                     |
| -------- | ------------------------------------------ |
| `<C-g>s` | Add surrounding around cursor position     |
| `<C-g>S` | Add surrounding on new lines around cursor |

---

### Gitsigns

| Key          | Action          |
| ------------ | --------------- |
| `[h`         | Prev hunk       |
| `]h`         | Next hunk       |
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

### Splits & Windows

> These are built-in Neovim commands — no plugin required.
> Note: `<C-S-h/l/k/j>` in the WezTerm section navigates terminal _panes_ — a different thing.

| Key            | Action                       |
| -------------- | ---------------------------- |
| `<C-w>s`       | Horizontal split             |
| `<C-w>v`       | Vertical split               |
| `<C-w>h/j/k/l` | Move between splits          |
| `<C-w>H/J/K/L` | Move split to edge of screen |
| `<C-w>=`       | Equalize all split sizes     |
| `<C-w>_`       | Maximize split height        |
| `<C-w>\|`      | Maximize split width         |
| `<C-w>q`       | Close current split          |
| `<C-w>o`       | Close all other splits       |

---

### Marks

> Marks let you set named positions you can jump back to — within a file or globally.

| Key           | Action                                      |
| ------------- | ------------------------------------------- |
| `m{a-z}`      | Set a local mark (file-scoped)              |
| `m{A-Z}`      | Set a global mark (works across files)      |
| `` `{mark} `` | Jump to exact mark position (line + column) |
| `'{mark}`     | Jump to mark line (first non-blank)         |
| `''`          | Jump back to position before last jump      |
| `<C-o>`       | Go back in jump history                     |
| `<C-i>`       | Go forward in jump history                  |
| `:marks`      | List all marks                              |

> **Local vs global:** lowercase marks (`ma`) only work in the file they were set in.
> Uppercase marks (`mA`) jump to the right file automatically — useful as cross-file bookmarks.
> Combine with harpoon: harpoon for files you're actively working across, marks for
> positions within a single file you keep returning to.

---

### Macros

> Macros record a sequence of keystrokes into a register and replay them on demand.
> The most powerful built-in tool for repetitive structural edits.

| Key         | Action                              |
| ----------- | ----------------------------------- |
| `q{a-z}`    | Start recording macro into register |
| `q`         | Stop recording                      |
| `@{a-z}`    | Play macro                          |
| `@@`        | Repeat last played macro            |
| `{N}@{a-z}` | Play macro N times                  |
| `:reg`      | View all registers and macros       |

> **Tip:** Record into `q` as your scratch register (`qq` to start, `q` to stop, `@q` to play).
> Use named registers (`a`–`z`) for macros you want to keep across the session.
> `{N}@q` is the most common pattern — e.g. `10@q` to repeat an edit on 10 lines.

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
