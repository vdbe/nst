_:
{
  perSystem = { pkgs, ... }: {
    devenv.shells.default = {
      packages = with pkgs; [
        bacon
        cargo-watch
      ];

      languages.rust = {
        enable = true;
        #channel = "nightly";
      };

      pre-commit.hooks = {
        # Rust
        rustfmt.enable = true;
        clippy.enable = true;
      };
    };
  };
}
