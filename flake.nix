{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    devenv.url = "github:cachix/devenv";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = inputs @ {self, ...}:
    with inputs;
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = import nixpkgs {inherit system;};
        in {
          packages.${system}.devenv-up = self.devShells.${system}.default.config.procfileScript;

          devShells.default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              ({
                pkgs,
                config,
                ...
              }: {
                # This is your devenv configuration
                packages = with pkgs; [nodePackages.vercel];

                # Enable NodeJS
                languages.javascript = {
                  enable = true;
                  package = pkgs.nodejs_22;

                  pnpm = {
                    enable = true;
                    install.enable = true;
                  };
                };

                dotenv.enable = false;
              })
            ];
          };
        }
      );
}
