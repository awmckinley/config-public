{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # interact with your Doppler Enclave secrets and configuration
    doppler
  ];
}
