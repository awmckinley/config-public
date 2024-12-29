{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.brews = [
    # command-line tool to export and inspect local iMessage database
    "imessage-exporter"
  ];
}
