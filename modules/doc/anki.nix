{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # spaced repetition flashcard program
    "anki"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # spaced repetition flashcard program
    anki

    # version control for Anki collections
    ki
  ];
}
