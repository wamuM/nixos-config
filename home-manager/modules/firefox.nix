{config, pkgs, lib, ...}:
{
options.bundle.firefox = {
    enable = lib.mkEnableOption "Enable firefox config";
};
config = lib.mkIf config.bundle.firefox.enable {
    xdg.desktopEntries = {
    firefox-personal = {
        name = "Firefox Personal";
        genericName = "Web Browser";
        exec = "firefox -P Personal %U";
        categories = [ "Network" "WebBrowser" ];
        mimeType = ["text/html" "text/xml" ];
        terminal = false;
    };
    firefox-upc = {
        name = "Firefox UPC";
        genericName = "Web Browser";
        exec = "firefox -P UPC %U";
        categories = [ "Network" "WebBrowser" ];
        mimeType = ["text/html" "text/xml" ];
        terminal = false;
    };
    firefox-nix = {
        name = "Firefox Nix";
        genericName = "Web Browser";
        exec = "firefox -P Nix %U";
        categories = [ "Network" "WebBrowser" ];
        mimeType = ["text/html" "text/xml" ];
        terminal = false;
    };
    };
    programs.firefox = {
        enable = true;
        languagePacks = ["en-US" "es-ES" "fr" "ca" "zh-CN"];
        policies = {
            DisableTelemetry = true;
            DisableAccounts = true;
            DisableFirefoxStudies = true;
            TranslateEnabled = false;
            BlockAboutAddons = false;
            BlockAboutConfig = false; 
            BlockAboutProfiles = false;
            OverrideFirstRunPage = "";
            NoDefaultBookmarks = true;
            DefaultDownloadDirectory = "\${home}/Downloads";
            ExtensionSettings = {
                "*".installation_mode = "blocked";
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };

                "sponsorBlocker@ajay.app" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
                    installation_mode = "force_installed";
                };
            };
        };
        profiles = {
            personal = {
                id=0;
                name="Personal";
                search = {
                    default = "ddg";
                    force = true;
                    engines = {
                        bing.metaData.hidden = true;
                        google.metaData.hidden = true;
                        ecosia.metaData.hidden = true;
                        perplexity.metaData.hidden = true;
                        qwant.metaData.hidden = true;
                    };
                };
                settings = {};
            };
            upc = {
                id=1;
                name="UPC";
                search = {
                    default = "ddg";
                    force = true;
                    engines = {
                        bing.metaData.hidden = true;
                        google.metaData.hidden = true;
                        ecosia.metaData.hidden = true;
                        perplexity.metaData.hidden = true;
                        qwant.metaData.hidden = true;
                    };
                };
                settings = {};
            };
            nix = {
                id=2;
                name="Nix";
                search = {
                    default = "nix-packages";
                    force = true;
                    engines = {
                        nix-packages = {
                            name = "Nix Packages";
                            urls = [{
                                template = "https://search.nixos.org/packages";
                                params = [
                                { name = "type"; value = "packages"; }
                                { name = "query"; value = "{searchTerms}"; }
                                ];
                            }];

                            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@np" ];
                        };

                        nixos-wiki = {
                            name = "NixOS Wiki";
                            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
                            definedAliases = [ "@nw" ];
                        };
                        bing.metaData.hidden = true;
                        google.metaData.hidden = true;
                        ecosia.metaData.hidden = true;
                        perplexity.metaData.hidden = true;
                        qwant.metaData.hidden = true;
                    };
                };
            };
        };
    };
};
}
