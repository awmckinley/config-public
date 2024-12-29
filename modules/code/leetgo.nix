{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # command-line tool for LeetCode
    # replaces: leetcode-cli
    leetgo
  ];
}
