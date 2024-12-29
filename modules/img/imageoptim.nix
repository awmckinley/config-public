{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # optimize images using multiple utilities
    image_optim

    # image_optim dependencies
    advancecomp
    gifsicle
    jhead
    jpegoptim
    jpeg-archive
    mozjpeg
    optipng
    oxipng
    pngcrush
    pngquant
    nodePackages.svgo
  ];
}
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool to optimise images to a smaller size
    "imageoptim"
  ];
}
