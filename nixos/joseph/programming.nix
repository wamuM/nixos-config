{ inputs, config, pkgs, ... }:
{
  programs.git = {
 	enable = true;
	config = {
		user.name = "wamu_M";
 		user.email = "contact@wamu-m.com";
	};
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # General
    gnumake
    pkg-config

    ## C/C++
    gcc 
    glibc
    clang-tools

    ## Latex
    texlive.combined.scheme-medium
   
    ## Java
    jetbrains.idea-community
    jdk21
    jdt-language-server

    # Prolog 
    swi-prolog

    # Lean
    lean4
    
    # Lua
    lua-language-server # LSP

    # Rust 
    rustup
    rust-analyzer   # LSP

    # Haskell 
    haskell-language-server # LSP

    #python :d
    python313
    pyright                         # LSP
    python313Packages.dbus-python   

    # Yaml
    yaml-language-server
    # JSon
    vscode-json-languageserver
    
  ];

}

