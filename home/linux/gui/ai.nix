{ pkgs, inputs, ... }:

{
    # -------------------------------------------------------------------------
    # AI Tools
    # -------------------------------------------------------------------------
    # Provided by the llm-agents flake and pinned via flake.lock.
    # Outdated: `pkgs.system` is a deprecated alias in current Nixpkgs.
    # home.packages = with inputs.llm-agents.packages.${pkgs.system}; [
    home.packages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
        chatgpt # Desktop application for ChatGPT and Codex
        dsh     # DeepSeek Harness agent
    ];
}
