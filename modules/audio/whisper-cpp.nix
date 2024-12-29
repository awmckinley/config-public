{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # port of OpenAI's Whisper model in C/C++
    # replaces: faster-whisper, openai-whisper
    openai-whisper-cpp
  ];
}
