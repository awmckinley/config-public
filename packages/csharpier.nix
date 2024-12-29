{ buildDotnetGlobalTool, dotnetCorePackages, ... }:
buildDotnetGlobalTool {
  pname = "CSharpier";
  version = "0.29.2";
  executables = "dotnet-csharpier";
  nugetHash = "sha256-+Mrb7VGeKuMS4hEmejthFWuX5Ga299pbPScmFtSg644=";
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
}
