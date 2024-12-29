{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # more advanced file pager than "more"
    less

    # preprocessor for less
    lesspipe

    # lesspipe colorizer
    bat

    # lesspipe compression/archive
    gzip
    bzip2
    p7zip # replaces: cabextract, cpio, isoinfo, lzma, xz
    zstd
    brotli
    lz4
    libarchive # replaces: ar, cpio, isoinfo, rar, unrar, unzip
    lzip
    squashfsTools

    # lesspipe preprocessed
    groff # replaces: man, mandoc
    clang
    catdoc # replaces: in2csv, libreoffice, wvText
    pandoc # replaces: column, csvlok, csvtable, docx2txt, libreoffice, mdcat, odt2txt
    unrtf # replaces: libreoffice
    html2text # replaces: elinks, lynx, w3m, xmq
    poppler_utils
    perl
    texliveMedium
    djvulibre
    ghostscript_headless
    id3v2
    exiftool # replaces: identify, mediainfo
    netcdf # replaces: h5dump
    openssl
    matio
    procyon
    libplist
    jq
    dtc
  ];
}
