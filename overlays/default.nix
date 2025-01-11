final: prev: {
  csharpier = final.callPackage ../packages/csharpier.nix { };
  kalc = final.callPackage ../packages/kalc.nix { };
  kiota = final.callPackage ../packages/kiota.nix { };
  mdformat = final.callPackage ../packages/mdformat.nix { };
  minicloze = final.callPackage ../packages/minicloze.nix { };
  mult = final.callPackage ../packages/mult.nix { };
  superhtml-bin = final.callPackage ../packages/superhtml-bin.nix { };
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      click-extra = pyfinal.callPackage ../packages/click-extra.nix { };
      dynaconf = pyfinal.callPackage ../packages/dynaconf.nix { };
      mail-deduplicate = pyfinal.callPackage ../packages/mail-deduplicate.nix { };
      mdformat-obsidian = pyfinal.callPackage ../packages/mdformat-obsidian.nix { };
      mdformat-wikilink = pyfinal.callPackage ../packages/mdformat-wikilink.nix { };
      moe = pyfinal.callPackage ../packages/moe.nix { };
    })
  ];
}
