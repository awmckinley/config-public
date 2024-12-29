{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # your source for developer news, features, and videos
    "Developer" = 640199958;

    # everything developers need to create great applications
    "Xcode" = 497799835;
  };
}
