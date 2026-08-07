{ self, inputs, ...}: {

    flake.nixosModules.art = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            aseprite
            blender
            blockbench
        ];
    };

}
