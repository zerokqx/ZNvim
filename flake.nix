{
  description = "Neovim with Lua config";
  # Краткое описание флейка

  inputs = {
    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs";
    # Подключаем официальный репозиторий пакетов nixpkgs
  };

  outputs = { self, nixpkgs, neovim }: {
    packages.x86_64-linux.znvim = neovim.packages.x86_64-linux.neovim;
    apps.x86_64-linux.default = {
      type = "app";
      program = "${neovim.packages.x86_64-linux.neovim}/bin/nvim";
      args = [ "-u" "${self}/init.lua" ];
    };
  };
}
