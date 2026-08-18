{
    description = "Node.js Development Environment (pnpm + Node.js 24)";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        devShells.${system}.default = pkgs.mkShell {
            name = "Node.js-env";

            packages = with pkgs; [
                # --- 1. The Runtime ---
                nodejs_24 # Node.js 24 (the runtime DSH plugins run on)

                # --- 2. The Package Manager ---
                pnpm # Fast, disk-efficient package manager (npm alternative)

                # --- 3. Optional ---
                # typescript # TypeScript compiler (if you write plugins in TS)
            ];

            shellHook = ''
                echo "================================================================"
                echo "🛠️  Node.js Development Environment Loaded"
                echo "   - Node.js: $(node --version)"
                echo "   - pnpm:    $(pnpm --version)"
                echo "================================================================"
                echo "💡 Usage Tip:"
                echo "   - Install deps: pnpm install"
                echo "   - Add a dep:    pnpm add <package>"
            '';
        };
    };
}
