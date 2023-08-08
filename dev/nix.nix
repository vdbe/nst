_:
{
  perSystem = { pkgs, ... }: {
    devenv.shells.default = {
      packages = with pkgs; [
        nixpkgs-fmt
      ];

      languages.nix = {
        enable = true;
      };

      pre-commit.hooks = {
        deadnix.enable = true;
        nixpkgs-fmt.enable = true;
        statix.enable = true;
      };
    };
  };
}
