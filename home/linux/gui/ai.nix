{ pkgs, inputs, ... }:

let
    # Build only ChatGPT against the host's package set so its runtime libraries
    # match the system graphics drivers and Qt plugins loaded at startup.
    systemAgents =
        (pkgs.extend inputs.llm-agents.overlays.shared-nixpkgs).llm-agents;

    # Previous automatic selection chose Qt5 on Niri, but this package does not
    # expose Qt5's Wayland platform plugins. Keep the verified Qt6 selection local.
    # chatgpt = systemAgents.chatgpt.overrideAttrs (old: {
    chatgpt = (systemAgents.chatgpt.override {
        commandLineArgs = "--qt-version=6";
    }).overrideAttrs (old: {
        # Union's Breeze CSS plugin failed with the previous C++ runtime.
        # Keep the verified Fusion bypass local to ChatGPT until Union is
        # retested with the aligned package; other Qt applications keep their theme.
        postInstall = (old.postInstall or "") + ''
            wrapProgram "$out/bin/chatgpt" --set QT_STYLE_OVERRIDE Fusion
        '';
    });

    # DSH 0.2.0-rc.2's native getter probe rejects Nix-built Node's hardening
    # instructions. Its existing wrapper already passes --expose-internals;
    # use that path in both loader copies, as cordis-plugin-loader already does.
    # Keep the original native fallback when the flag is absent. This changes
    # only DSH, not Node's hardening, the development shell, or other AI tools.
    dsh = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.dsh.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
            for loader in \
                "$out/lib/node_modules/@deepseek-ai/dsh/node_modules/@deepseek-ai/dsh-app-boot/lib/index.js" \
                "$out/lib/node_modules/@deepseek-ai/dsh/node_modules/@deepseek-ai/dsh-app-boot/lib/worker/profile-resolution-bootstrap.js"
            do
                substituteInPlace "$loader" \
                    --replace-fail \
                    'const addon = createRequire(import.meta.url)("node-addon-require-builtin");' \
                    'const addon = process.execArgv.includes("--expose-internals") ? { requireBuiltin: createRequire(import.meta.url) } : createRequire(import.meta.url)("node-addon-require-builtin");'
            done
        '';
    });
in
{
    # -------------------------------------------------------------------------
    # AI Tools
    # -------------------------------------------------------------------------
    # Provided by the llm-agents flake and pinned via flake.lock.
    # Outdated: `pkgs.system` is a deprecated alias in current Nixpkgs.
    # home.packages = with inputs.llm-agents.packages.${pkgs.system}; [
    # Outdated: the independent llm-agents package set supplied glibc 2.42 and
    # GCC 15, while system Mesa/Union required newer GLIBC/GLIBCXX symbols.
    # home.packages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    #     chatgpt # Desktop application for ChatGPT and Codex
    #     dsh     # DeepSeek Harness agent
    # ];
    home.packages = [
        chatgpt # System-compatible ChatGPT with an application-only Fusion style
        # Unpatched DSH still calls the incompatible native probe at startup.
        # inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.dsh
        dsh
    ];
}
