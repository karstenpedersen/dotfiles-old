{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.karsten = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        # adblocker-ultimate
        duckduckgo-privacy-essentials
        firefox-color
        markdownload
        react-devtools
        vimium
        auto-tab-discard
        # zotero-connector
      ];
    };
  };
}
