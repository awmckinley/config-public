{
  inputs,
  isLinux,
  lib,
  pkgs,
  ...
}:
let
  vscode-extensions = inputs.vscode-extensions.extensions.${pkgs.system};
in
{
  home.stateVersion = "22.11";

  home.packages =
    with pkgs;
    [ ]
    ++ lib.optionals isLinux [
      # infinitely extensible web-browser
      nyxt
    ];

  programs.chromium =
    { }
    // lib.optionalAttrs isLinux {
      # configure Chromium
      enable = true;

      # open source web browser with Google web services removed
      package = pkgs.ungoogled-chromium;

      extensions = [
        {
          # 1Password
          id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";
          version = "8.10.48.25";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8Vyz-vDRWjQ-PKHx1cxYwqSGYGlATlprVh5tkYCM61gMB2r64eXc5zEUvMB79SZOm1CEw4V3fRza7zN_phUS5MjzEpg7zO59nBUlvJi6kQyliLqZSP2OH1WUVJ-TCXUqtAMZSmuVdt8ROcah2zOK3-tCmSCXjIlioEQ/AEBLFDKHHHDCDJPIFHHBDIOJPLFJNCOA_8_10_48_25.crx";
            sha256 = "sha256:0mnva3a2ckm5syp2ikrny542wz9b9xa1krrqb2v4fqh9brsvx7lg";
          };
        }
        {
          # Bukubrow
          id = "ghniladkapjacfajiooekgkfopkjblpn";
          version = "5.0.3.0";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8Vyz0faiGRLZBxAu16hWCDL9Rb1GHrBkzHYrRqMD4dloTIaVg1RCOta9eFMXhpnN1olb3GJyP3zjB7Ib720CiCFMEoldVXc1zSNk81mfeUo8gx8ByQADGUprlKpGOWrmpRn8xrjMIU_7dJi4tr18/GHNILADKAPJACFAJIOOEKGKFOPKJBLPN_5_0_3_0.crx";
            sha256 = "sha256:19a27h11gbgxbgv4c2ky2spjvalynh2d1vrqccnzrwnprq6vr0zh";
          };
        }
        {
          # Chrome Extension Source Viewer
          id = "jifpbeccnghkjeaalbbjmodiffmgedin";
          version = "1.7.0";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyzCKWF_azsW9aEkq30nqw_MVTOt03SKUpTpGzT8E3AyCesjqGsPSrhxGBdAJxNDYdtI6fIQmOVZdT5d0DQrw8ZV8zxH5byuMLg10tzCvFVnHwyRAMZSmuWEhnB7H6oXrmb1YCiNM5Y1KoOJJg/JIFPBECCNGHKJEAALBBJMODIFFMGEDIN_1_7_0_0.crx";
            sha256 = "sha256:02ga99sbh3kgpmiklhrwlklydl8gnrw1pswa8d0qfdnwis6m15g2";
          };
        }
        {
          # Competitive Companion
          id = "cjnmckjndlpiamhfimnnjmnckgghkjbl";
          version = "2.56.0";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyyLSs57qCDx8YHuuyCJk5EmYjFvmOO2NPjQB0odqN5mn0l4m4PXSy5LNS7g6haNqhFbR7ZOg4BipivCmLLpi1QOMs0y_hAok1ebDB05GJSUTR2OQfAkM2MUIVjmRagAxlKa5flFS86FjhgIhT4kPPE7FtKVmfGU/CJNMCKJNDLPIAMHFIMNNJMNCKGGHKJBL_2_56_0_0.crx";
            sha256 = "sha256:1v8kbr9g730k1f3kd82vxqsh57zb4n7xz4k1pl1vj4gya4k6zqb7";
          };
        }
        {
          # Read Aloud
          id = "hdhinadidafjejdhmfkjgnolgimiaplp";
          version = "2.11.0";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8Vyw9DwE2N16Wj_wu9RiKVRbB9yySGCy1O7CuLF5fMtyKK10FxuGuRnatsSPYBIZ54pi1WkfeLUUE7E0vaL7Lr9LuohexlPXsEYNu4F4PgJJZKbBrKB5AMXKdGzJBK7QAxlKa5RUTs-cWZ5RpJa7KYzLsXcTXYIim/HDHINADIDAFJEJDHMFKJGNOLGIMIAPLP_2_11_0_0.crx";
            sha256 = "sha256:1cij032qc0vjqxn943l54rb88czslmhdipfggfw2ax804pvjx6z9";
          };
        }
        {
          # Vimium
          id = "dbepggeogbaibhgnhhndojpepiihcmeb";
          version = "2.1.2";
          crxPath = builtins.fetchurl {
            url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyyutpPVwk6HAt58RPljND3oCqj1M4ocdM88qIrG16u8fTnsjLlS9GfRcxYNZ74NP_kac4eOZQowwP9_FvoFSSn8OwPcpDAaibqIfLQTIHM5GTdwsJSRWeoT6dESJTEAxlKa5WGGPMJ80yD1BKSBZ0j4JUTzD01G/DBEPGGEOGBAIBHGNHHNDOJPEPIIHCMEB_2_1_2_0.crx";
            sha256 = "sha256:0m8xski05w2r8igj675sxrlkzxlrl59j3a7m0r6c8pwcvka0r88d";
          };
        }
      ];
    };

  programs.vscode = {
    # configure Visual Studio Code
    enable = true;

    # disable update nags
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    # source code editor
    package = pkgs.vscode.override { };

    extensions = with vscode-extensions.vscode-marketplace; [
      # Neovim integration
      asvetliakov.vscode-neovim

      # code formatter
      csharpier.csharpier-vscode

      # XML formatting, XQuery, and XPath tools
      dotjoshjohnson.xml

      # edit Excel spreadsheets and CSV files
      grapecity.gc-excelviewer

      # official C# extension
      ms-dotnettools.csdevkit

      # base C# support
      ms-dotnettools.csharp

      # install and manage .NET SDK and runtime
      ms-dotnettools.vscode-dotnet-runtime

      # AI-assisted development
      ms-dotnettools.vscodeintellicode-csharp

      # connect to a remote machine through a tunnel
      ms-vscode.remote-server
    ];

    # freeze extensions
    mutableExtensionsDir = false;

    userSettings = {
      "editor.formatOnSave" = false;
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "extensions.ignoreRecommendations" = true;
      "telemetry.telemetryLevel" = "off";
      "update.showReleaseNotes" = false;
      "workbench.startupEditor" = "none";
      "[csharp]" = {
        "editor.defaultFormatter" = "csharpier.csharpier-vscode";
        "editor.formatOnSave" = true;
        "editor.formatOnSaveMode" = "file";
      };
    };
  };

  systemd.user = {
    startServices = "sd-switch";

    services.cron = {
      Unit.Description = ".cron.d scripts";
      Install.WantedBy = [ "default.target" ];
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.writeShellScript "exec-start" ''
          #!/run/current-system/sw/bin/bash
          log="$HOME/.local/share/cron.log"
          date >>"$log"
          ${pkgs.fd}/bin/fd -e sh . "$HOME/.cron.d" -j 1 -x sh -c "echo .cron.d/{/}; {}" >>"$log" 2>&1
        ''}";
      };
    };

    timers.cron = {
      Unit.Description = ".cron.d scripts";
      Install.WantedBy = [ "timers.target" ];
      Timer = {
        OnCalendar = "*:0/1";
        Unit = "cron.service";
      };
    };
  };
}
