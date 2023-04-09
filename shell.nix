{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      alejandra
      wl-clipboard
      gitui
      helix
      broot
      zsh
      zellij
    ];

    shellHook = ''
    '';
  }
