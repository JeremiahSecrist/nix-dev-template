{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    mkScript = pkgs.writeScriptBin;
  in {
    devShells.${system}.default = import ./shell.nix {inherit pkgs;};
    packages.${system} = {
      editor = mkScript "editor" ''
        zellij kill-session $ZELLIJ_SESSION_NAME
        zellij --config-dir config/zellij
      '';
      format = mkScript "format" ''
        alejandra -q .
        clear
      '';
    };
  };
}
