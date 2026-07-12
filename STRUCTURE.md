# Directory Layout of the project
## D /home/
Contains a directory for each user, notably `wamu-m`
### F /home/$USER/$HOSTNAME.nix
The file that defines specific stuff of that user in a specific host
### D /home/$USER/common
Common configurations to all hosts
### F /home/$USER/common/core/default.nix
Configuration that all hosts must import for that user
### D /home/$USER/common/optional/**
Configuration that can be optionally included to each host
## D /hosts/
Contains a directory for each host
### F /hosts/$HOSTNAME/configuration.nix
The main entry point for all hosts
### F /hosts/common/core/default.nix
Common configuration to all hosts
### D /hosts/common/optional/**
System configuration that can be optionally included to each host
### D /hosts/common/users/$USERNAME
Configurtion to set up each user in the system
## D /overlays/ 
Has overlays
## D /pkgs/ 
Has pkgs
## D /secrets/
Has sops secrets




