with import <nixpkgs> {};
let haskellPackages = pkgs.haskellPackages.override {
      extension = self: super: {
        cabalDb = self.callPackage ./. {};
      };
    };
 in lib.overrideDerivation haskellPackages.cabalDb (attrs: {
      buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
    })
