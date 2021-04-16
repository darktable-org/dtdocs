{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a64b9f2b106607b5d533c8238e577a79b229a679.tar.gz") {}
}:

pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = [
    pkgs.hugo
    pkgs.yarn
    pkgs.rsync
    pkgs.gitFull
    pkgs.perlPackages.Po4a
    pkgs.python38Packages.weasyprint
    pkgs.linkchecker
  ];
  shellHook = ''
    PROJECTDIR=`pwd`
    hugo-deploy() {
      echo "This doesn't do anything, but maybe it will one day."
    }
    update-assets() {
      cd $PROJECTDIR && cd themes/hugo-darktable-docs-theme/assets && yarn install && cd $PROJECTDIR
    }
    generate-po() {
      cd $PROJECTDIR && cd tools/ && ./generate-translations.sh --no-translations && cd $PROJECTDIR
    }
    generate-translated-files() {
      cd $PROJECTDIR && cd tools/ && ./generate-translations.sh --no-update && cd $PROJECTDIR
    }
    remove-translated-files() {
      cd $PROJECTDIR && cd tools/ && ./generate-translations.sh --rm-translations && cd $PROJECTDIR
    }
    '';
}
