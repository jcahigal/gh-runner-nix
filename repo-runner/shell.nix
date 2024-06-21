 let
   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
   pkgs = import nixpkgs { config = {}; overlays = []; };
 in

 pkgs.mkShellNoCC {
   packages = with pkgs; [
     git
     cowsay
     lolcat
     docker
     docker-compose
   ];


   shellHook = ''
     echo "Welcome to Solstix" | cowsay | lolcat
   '';
 }