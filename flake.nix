{
    description = "NixOS flake for cqrect";
    
    nixConfig = {
        substituters = [
            "https://mirror.sjtu.edu.cn/nix-channels/store"
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
        ];

        trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
    };

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkags/nixos-23.11";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, ... }@inputs {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix

                {
                    nix.settings.trusted-users = [ "chen" ];
                }
            ];
        };
    };
}