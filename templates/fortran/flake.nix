{
  description = "Fortran 90 Environment (gfortran + OpenMPI)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "fortran-env";

      packages = with pkgs; [
        # --- 1. The Compiler & Parallel Wrappers ---
        gfortran          # The standard compiler (gfortran)
        openmpi           # Parallel computing (provides mpif90, mpirun)

        # --- 2. Build Tools ---
        gnumake           # Standard 'make'
        cmake             # Modern build system (highly recommended for Fortran)
        
        # --- 3. Development Tools ---
        gdb               # Debugger
        fortls            # Language Server (VS Code support)
        fprettify         # Code formatter (keeps your F90 pretty)
      ];

      shellHook = ''
        echo "================================================================="
        echo "⚛️  Fortran 90 Scientific Environment Loaded"
        echo "   - Compiler: $(gfortran --version | head -n1)"
        echo "   - MPI:      $(mpif90 --version | head -n1)"
        echo "================================================================="
        echo "💡 Usage Tip:"
        echo "   - Serial:   gfortran main.f90 -o main"
        echo "   - Parallel: mpif90 main.f90 -o main"
        echo "   - Run MPI:  mpirun -np 4 ./main"
      '';
    };
  };
}