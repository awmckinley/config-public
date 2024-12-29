{ isLinux, lib, ... }:
{ }
// lib.optionalAttrs isLinux {
  # disable PulseAudio server
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    # server and user space API to deal with multimedia pipelines
    enable = true;

    # support ALSA
    alsa.enable = true;
    alsa.support32Bit = true;

    # emulate PulseAudio
    pulse.enable = true;
  };

  # enable RealtimeKit service
  security.rtkit.enable = true;
}
