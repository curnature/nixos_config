# October 2026 update summary

Session covered: **8–10 October 2026**. This records the final outcomes, including changes already committed during the session and edits still awaiting commit. Intermediate experiments are omitted.

## 1. Niri and Noctalia migration

- Updated the Niri/Noctalia flake and module interfaces, and translated the old Noctalia v4 configuration into supported v5 settings.
- Restored the previous bar, workspace, media, brightness, dock, wallpaper, notification, audio, weather, OSD, and session-menu preferences where equivalents existed. Unsupported differences were documented instead of inventing options.
- Enabled clipboard support and disabled bar compositor blur/shadow. GPU usage/temperature widgets are present; monitoring accuracy across both laptops still needs verification.
- Updated Noctalia command examples/keybindings, kept Niri responsible for launching the shell, and used Niri-managed Xwayland instead of fixed `DISPLAY`/manual satellite startup.
- Preserved old settings with explanatory comments where practical and followed the modular, four-space indentation style. Your later manual bar adjustments remain intact; the current bar is translucent, not completely transparent.

**Status:** you accepted the current Niri/Noctalia setup; leave it unchanged unless something breaks.

## 2. ChatGPT desktop and Fastfetch

- In [ai.nix](/home/curvature/nixos_config/home/linux/gui/ai.nix), selected ChatGPT through the supported `shared-nixpkgs` overlay, aligning its runtime package set with the system graphics libraries instead of changing every llm-agents package.
- Independently selected Qt6 and applied `QT_STYLE_OVERRIDE=Fusion` only to ChatGPT to avoid the Qt selection/style failures. Retained terminal and desktop-launcher integration without a permanent `--disable-gpu`, global theme override, or sandbox bypass.
- In [fastfetch.nix](/home/curvature/nixos_config/home/base/core/fastfetch.nix), shortened terminal output to process name/version so VS Code's lengthy Electron arguments no longer fill the display.

**Status:** you confirmed ChatGPT works in both Niri and KDE, and Fastfetch is fixed. Actual hardware acceleration was not separately established by successful window launches alone.

## 3. Image defaults and Home Manager activation

- Added [image-viewer.nix](/home/curvature/nixos_config/home/linux/gui/image-viewer.nix), explicitly installing Gwenview and assigning common image formats to `org.kde.gwenview.desktop`.
- Preserved browser/application protocol handlers, including the Codex association found during the live MIME-file comparison.
- Resolved the blocking `mimeapps.list.backup` collision during activation recovery; you subsequently reported a successful system switch. The configuration still uses the existing `backup` extension, not blanket forced overwrites.

## 4. Framework 13 Pro groundwork

- Added `hosts/fw13p/` alongside Omen, with Framework/Intel profiles, iGPU/Xe configuration, shared graphics support, and no NVIDIA module.
- Kept the hardware configuration ungenerated and the flake host output disabled until the laptop arrives and its installer-generated compatibility baseline is known.
- Separated kernel selection into [kernel.nix](/home/curvature/nixos_config/nixos/kernel.nix). The final selection is **7.2.8-cachyos-lto**, pinned through an immutable CachyOS-kernel input with its matching toolchain. This remains NixOS, not a CachyOS installation.
- Kept the lock addition targeted, without replacing Omen's kernel or enabling a third-party binary cache. Future kernel updates require reviewing the pin.

**Status:** kernel selection/evaluation checked; the kernel was not fully compiled or tested on Framework hardware. The reported sleep improvement is another user's result, not a guarantee. Further work is deferred until delivery.

## 5. Version explanations and compatibility cleanup

- Documented Nixpkgs, NixOS, Home Manager, and compatibility baselines in [vars/default.nix](/home/curvature/nixos_config/vars/default.nix).
- Kept Omen's `system.stateVersion = "25.11"` separate from `homeStateVersion = "24.11"`; neither is an update channel or a value to replace with `"latest"`.
- Replaced deprecated TeX Live naming with `texliveFull`, updated platform references to `pkgs.stdenv.hostPlatform.system`, and made Catppuccin/pointer-cursor enablement explicit.

## 6. Rebuild and diagnostic aliases

- Expanded [zsh.nix](/home/curvature/nixos_config/home/base/core/zsh.nix) with build, activation-preview, live-test, switch, next-boot, generation-listing, rollback, and Home Manager diagnostic shortcuts.
- Kept `update` equivalent to `os-switch`; dependency updates remain a separate operation. Rebuild aliases use `--no-update-lock-file` to prevent implicit relocking.
- Documented that Home Manager is integrated, `os-test` really changes the live system, rollback does not restore Git files/user data, and garbage collection can remove rollback options.

## 7. DSH recovery

- Removed extra web-profile plugins while preserving shipped components, conversations, credentials, and attachments. Quarantined obsolete shared-module links and removed the verified dangling `dsh-vision-router` launcher link.
- Added a DSH-only build-time patch for both main and worker loaders, using the launcher's existing `--expose-internals` path instead of the incompatible native getter probe. Did not relax Node hardening or change the Node development shell.
- Retained the private pre-cleanup backup; it contains sensitive state and must not be committed.

**Status:** package/system builds and isolated checks passed. You confirmed DSH web **0.2.0-rc.2** loads an existing conversation, completes a request, and produces no terminal warnings. Removed/future third-party plugins are not thereby validated.

## 8. VS Code settings and Open Folder

- Enabled `profiles.default.mutableUserSettings` in [vscode.nix](/home/curvature/nixos_config/home/base/gui/vscode.nix), allowing manual settings changes while retaining declarative settings merged during activation.
- Separately routed Niri's FileChooser portal to GTK in [nixos/niri.nix](/home/curvature/nixos_config/nixos/niri.nix). The prior GNOME chooser delegation failed because its target was unavailable; this was not caused by read-only settings.
- Preserved other portal mappings and KDE behavior.

**Status:** evaluation/build passed, and you confirmed both features work after applying the changes.

## 9. Lazygit theme repair

- In [lazygit.nix](/home/curvature/nixos_config/home/base/tui/lazygit.nix), migrated Catppuccin's `gui.authorColors` to `gui.theme.authorColors` at build time so Lazygit does not attempt to rewrite the read-only Nix-store theme.
- Preserved theme colors and all other Catppuccin sources; no dependency update was needed.

**Status:** all 56 theme files checked, full Omen build passed, and isolated Lazygit startup/exit succeeded without the migration error. Application in your normal session has not yet been confirmed.

## 10. Documentation and deferred issues

- [TUI-GUIDE.md](/home/curvature/nixos_config/TUI-GUIDE.md): installed terminal tools, short introductions, examples, and exit/safety tips.
- [NIXOS-ALIASES.md](/home/curvature/nixos_config/NIXOS-ALIASES.md): the 13 NixOS-related aliases and safe build/test/switch workflows.
- [DSH-NIXOS-FIX.md](/home/curvature/Projects/nodejs/DSH-NIXOS-FIX.md): detailed diagnosis, repair logic, verification, and selective recovery instructions.
- Kitty's missing minimize button was accepted as expected Niri behavior; no repair was needed. The WPS cloud-helper crash was investigated but deferred because the local editor remained usable.

This summary itself changes no configuration and requires no rebuild. Existing staged/unstaged changes are preserved; nothing is automatically staged, committed, activated, or rebooted by writing this document.
