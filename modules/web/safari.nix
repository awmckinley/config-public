{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # save & share passwords safely
    "1Password for Safari" = 1569813296;

    # browse YouTube as it should be
    "Eat the Shorts" = 1668012393;

    # annotate & take notes on pages
    "Highlighter" = 1385628859;

    # set up keywords to search the web
    "Keyword Search" = 1558453954;

    # your search engine assistant
    "MagicHighlighter" = 1663033087;

    # browse better at night
    "Noir" = 1592917505;

    # take (full) sites screenshots
    "Page Screenshot for Safari" = 1472715727;

    # improvements for GitHub.com
    "Refined GitHub" = 1519867270;

    # automatically refresh webpages
    "Simple Refresh" = 1492951704;

    # web fonts blocker
    "StopTheFonts" = 1671452642;

    # take back your web browser
    "StopTheMadness Pro" = 6471380298;

    # save and run arbitrary bits of JavaScript and CSS
    "Userscripts-Mac-App" = 1463298887;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.Safari" = {
      # open to blank page
      HomePage = "about:blank";
    };
  };
}
