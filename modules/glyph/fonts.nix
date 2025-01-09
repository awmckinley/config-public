{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  fonts =
    {
      packages =
        with pkgs;
        [
          # pan-unicode version of Fixedsys, a classic DOS font
          # release: 2007-05-02
          fixedsys-excelsior

          # TrueType font set intended for source code
          # release: 2009
          anonymousPro

          # Ubuntu font family
          # release: 2010-06-21
          ubuntu_font_family

          # Font Awesome
          # release: 2012-03-03
          font-awesome

          # nice bitmap font, readable even at small sizes
          # release: 2012-08-21
          tewi-font

          # monospaced font family for user interface and coding environments
          # release: 2012-09-23
          source-code-pro

          # font for programming and code review
          # release: 2012
          envypn-font

          # font for programming and code review
          # release: 2013-09-17
          mononoki

          # font family with a great monospaced variant for programmers
          # release: 2013-11-18
          fantasque-sans-mono

          # font with ligatures for Haskell code based off Source Code Pro
          # release: 2014-04-06
          hasklig

          # fonts for code, from Font Bureau
          # release: 2014-08-03
          input-fonts

          # monospace font with programming ligatures
          # release: 2014-11-11
          fira-code

          # iconic font aggregator, collection, & patcher
          # release: 2014-12-04
          nerd-fonts.symbols-only

          # monospaced font created to be a most readable font for programming
          # release: 2014
          profont

          # monospace bitmap font well suited for programming and terminal use
          # release: 2015-01-10
          gohufont

          # coding font with alternates, ligatures and contextual positioning
          # release: 2015-04-02
          monoid

          # the Roboto family of fonts
          # release: 2015-04-10
          roboto

          # typeface family based on the Bitstream Vera fonts
          # release: 2015-05-17
          dejavu_fonts

          # beautiful and free fonts for many languages
          # release: 2015-06-04
          noto-fonts

          # typeface designed for source code
          # release: 2015-06-21
          hack-font

          # versatile typeface for code, from code
          # release: 2015-07-18
          iosevka

          # Droid Sans Mono Slashed + Hasklig-style ligatures
          # release: 2016-01-21
          borg-sans-mono

          # monospace font for both screen and print
          # release: 2016-05-23
          inconsolata

          # Go font family
          # release: 2016-11-16
          go-font

          # IBM Plex typeface
          # release: 2017-10-03
          ibm-plex

          # tall and condensed bitmap font for geeks
          # release: 2017-12-03
          scientifica

          # monospace bitmap font aimed at programmers
          # release: 2017-12-13
          dina-font

          # TrueType VT220 font
          # release: 2018-08-07
          glasstty-ttf

          # set of fixed-width screen fonts that are designed for code listings
          # release: 2018-12-10
          proggyfonts

          # typeface made for developers
          # release: 2019-03-01
          jetbrains-mono

          # free programming font with cursive italics and ligatures
          # release: 2019-05-10
          victor-mono

          # monospaced font that includes programming ligatures
          # release: 2019-07-10
          cascadia-code

          # Meslo Nerd Font patched for Powerlevel10k
          # release: 2020-01-31
          meslo-lgs-nf

          # free scalable coding font
          # release: 2021-12-01
          ttf-envy-code-r

          # open source monospace TrueType font with round corner and ligatures
          # release: 2022-04-08
          maple-mono

          # anonymous and neutral programming typeface
          # release: 2023-02-16
          commit-mono

          # expressive monospaced font family
          # release: 2023-04-11
          intel-one-mono

          # innovative superfamily of fonts for code
          # release: 2023-09-25
          monaspace

          # font family created by Vercel in collaboration with Basement Studio
          # release: 2023-10-16
          geist-font

          # sharp, readable, vector-y version of Monocraft
          # release: 2024-02-04
          miracode
        ]
        ++ lib.optionals isLinux [
          # ultimate oldschool PC font pack
          # release: 2020-04-22
          ultimate-oldschool-pc-font-pack
        ];
    }
    // lib.optionalAttrs isLinux {
      # basic set of fonts providing several styles and families
      enableDefaultPackages = true;

      # some apps need /usr/X11/fonts
      fontDir.enable = true;
    };
}
