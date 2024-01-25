{ pkgs, config, ... }:

{
  programs.lf = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      hidden = true;
      ignorecase = true;
      preview = true;
      icons = true;
      tabstop = 2;
      ratios = "1:2:3";
    };
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR "$f"'';
      open = ''$$EDITOR "$f"'';
      mkdir = ''
        ''${{printf "Directory name: "
          read DIR
          mkdir $DIR
        }}
      '';
      mkfile = ''
        ''${{printf "File name: "
          read FILE
          touch $FILE
        }}
      '';
      get-mime-type = "%xdg-mime query filetype \"$f\"";
      trash = ''
      '';
      extract = ''
        ''${{
          set -f
          case $f in
            *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
            *.tar.gz|*.tgz) tar xzvf $f;;
            *.tar.xz|*.txz) tar xJvf $f;;
            *.zip) unzip $f;;
          esac
        }}
      '';
      zip = ''
        ''${{
          set -f
          mkdir $1
          cp -r $fx $1
          zip -r $1.zip $1
          rm -rf $1
        }}
      '';
    };
    keybindings = {
      xdo = "dragon-out";
      e = "editor-open";
      o = "open";
      d = "mkdir";
      x = "cut";
      y = "copy";
      "<enter>" = "open";
      # "%" = "mkfile";
      gh = "cd ~";
      gd = "cd ~/Documents";
      gD = "cd ~/Downloads";
      gp = "cd ~/Pictures";
      gc = "cd ~/dotfiles";
      gt = "cd ~/.trash";
      D = "trash";
      gmt = "get-mime-type";
      zz = "zip";
      ze = "extract";
    };
    extraConfig =
      let
        previewer =
          pkgs.writeShellScriptBin "pv.sh" ''
            file=$1
            w=$2
            h=$3
            x=$4
            y=$5

            if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
                ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
                exit 1
            fi

            ${pkgs.pistol}/bin/pistol "$file"
          '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in
      ''
        $mkdir -p ~/.trash

        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
  };
  xdg.configFile."lf/icons".source = ./icons;
}
