{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.base16.nixosModule
    inputs.home-manager.darwinModules.home-manager
    ../../modules
  ];

  # cron launchd agent
  launchd.user.agents.cron = {
    path = [ config.environment.systemPath ];
    script = ''
      log="$HOME/.local/share/cron.log"
      date >>"$log"
      ${pkgs.fd}/bin/fd -e sh . "$HOME/.cron.d" -j 1 -x sh -c "echo .cron.d/{/}; {}" >>"$log" 2>&1
    '';
    serviceConfig = {
      StartCalendarInterval = [
        {
          # every minute
        }
      ];
    };
  };

  # use touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # enable nix-daemon
  services.nix-daemon.enable = true;

  system = {
    activationScripts.postUserActivation.text = ''
      # activate settings w/o logout or reboot
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

      # mount filesystems w/o logout or reboot
      sudo /usr/sbin/automount -c -v

      # run Setapp activation script
      ${config.system.activationScripts.setapp.text}
    '';

    defaults = {
      # Activity Monitor preferences
      ActivityMonitor = {
        ShowCategory = 107;
        IconType = 2;
        SortColumn = "CPUUsage";
        SortDirection = -1;
        OpenMainWindow = true;
      };

      # Application Firewall preferences
      alf = {
        globalstate = 1; # enabled (permissive)
        allowsignedenabled = 0;
        allowdownloadsignedenabled = 0;
        loggingenabled = 1;
        stealthenabled = 1;
      };

      # Custom user preferences
      CustomUserPreferences = {
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
        };

        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };

        "com.apple.AppStore" = {
          AutoPlayVideoSetting = "off";
          InAppReviewEnabled = 0;
          UserSetAutoPlayVideoSetting = 1;
          mostRecentTabIdentifier = "updates";
        };

        "com.apple.commerce" = {
          AutoUpdate = true;
        };

        "com.apple.desktopservices" = {
          # don't write .DS_Store on network drives
          DSDontWriteNetworkStores = true;
          # don't write .DS_Store on USB drives
          DSDontWriteUSBStores = true;
        };

        "com.apple.dock" = {
          wvous-bl-corner = 0;
          wvous-br-corner = 0;
          wvous-tl-corner = 0;
          wvous-tr-corner = 0;
        };

        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
        };

        "com.apple.ImageCapture" = {
          disableHotPlug = true;
        };

        "com.apple.mail" = {
          DisableInlineAttachmentViewing = true;
        };

        "com.apple.print.PrintingPrefs" = {
          "Quit When Finished" = true;
        };

        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = 1;
          AutomaticDownload = 1;
          AutomaticallyInstallMacOSUpdates = 1;
          ConfigDataInstall = 1;
          CriticalUpdateInstall = 1;
          ScheduleFrequency = 1;
        };

        "com.apple.TimeMachine" = {
          DoNotOfferNewDisksForBackup = true;
        };
      };

      # Custom system preferences
      CustomSystemPreferences = { };

      # Dock preferences
      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        dashboard-in-overlay = false;
        enable-spring-load-actions-on-all-items = true;
        expose-animation-duration = 0.0;
        expose-group-apps = false;
        launchanim = false;
        mineffect = "scale";
        minimize-to-application = true;
        mouse-over-hilite-stack = true;
        mru-spaces = false;
        orientation = "right";
        persistent-apps = [
          "/Applications/Anybox.app"
          "/Applications/Due.app"
          "/Applications/Mercury.app"
          "/System/Applications/Launchpad.app"
        ];
        show-process-indicators = true;
        showhidden = true;
        show-recents = false;
        static-only = false;
        tilesize = 48;
        magnification = false;
        largesize = 64;
      };

      # Finder preferences
      finder = {
        AppleShowAllFiles = false;
        ShowStatusBar = true;
        ShowPathbar = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        AppleShowAllExtensions = true;
        CreateDesktop = false;
        QuitMenuItem = true;
        _FXShowPosixPathInTitle = true;
        FXEnableExtensionChangeWarning = false;
      };

      ".GlobalPreferences" = {
        "com.apple.sound.beep.sound" = "/System/Library/Sounds/Pop.aiff";
        "com.apple.mouse.scaling" = 3.0;
      };

      # Launch services preferences
      LaunchServices = {
        LSQuarantine = false;
      };

      # Login preferences
      loginwindow = {
        SHOWFULLNAME = false;
        autoLoginUser = null;
        GuestEnabled = true;
        LoginwindowText = "";
        ShutDownDisabled = false;
        SleepDisabled = false;
        RestartDisabled = false;
        ShutDownDisabledWhileLoggedIn = false;
        PowerOffDisabledWhileLoggedIn = false;
        RestartDisabledWhileLoggedIn = false;
        DisableConsoleAccess = false;
      };

      # Mouse preferences
      magicmouse = {
        MouseButtonMode = "TwoButton";
      };

      # Menu clock preferences
      menuExtraClock = {
        IsAnalog = true;
        Show24Hour = true;
        ShowAMPM = false;
        ShowDayOfMonth = false;
        ShowDayOfWeek = false;
        ShowDate = 2;
        ShowSeconds = false;
      };

      # Global preferences
      NSGlobalDomain = {
        AppleShowAllFiles = false;
        AppleEnableMouseSwipeNavigateWithScrolls = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleFontSmoothing = 2;
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
        AppleScrollerPagingBehavior = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDisableAutomaticTermination = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        AppleWindowTabbingMode = "manual";
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSTableViewDefaultSizeMode = 1;
        NSTextShowsControlCharacters = true;
        NSUseAnimatedFocusRing = true;
        NSScrollAnimationEnabled = true;
        NSWindowResizeTime = 0.0;
        NSWindowShouldDragOnGesture = true;
        InitialKeyRepeat = 30;
        KeyRepeat = 2;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        "com.apple.keyboard.fnState" = false;
        "com.apple.mouse.tapBehavior" = null;
        "com.apple.sound.beep.volume" = 0.5;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.trackpad.trackpadCornerClickBehavior" = null;
        "com.apple.trackpad.scaling" = 3.0;
        "com.apple.trackpad.forceClick" = true;
        "com.apple.springing.enabled" = true;
        "com.apple.springing.delay" = 0.5;
        "com.apple.swipescrolldirection" = false;
        AppleMeasurementUnits = "Inches";
        AppleMetricUnits = 0;
        AppleTemperatureUnit = "Fahrenheit";
        AppleICUForce24HourTime = true;
        _HIHideMenuBar = false;
      };

      # Screen capture preferences
      screencapture = {
        type = "png";
        disable-shadow = true;
        show-thumbnail = false;
      };

      # Screensaver preferences
      screensaver = {
        askForPassword = false;
        askForPasswordDelay = 0;
      };

      # Spaces preferences
      spaces = {
        spans-displays = false;
      };

      # Trackpad preferences
      trackpad = {
        Clicking = false;
        Dragging = false;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
        ActuationStrength = 0;
        FirstClickThreshold = 1;
        SecondClickThreshold = 1;
        TrackpadThreeFingerTapGesture = 2;
      };

      # Accessibility preferences
      universalaccess = {
        mouseDriverCursorSize = 1.0;
        reduceMotion = true;
        reduceTransparency = true;
        closeViewScrollWheelToggle = false;
        closeViewZoomFollowsFocus = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    startup.chime = false;
  };
}
