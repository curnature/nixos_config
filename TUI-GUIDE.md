# TUI and terminal tools: a quick guide

Inventory checked on 2026-10-10 against the active configuration and installed
commands on `omen`.

A **TUI** is an interactive text interface inside a terminal. Several tools in
your TUI modules are actually **CLI helpers**: they print results and exit. This
guide covers both, plus the editors and interactive system tools declared
elsewhere. It does not list every compiler, media utility, or dependency.

Use a normal Zsh terminal, such as Kitty, for the aliases and shell shortcuts
below. Most tools also run inside VS Code's terminal. A `nix develop` shell may
use Bash and will not necessarily inherit your Zsh aliases.

## 1. Interactive tools

### btop — system monitor

Shows live CPU, memory, disk, network, and process activity. Useful when the
machine feels slow or you want to find a resource-heavy process.

```bash
btop
btop --filter firefox
```

Press `q` to quit. Your configuration makes the background transparent. GPU
statistics depend on the GPU, driver, permissions, and package support; they are
not guaranteed to appear for every device. [Documentation](https://github.com/aristocratos/btop).

### Yazi — file manager

Browse directories with previews and open, copy, or move files without leaving
the terminal.

```bash
y /home/curvature/nixos_config
```

Use arrow keys or `h/j/k/l` to navigate, `Enter` to open, and `F1` for help.
Press `q` to quit and leave your shell in the selected directory; `Q` quits
without changing the shell directory. Your `y` wrapper enables this behavior.
Plain `yazi` does not change the parent shell's directory. Hidden files are
already shown, with directories sorted first. [Quick start](https://yazi-rs.github.io/docs/quick-start/).

### Lazygit — visual Git interface

Inspect changes, browse commits and branches, and perform Git operations from
panels instead of remembering every command.

```bash
lazygit --path /home/curvature/nixos_config
```

Inside a repository, your shortcut is `lg`. Use arrow keys to select items,
`?` for keybindings, and `q` to quit. Start by reviewing diffs; staging,
committing, discarding, and resetting are real Git operations, not previews.
[Documentation](https://github.com/jesseduffield/lazygit).

### fzf — fuzzy selection

Interactively select an item from a list by typing part of its name. This
example prints the selected file path; it does not open or modify the file:

```bash
fd -t f . /home/curvature/nixos_config | fzf
```

Use arrows to move, `Enter` to select, and `Esc` to cancel. Your Zsh integration
also provides `Ctrl+R` for command-history search and `Ctrl+T` to insert a
selected file path at the prompt. [Documentation](https://github.com/junegunn/fzf).

### CAVA — audio visualizer

Draws animated frequency bars while audio plays in another application. It
visualizes sound; it is not a music player.

```bash
cava
```

Press `q` to quit. Your configuration uses a color gradient, 60 FPS, and
automatically sized bars. If nothing moves, check audio playback and CAVA's
input selection. [Documentation](https://github.com/karlstav/cava#usage).

### PowerTOP — power and activity inspector

Inspect wakeups, device activity, and power-saving opportunities. Useful for
laptop battery investigations; power estimates may need sufficient battery data.

```bash
sudo powertop
```

Use `Tab` to switch pages and `q` to quit. For observation, leave **Tunables**
unchanged. Toggling them, using `--auto-tune`, or running `--calibrate` is not
passive inspection and can affect devices or workload behavior.
[Documentation](https://github.com/fenrus75/powertop/blob/master/README.md).

## 2. Terminal editors

These examples use a temporary notes file. It is created or changed only if
you save it.

| Editor | What it does | Try it | Essential controls |
| --- | --- | --- | --- |
| Vim | Modal editor; currently your configured default `EDITOR` and `VISUAL`. | `vim /tmp/tui-notes.txt` | `i` starts typing; `Esc` returns to normal mode; `:wq` saves and exits; `:q!` exits and discards unsaved changes. |
| Neovim | Extensible Vim-family editor, supplied by your separate `my-neovim` flake. | `nvim /tmp/tui-notes.txt` | Same basic controls as Vim. Custom plugin shortcuts are defined by that external configuration, not this guide. |
| nano | Simple editor with shortcut hints displayed at the bottom. | `nano /tmp/tui-notes.txt` | `Ctrl+O`, then `Enter` saves; `Ctrl+X` exits. |

For a read-only starting view, use `vim -R /home/curvature/nixos_config/flake.nix`
or `nano --view /home/curvature/nixos_config/flake.nix`.

## 3. Command-line helpers

These are useful terminal companions, but most are not full-screen TUIs.

| Tool | What it does | Simple example |
| --- | --- | --- |
| bat | Displays text with syntax highlighting and line numbers. | `bat -n /home/curvature/nixos_config/flake.nix` |
| eza | Lists files with richer metadata, icons, and optional tree layout. | `eza -la --icons=auto /home/curvature/nixos_config` |
| zoxide | Learns directories you visit so you can jump to them by a short name. | Visit with `z /home/curvature/nixos_config`, then later use `z nixos_config`; `zi` opens an interactive chooser. |
| ripgrep (`rg`) | Searches **file contents**, recursively, with line-number output. | `rg -n 'mutableUserSettings' /home/curvature/nixos_config/home` |
| fd | Finds **file names or paths**, rather than searching their contents. | `fd -e nix . /home/curvature/nixos_config` |
| tldr | Shows short, practical command examples instead of a long manual. | `tldr tar` or `tldr git-log` |
| delta | Makes diffs easier to read with highlighting and optional side-by-side layout. | See the Git examples below. |
| git-graph | Prints a graph of commits, branches, and merges. It is a history viewer, not a Git editor. | `git-graph --path /home/curvature/nixos_config --model simple --max-count 30` |
| GitHub CLI (`gh`) | Reads and manages GitHub repositories, issues, pull requests, and Actions. | `gh auth status`; inside a GitHub repository, `gh issue list` or `gh pr list`. |
| Fastfetch | Prints a one-time summary of your system, hardware, and desktop. | `fastfetch` |
| Pay Respects | Suggests corrections for failed or mistyped commands. | `pay-respects --help` explains setup; see the integration caveat below. |

Useful details for your setup:

- **bat:** `cat` is already aliased to `bat`. Press `q` if its pager opens;
    use `bat --paging=never FILE` to print directly.
- **eza:** `tree -L 2 /home/curvature/nixos_config` uses your eza-based tree
    alias and limits the listing to two levels.
- **zoxide:** `cd` is aliased to `z`; short-name jumps work best after visiting
    the directory. The interactive `zi` command uses fzf.
- **rg / fd:** by default they skip hidden and ignored files. Add `--hidden`
    to include hidden entries, or `--no-ignore` when you deliberately need
    ignored files as well.
- **tldr:** your installed client is the Python implementation, not tealdeer.
    It may download and cache pages. `tldr --update` refreshes its page cache;
    it does not update your NixOS packages.
- **delta:** installed, but not explicitly configured as Git's default pager
    in this repository. Piping a diff into it works without changing Git settings.
- **git-graph:** first launch can create its own model/config directory.
    The example above does not change your repository or its history.
- **gh:** online commands may require GitHub login. `gh auth login` performs
    that setup if needed. Review write operations before using them.
- **Fastfetch:** already runs when your normal configured Zsh starts.
- **Pay Respects:** installed, but shell integration is **not configured**.
    Do not assume an `f` correction shortcut exists. If you enable integration
    later, review suggested commands: error detection can rerun the failed command.

References: [zoxide](https://github.com/ajeetdsouza/zoxide),
[Python tldr client](https://github.com/tldr-pages/tldr-python-client#usage),
[delta](https://dandavison.github.io/delta/usage.html),
[git-graph CLI source](https://github.com/git-bahn/git-graph/blob/v0.8.0/src/main.rs),
[GitHub CLI](https://cli.github.com/manual/),
[Pay Respects](https://github.com/iffse/pay-respects).

### Two useful combinations

Review unstaged changes with Delta:

```bash
git -C /home/curvature/nixos_config --no-pager diff | delta
```

Review staged changes side by side:

```bash
git -C /home/curvature/nixos_config --no-pager diff --cached | delta --side-by-side
```

Both commands only display diffs; press `q` if a pager opens. An empty display
can simply mean there are no changes in the selected category.

## 4. Network and Bluetooth tools

### nmtui — NetworkManager's text menus

Installed through your enabled NetworkManager service. Useful for choosing
Wi-Fi connections or editing network profiles without a graphical settings app.

```bash
nmtui
```

Navigate with arrows and `Tab`, select with `Enter`, and choose **Quit** when
done. Activating/deactivating a connection or saving edits changes networking;
be especially careful during remote sessions.
[Manual](https://networkmanager.pages.freedesktop.org/NetworkManager/NetworkManager/nmtui.html).

### bluetoothctl — Bluetooth command prompt

An interactive CLI rather than a full-screen TUI. Inspect your adapter and known
devices with:

```bash
bluetoothctl show
bluetoothctl devices
```

For an interactive session, run `bluetoothctl`, then enter `show`, `devices`,
and `quit`. Pairing, connecting, or removing devices are separate actions that
change Bluetooth state.

## 5. Just for fun

| Tool | What it does | Example | Exit |
| --- | --- | --- | --- |
| cmatrix | Animated falling characters, like the Matrix films. | `cmatrix -s -C cyan` | Any key exits this screensaver mode; normal `cmatrix` uses `q`. |
| cbonsai | Grows randomly generated text-art bonsai trees. | `cbonsai -S -m "Take a break"` | Any key exits this screensaver mode. |

These are decorations, **not secure screen locks**.
[cmatrix documentation](https://github.com/abishekvashok/cmatrix#-usage),
[cbonsai documentation](https://gitlab.com/jallbrit/cbonsai).

## 6. DSH: terminal-launched, browser-based workflow

DSH is also installed declaratively, but your verified workflow is its web UI,
not a full-screen terminal interface:

```bash
cd /home/curvature/Projects/nodejs
nix develop --no-update-lock-file
dsh web
```

Open the local URL printed by the server. Use the installed `dsh`, not an
unrelated `npx` download, and do not start a second instance against an already
running profile. Its agent can use tools or modify files, so give it a clear
scope and review approvals. Your repair and maintenance notes are in
[DSH-NIXOS-FIX.md](/home/curvature/Projects/nodejs/DSH-NIXOS-FIX.md).

## 7. Shortcuts you already have

| What you type in Zsh | What it uses |
| --- | --- |
| `ls`, `ll`, `la`, `tree` | eza: normal, long, hidden-inclusive long, or tree listing |
| `cat` | bat |
| `cd` | zoxide's `z` |
| `lg` | lazygit |
| `grep` | ripgrep (`rg`) |
| `find` | fd |
| `y` | Yazi wrapper that can change your shell directory on exit |
| `Ctrl+R`, `Ctrl+T` | fzf history search and file-path selection |
| `conf` | Change to `/home/curvature/nixos_config` |

Important: `fd` and `rg` are not argument-for-argument replacements for GNU
`find` and `grep`. For commands copied from a tutorial, use `command find` or
`command grep` when the original GNU syntax is intended. Similarly,
`command cat` bypasses your bat alias, and `builtin cd` bypasses zoxide.

## Where these tools are declared

- [TUI imports](/home/curvature/nixos_config/home/base/tui/default.nix)
    and [extra TUI/CLI packages](/home/curvature/nixos_config/home/base/tui/packages.nix).
- [Zsh aliases and integrations](/home/curvature/nixos_config/home/base/core/zsh.nix).
- Editors: [Vim](/home/curvature/nixos_config/home/base/core/vim.nix),
    [Neovim](/home/curvature/nixos_config/home/base/core/nvim.nix),
    and [system packages including nano and PowerTOP](/home/curvature/nixos_config/nixos/root_pkgs.nix).
- [Fastfetch](/home/curvature/nixos_config/home/base/core/fastfetch.nix),
    [Pay Respects package](/home/curvature/nixos_config/home/base/core/packages.nix),
    [network services](/home/curvature/nixos_config/nixos/network.nix),
    and [DSH package](/home/curvature/nixos_config/home/linux/gui/ai.nix).

This guide changes no settings and requires no rebuild. Examples are intended
for you to run manually; interactive behavior was not exercised while writing it.
