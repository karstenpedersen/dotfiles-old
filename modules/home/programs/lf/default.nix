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
      scrolloff = 8;
      incfilter = true;
      incsearch = true;
      roundbox = true;
    };
    commands = {
      editor-open = ''$$EDITOR "$f"'';
      open = ''$$OPENER "$f"'';
      mkdir = ''%printf "Directory name: "; read ans; mkdir $ans'';
      mkfile = ''%printf "File name: "; read ans; touch $ans'';
      chmod = ''%printf "Mode bits: "; read ans; for file in "$fx" do chmod $ans $file done'';
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      get-mime-type = "%xdg-mime query filetype \"$f\"";
      trash = ''
        ''${{
          for file in "$fx" do
            trash put "$(basename "$file")"
          done
        }}
      '';
      extract = ''
        ''${{
          set -f
          case $f in
            *.zip) unzip $f;;
            *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
            *.tar.gz|*.tgz) tar xzvf $f;;
            *.tar.xz|*.txz) tar xJvf $f;;
            *.tar) tar -xvf $f;;
            *.rar) unrar $f;;
            *) echo "Unsupported format";;
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
      X = "dragon-out";
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
