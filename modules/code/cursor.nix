{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # write, edit, and chat about your code with AI
    "cursor"
  ];
}
