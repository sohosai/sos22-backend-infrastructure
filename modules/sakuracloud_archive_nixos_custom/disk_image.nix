{ pkgs ? import ../../nix/pkgs.nix
, configFileText
, contentTextsJson
}:
let
  contents = map
    (content: {
      inherit (content) target;
      source = pkgs.writeText "content" content.content;
      mode = content.mode or null;
      user = content.user or null;
      group = content.group or null;
    })
    (builtins.fromJSON contentTextsJson);
  configFile = pkgs.writeText "configuration.nix" configFileText;
in
import ../../nix/disk {
  inherit pkgs contents;
  additionalImports = [ (builtins.toPath configFile) ];
}
