{ buildDotnetGlobalTool, dotnetCorePackages, ... }:
buildDotnetGlobalTool {
  pname = "Microsoft.OpenApi.Kiota";
  version = "1.19.1";
  executables = "kiota";
  nugetHash = "sha256-Ja/JlRqtpxZipvYl2OLKE5wyQL68HKqCvzL2X7mbQ3o=";
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
}
