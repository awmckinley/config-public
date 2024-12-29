{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # never forget anything again
    "Due" = 524373870;
  };

  system.defaults.CustomUserPreferences = {
    "com.phocusllp.duemac" = {
      prefBoolAppSounds = 1;
      prefBoolConfirmBeforeQuitting = 1;
      prefBoolDefaultCreateWithSound = 1;
      prefBoolDoubleClickReminderOpensQuickAccessTimes = 1;
      prefBoolHideSideMenu = 0;
      prefBoolPlayAlertSoundInApp = 1;
      prefBoolShowQuickAccessTimesWhenLaunchedFromNotification = 1;
      prefBoolWindowIsDetachedInTheLastLaunch = 1;
      prefDictOfNotificationPreferences = {
        "Network down or unavailable" = {
          bounceIcon = 0;
          bounceRepeatedly = 0;
          highlightMenuBarIcon = 0;
          playsAlertSound = 0;
          textNotification = 0;
        };
        "Other network, server or sync errors" = {
          bounceIcon = 0;
          bounceRepeatedly = 0;
          highlightMenuBarIcon = 0;
          playsAlertSound = 0;
          textNotification = 0;
        };
        "Reminder Due" = {
          bounceIcon = 1;
          bounceRepeatedly = 1;
          highlightMenuBarIcon = 1;
          playsAlertSound = 1;
          textNotification = 1;
        };
        "Reminder Snooze" = {
          bounceIcon = 1;
          bounceRepeatedly = 1;
          highlightMenuBarIcon = 1;
          playsAlertSound = 1;
          textNotification = 1;
        };
        "Sync completed with changes" = {
          bounceIcon = 0;
          bounceRepeatedly = 0;
          highlightMenuBarIcon = 0;
          playsAlertSound = 0;
          textNotification = 1;
        };
        "Sync completed without changes" = {
          bounceIcon = 0;
          bounceRepeatedly = 0;
          highlightMenuBarIcon = 0;
          playsAlertSound = 0;
          textNotification = 0;
        };
        "Timer Due" = {
          bounceIcon = 1;
          bounceRepeatedly = 1;
          highlightMenuBarIcon = 1;
          playsAlertSound = 1;
          textNotification = 1;
        };
        "Timer Snooze" = {
          bounceIcon = 1;
          bounceRepeatedly = 1;
          highlightMenuBarIcon = 1;
          playsAlertSound = 1;
          textNotification = 1;
        };
      };
      prefIntApplicationRunningMode = 0; # Show icon in: Dock Only
      prefIntBadges = 1;
      prefIntDefaultContentSizeCategory = "-1";
      prefIntDefaultSnoozeInterval = 60;
      prefIntLastVisibleViewController = 1; # Reminders
      prefIntWeekStarts = 1;
      prefStringAlarmCountdown = "Deepening Mystery.caf";
      prefStringAlarmReminder = "Lasting Impression.aif";
      prefStringDue2ThemeName = "Slate Dark";
      prefStringLastOpenedPreferencesPane = "General";
    };
  };
}
