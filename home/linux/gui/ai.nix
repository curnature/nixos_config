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
        inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.dsh
    ];
}
