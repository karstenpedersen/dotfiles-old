{ lib, inputs, config, ... }:

let
  cfg = config.host.locale;
in
{
  options.host.locale = {
    timeZone = lib.mkOption {
      default = "Europe/Copenhagen";
      description = ''
        time zone
      '';
    };
    kbLocale = lib.mkOption {
      default = "en_DK.UTF-8";
      description = ''
        writing locale
      '';
    };
    locale = lib.mkOption {
      default = "da_DK.UTF-8";
      description = ''
        locale
      '';
    };
  };

  config = {
    time.timeZone = cfg.timeZone;
    i18n.defaultLocale = cfg.kbLocale;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = cfg.locale;
      LC_IDENTIFICATION = cfg.locale;
      LC_MEASUREMENT = cfg.locale;
      LC_MONETARY = cfg.locale;
      LC_NAME = cfg.locale;
      LC_NUMERIC = cfg.locale;
      LC_PAPER = cfg.locale;
      LC_TELEPHONE = cfg.locale;
      LC_TIME = cfg.locale;
    };
  };
}
