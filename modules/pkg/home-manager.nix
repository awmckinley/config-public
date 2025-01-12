{
  inputs,
  isDarwin,
  isLinux,
  isWSL,
  ...
}:
{
  home-manager = {
    backupFileExtension = "hm-backup";
    sharedModules = [ inputs.nur.hmModules.nur ];
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      inherit isDarwin;
      inherit isLinux;
      inherit isWSL;
    };
  };
}
