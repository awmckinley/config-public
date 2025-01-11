final: prev: {
  kalc = final.callPackage ../packages/kalc.nix { };
  minicloze = final.callPackage ../packages/minicloze.nix { };
  mult = final.callPackage ../packages/mult.nix { };
  superhtml-bin = final.callPackage ../packages/superhtml-bin.nix { };
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      click-extra = pyfinal.callPackage ../packages/click-extra.nix { };
      dynaconf = pyfinal.callPackage ../packages/dynaconf.nix { };
      mail-deduplicate = pyfinal.callPackage ../packages/mail-deduplicate.nix { };
      moe = pyfinal.callPackage ../packages/moe.nix { };
    })
  ];
}
