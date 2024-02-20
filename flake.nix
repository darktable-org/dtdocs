{
  description = "An environment for developing darktable's documentation";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      pkgs.mkShell {
        packages = with pkgs; [
          hugo
          yarn
          rsync
          gitFull
          perlPackages.Po4a
          python311Packages.weasyprint
          lychee
          zip
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
      };
  };
}
