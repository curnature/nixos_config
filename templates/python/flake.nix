{
    description = "Python Scientific Environment";

    inputs = {
        # Use the same unstable branch as your system for better caching
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        devShells.${system}.default = pkgs.mkShell {
            name = "python-science-env";

            # --- 1. The Python Environment ---
            packages = [
            (pkgs.python3.withPackages (ps: with ps; [
                # The "Big Three" for Science
                numpy # Arrays & Matrix math
                scipy # Numerical Integral, Linear Algebra, Optimization
                matplotlib # Plotting

                # Data Handling
                pandas # Dataframes (Excel-like data handling)

                # For microcontrollers
                pyserial

                # Interactive / Notebooks
                ipython # Enhanced interactive console
                tqdm

                # Optional but recommended
                # sympy           # Symbolic mathematics (like Wolfram Alpha)
                # seaborn         # Prettier graphs (built on top of matplotlib)

                # --- 2. The AI / ML Stack ---
                # torch         # PyTorch (The core Deep Learning library)
                # torchvision   # Datasets & transforms for images
                # scikit-learn  # Classical ML (SVM, Random Forest, K-Means)


            ]))

            # --- 2. System Tools (Optional) ---
            pkgs.ruff # Extremely fast Python linter
            pkgs.black # Code formatter
            ];

            # --- 3. Environment Configuration ---

            # This fix allows you to pip install binary wheels (if you ever need to)
            # by telling Python where to find standard C libraries.
            LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

            shellHook = ''
            echo "================================================================="
            echo "🐍 Scientific Python Environment Loaded"
            echo "   - Python: $(python --version)"
            echo "================================================================="
            '';
            # echo "   - PyTorch: $(python -c 'import torch; print(torch.__version__)')"
            # echo "   - CUDA Available: $(python -c 'import torch; print(torch.cuda.is_available())')"
        };
    };
}
