{ inputs, ... }:
let
  setup = ''
    inputs = {
      ...
      devenv.url = "github:cachix/devenv";
      devenv.inputs.nixpkgs.follows = "nixpkgs";
      ...
    };
  '';

  error = "To use the development shell, "
    + "you need to add devenv to your inputs in flake.nix:\n\n${setup}";
in
{
  imports = [
    inputs.devenv.flakeModule or (throw error)
  ];
  perSystem = _: {
    # https://devenv.sh/reference/options for more info
    devenv.shells.default = {
      #packages = { };
      #containers = { };
      #devcontainer = { };
      #dotenv = {
      #  enable = true;
      #};
      #languages = { };
      #pre-commit = { };
      #process-managers = { };
      #processes = { };
      #scripts = { };
      #services = { };
      # ...
    };
  };
}
