{ pkgs, config, ... }:

{
  home.file.".config/kak/colors/theme.kak".text = ''
    # Color palette
    declare-option  str rosewater       'rgb:${config.colorScheme.colors.base06}'
    declare-option  str red             'rgb:${config.colorScheme.colors.base08}'
    declare-option  str mauve           'rgb:${config.colorScheme.colors.base0E}'
    declare-option  str maroon          'rgb:eba0ac'
    declare-option  str pink            'rgb:f5c2e7'
    declare-option  str cyan            'rgb:74c7ec'
    declare-option  str yellow          'rgb:${config.colorScheme.colors.base0A}'
    declare-option  str green           'rgb:${config.colorScheme.colors.base0B}'
    declare-option  str white           'rgb:${config.colorScheme.colors.base05}'
    declare-option  str blue            'rgb:${config.colorScheme.colors.base0D}'
    declare-option  str sky             'rgb:89dceb'
    declare-option  str lavender        'rgb:${config.colorScheme.colors.base07}'
    declare-option  str black1          'rgb:${config.colorScheme.colors.base01}'
    declare-option  str black2          'rgb:${config.colorScheme.colors.base00}'
    declare-option  str black3          'rgb:${config.colorScheme.colors.base02}'
    declare-option  str orange          'rgb:${config.colorScheme.colors.base09}'
    declare-option  str teal            'rgb:${config.colorScheme.colors.base0C}'
    declare-option  str gray0           'rgb:${config.colorScheme.colors.base04}'
    declare-option  str gray1           'rgb:6c7086'
    declare-option  str bright_red      %opt{red}
    declare-option  str bright_green    %opt{green}
    declare-option  str bright_yellow   %opt{yellow}
    declare-option  str bright_blue     %opt{blue}
    declare-option  str bright_cyan     %opt{cyan}
    declare-option  str bright_white    %opt{white}
    declare-option  str foreground      %opt{white}
    declare-option  str background      %opt{black2}

    # Markup
    set-face  global  title         "%opt{rosewater}"
    set-face  global  header        "%opt{bright_red}"
    set-face  global  bold          "%opt{mauve}"
    set-face  global  italic        "%opt{lavender}"
    set-face  global  mono          "%opt{green}"
    set-face  global  block         "%opt{cyan}"
    set-face  global  link          "%opt{green}"
    set-face  global  bullet        "%opt{green}"
    set-face  global  list          "%opt{white}"

    # Builtins
    set-face  global  Default             "%opt{white},%opt{background}"
    set-face  global  PrimarySelection    "%opt{gray0},%opt{lavender}"
    set-face  global  SecondarySelection  "%opt{lavender},%opt{gray0}"
    set-face  global  PrimaryCursor       "%opt{background},%opt{rosewater}"
    set-face  global  SecondaryCursor     "%opt{black1},%opt{teal}"
    set-face  global  PrimaryCursorEol    "%opt{gray0},%opt{mauve}"
    set-face  global  SecondaryCursorEol  "%opt{gray0},%opt{maroon}"
    set-face  global  LineNumbers         "%opt{gray1},%opt{background}"
    set-face  global  LineNumberCursor    "%opt{lavender},%opt{gray0}+b"
    set-face  global  LineNumbersWrapped  "%opt{teal},%opt{black1}+i"
    set-face  global  MenuForeground      "%opt{white},%opt{gray0}+b"
    set-face  global  MenuBackground      "%opt{white},%opt{black3}"
    set-face  global  MenuInfo            "%opt{black1},%opt{blue}"
    set-face  global  Information         "%opt{black1},%opt{lavender}"
    set-face  global  Error               "%opt{red},%opt{black2}"
    set-face  global  StatusLine          "%opt{white},%opt{black1}"
    set-face  global  StatusLineMode      "%opt{black2},%opt{yellow}"
    set-face  global  StatusLineInfo      "%opt{background},%opt{green}"
    set-face  global  StatusLineValue     "%opt{orange},%opt{gray0}"
    set-face  global  StatusCursor        "%opt{black1},%opt{lavender}"
    set-face  global  Prompt              "%opt{green},%opt{black2}"
    set-face  global  MatchingChar        "%opt{maroon},%opt{black2}"
    set-face  global  Whitespace          "%opt{gray1},%opt{background}+f"
    set-face  global  WrapMarker          Whitespace
    set-face  global  BufferPadding       "%opt{background},%opt{background}"

    # Code
    set-face  global  value           "%opt{orange}"
    set-face  global  type            "%opt{rosewater}"
    set-face  global  variable        "%opt{white}"
    set-face  global  module          "%opt{maroon}"
    set-face  global  function        "%opt{sky}"
    set-face  global  string          "%opt{green}"
    set-face  global  keyword         "%opt{blue}"
    set-face  global  operator        "%opt{blue}"
    set-face  global  attribute       "%opt{green}"
    set-face  global  comment         "%opt{gray1}"
    set-face  global  documentation   comment
    set-face  global  meta            "%opt{pink}"
    set-face  global  builtin         "%opt{lavender}+b"
  '';
}
