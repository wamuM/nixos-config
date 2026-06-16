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
    (texliveFull.withPackages (ps: with ps; [
        biblatex
        minted
        upquote
        tcolorbox
    ]))
    biber

    ## Java
    gradle
    graphviz
    jetbrains.idea-oss
    jdk21
    jdt-language-server

    # JavaScript
    nodejs
    

    # Prolog 
    swi-prolog

    # CLIPS (Expert System) 
    clips

    # Lean
    lean4
    
    # Lua
    lua-language-server # LSP

    # Rust 
    rustup
    rust-analyzer   # LSP

    # Haskell 
    haskell-language-server # LSP
    haskell.compiler.native-bignum.ghc98

    #python 
    python313
    pyright                         # LSP
    python313Packages.dbus-python   
    python313Packages.pip

    # Yaml
    yaml-language-server

    # JSon
    vscode-json-languageserver
    
  ];

}

