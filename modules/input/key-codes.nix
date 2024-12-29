{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # display key code, unicode value and modifier keys state for any combination
    "key-codes"
  ];
}
