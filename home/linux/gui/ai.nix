{ pkgs, inputs, ... }:

{
    # -------------------------------------------------------------------------
    # AI Tools
    # -------------------------------------------------------------------------
    # Provided by the llm-agents flake and pinned via flake.lock.
    home.packages = with inputs.llm-agents.packages.${pkgs.system}; [
        chatgpt # Desktop application for ChatGPT and Codex
        dsh     # DeepSeek Harness agent
    ];
}
