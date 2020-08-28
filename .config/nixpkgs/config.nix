let

  nur-repo = builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz";

in

{
  allowUnfree = true;

  # https://github.com/nix-community/NUR
  packageOverrides = pkgs: {
    nur = import nur-repo {
      inherit pkgs;
    };
  };
}
