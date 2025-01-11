{
  config,
  lib,
  pkgs,
  ...
}:
{
  options =
    with lib.types;
    let
      optionValueType = oneOf [
        schemeAttrsType
        path
        str
      ];

      coerce = value: if value ? "scheme-name" then value else config.lib.base16.mkSchemeAttrs value;
      schemeAttrsType = attrsOf anything;
    in
    {
      schemeDark = lib.options.mkOption {
        description = "Current scheme for dark mode";
        type = coercedTo optionValueType coerce schemeAttrsType;
        default = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
      };

      schemeLight = lib.options.mkOption {
        description = "Current scheme for light mode";
        type = coercedTo optionValueType coerce schemeAttrsType;
        default = "${pkgs.base16-schemes}/share/themes/default-light.yaml";
      };
    };

  config =
    let
      env = scheme: {
        text = ''
          BASE00='${scheme.base00}'
          BASE01='${scheme.base01}'
          BASE02='${scheme.base02}'
          BASE03='${scheme.base03}'
          BASE04='${scheme.base04}'
          BASE05='${scheme.base05}'
          BASE06='${scheme.base06}'
          BASE07='${scheme.base07}'
          BASE08='${scheme.base08}'
          BASE09='${scheme.base09}'
          BASE0A='${scheme.base0A}'
          BASE0B='${scheme.base0B}'
          BASE0C='${scheme.base0C}'
          BASE0D='${scheme.base0D}'
          BASE0E='${scheme.base0E}'
          BASE0F='${scheme.base0F}'
          SLUG='${scheme.slug}'
        '';
      };
    in
    {
      environment = {
        etc = {
          "theme.dark.env" = env config.schemeDark;
          "theme.light.env" = env config.schemeLight;
        };

        variables = {
          # export themes to env
          THEME_DARK = config.schemeDark.slug;
          THEME_LIGHT = config.schemeLight.slug;
          VARIANT_DARK = config.schemeDark.variant;
          VARIANT_LIGHT = config.schemeLight.variant;
        };
      };
    };
}
