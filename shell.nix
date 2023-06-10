{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/81ed90058a851eb73be835c770e062c6938c8a9e.tar.gz") {}
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
    pkgs.zip
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
      # cd $PROJECTDIR && cd tools/ && ./generate-translations.sh --rm-translations && cd $PROJECTDIR # This is really slow
      cd $PROJECTDIR
      find . -name '*.de.md' -exec rm {} \;
      find . -name '*.es.md' -exec rm {} \;
      find . -name '*.fr.md' -exec rm {} \;
      find . -name '*.nl.md' -exec rm {} \;
      find . -name '*.pl.md' -exec rm {} \;
      find . -name '*.pt_br.md' -exec rm {} \;
      find . -name '*.uk.md' -exec rm {} \;
    }
    '';
}
