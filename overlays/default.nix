final: prev: {
  kalc = final.callPackage ../packages/kalc.nix { };
  minicloze = final.callPackage ../packages/minicloze.nix { };
  mult = final.callPackage ../packages/mult.nix { };
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      dynaconf = pyfinal.callPackage ../packages/dynaconf.nix { };
      moe = pyfinal.callPackage ../packages/moe.nix { };
    })
  ];
}
