# NixOS and Home Manager aliases

Checked on 2026-10-10 against
[zsh.nix](/home/curvature/nixos_config/home/base/core/zsh.nix).
These 13 aliases are for your normal Zsh terminal; they may not exist inside
a Bash-based `nix develop` shell.

## How your aliases are connected

On `omen`, configuration-based rebuild aliases target
`/home/curvature/nixos_config#omen`, regardless of your current directory.
The hostname is filled in by Nix when configuring each host.

Home Manager is integrated into NixOS, so these system rebuilds also build
your Home Manager configuration. `os-switch`, `update`, and `os-test` apply
its changes through the system service; there is no separate `hm-switch` alias.

Rebuild aliases use `--no-update-lock-file`: they refuse a required lock-file
update instead of silently changing dependencies. This is stricter than
`--no-write-lock-file`, which can permit an updated lock in memory without
saving it. Neither flag prevents downloading or building already-pinned inputs.

## Alias reference

| Alias | What it does | Important effect |
| --- | --- | --- |
| `conf` | Changes directory to `/home/curvature/nixos_config`. | Navigation only. Convenient before reviewing or building changes. |
| `os-build` | Builds the configuration and displays package differences with `--diff`. | Does **not** activate it. Creates/updates a `result` link in the directory where you run it. The comparison is against the active system, not a Git diff. |
| `os-preview` | Runs `sudo nixos-rebuild dry-activate` for your flake. | Builds as needed and previews activation/service changes without normal activation. It is not a complete Home Manager collision or runtime test. |
| `os-test` | Builds and activates the configuration now, including Home Manager. | **Changes the live system** and may restart services, but does not make it the boot default. Not a sandbox. |
| `os-switch` | Builds, activates now, and makes the configuration the default for subsequent boots. | Normal way to apply a configuration you want to keep. Uses `sudo`. |
| `update` | Exactly the same command as `os-switch`. | Despite its name, it does **not** advance flake inputs or automatically select newer packages. |
| `os-boot` | Builds and makes the configuration the next-boot default without activating it now. | Useful for changes that should take effect at boot. Does not reboot automatically. |
| `os-generations` | Lists saved NixOS system generations. | Read-only overview of available generation history. Not Git history or standalone Home Manager generations. |
| `os-rollback` | Runs `sudo nixos-rebuild switch --rollback`. | Activates the preceding saved system-profile generation and makes it the boot default. Does not undo repository edits or restore application data. |
| `hm-status` | Shows `home-manager-curvature.service` status without a pager. | Quick check for activation success or failure. Uses the system service, not `systemctl --user`. |
| `hm-log` | Shows the latest 100 journal entries for that Home Manager service from the current boot. | Useful for file collisions and activation errors; read-only. |
| `flake-update` | Updates flake inputs in `/home/curvature/nixos_config/flake.lock`. | With no arguments, updates **all inputs**. Append input names for a targeted update. Does not activate anything. |
| `gc` | Runs `nix-collect-garbage --delete-old`. | Deletes old generations in profiles writable by your user, then collects unreferenced store paths. **Can remove rollback options.** The alias does not include `sudo`. |

For example, `os-build` currently expands to:

```bash
nixos-rebuild build --flake '/home/curvature/nixos_config#omen' --no-update-lock-file --diff
```

## Common workflows

### Check a configuration edit first

Run these one at a time, stopping if a command reports an error:

```bash
conf
os-build
os-preview
```

Review the results. When ready to apply the change permanently:

```bash
os-switch
```

`update` is interchangeable with `os-switch`; you do not need to run both.
If you deliberately want a live trial before changing the boot default, use
`os-test` instead, then `os-switch` later if satisfied.

A successful build or preview does not guarantee that activation or an
application will work. If Home Manager fails, inspect the error before proceeding:

```bash
hm-status
hm-log
```

### Deliberately update a dependency

For example, to update the root Nixpkgs input:

```bash
conf
flake-update nixpkgs
git diff -- flake.lock
os-build
```

This is a targeted input update, not a promise that every dependency elsewhere
in the flake follows it. Inspect the lock diff, test, and use `os-switch` only
when ready. Bare `flake-update` refreshes the whole input graph, not just
Nixpkgs. Explicit commit pins still constrain what can change; unpinned inputs
and related dependencies can move. It is not needed for routine config edits.
[Nix flake update documentation](https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-flake-update.html).

### Prepare a boot-only change

```bash
os-build
os-boot
```

After both succeed, reboot manually when ready. A newly installed kernel is
not running until reboot; live `switch` or `test` cannot replace the running kernel.

### Return to a previous saved system

First inspect the available generations:

```bash
os-generations
```

If the preceding saved generation is the one you intend to restore:

```bash
os-rollback
```

This is **not a direct undo for `os-test`**: `test` did not advance the saved
system profile. It also leaves your working configuration files unchanged, so
running `os-switch` again can reapply the same problematic edits. For an older
kernel, booting the chosen generation is still necessary.

## Cleanup and practical cautions

- Do not run `gc` while still deciding whether an update is safe to keep.
    Deleted generations can no longer serve as normal rollback targets.
- Your unprivileged `gc` alias should not be assumed to clean root-owned NixOS
    system generations. Running cleanup as root broadens its scope.
    [Garbage-collection documentation](https://nix.dev/manual/nix/latest/command-ref/nix-collect-garbage.html).
- You already configure weekly garbage collection with
    `--delete-older-than 7d` in [nix.nix](/home/curvature/nixos_config/nixos/nix.nix).
    That is separate from the more aggressive manual `gc` alias.
- `os-test`, `os-switch`, `update`, `os-boot`, and rollback can change system
    state. Save work first and respect activation inhibitors; do not bypass them.
- Environment-variable changes may require logging out and back in. Rebuilding
    does not rewrite the environment of every already-running application.
- Newly added Nix modules must be tracked by Git before a Git-based flake can
    include them. Stage only intended files. This Markdown guide is not imported
    by the flake and needs no rebuild.

The installed `man nixos-rebuild` documents the exact local command behavior.
See also the [NixOS configuration manual](https://nixos.org/manual/nixos/unstable/#sec-changing-config).
No aliases were executed or configuration settings changed while writing this guide.
