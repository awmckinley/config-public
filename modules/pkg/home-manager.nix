{
  inputs,
  isDarwin,
  isLinux,
  ...
}:
{
  home-manager = {
    backupFileExtension = "backup";
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
