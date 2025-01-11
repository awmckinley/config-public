{
  inputs,
  isDarwin,
  isLinux,
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
    };
  };
}
