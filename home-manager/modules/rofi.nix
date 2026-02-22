{ pkgs, lib, config, ...}:
{
  options.bundle = {
	rofi.enable = lib.mkEnableOption "enables rofi";
  }; 
  config = lib.mkIf config.bundle.rofi.enable {
    home.file.".local/bin/launcher" = {
        text = ''
            #!/usr/bin/env bash
            rofi -show drun
        '';
        executable = true;
    };
    home.file.".local/bin/power-options" = {
        text = ''
            #!/usr/bin/env bash
            rofi -show power
        '';
        executable = true;
    };
    home.file.".config/rofi/scripts/power" = {
        text = ''
            #!/usr/bin/env python3 
            import os
            import sys
            import subprocess
            
            def push_option(key,value):
                line = f"\0{key}\x1f{value}\n"
                sys.stdout.buffer.write(line.encode("ascii"))
            def push_entry(row,metadata=None):
                line = f"{row}"
                first = True
                if metadata != None:
                    for key, value in metadata.items():
                        if first:
                            line += "\0"
                        else:
                            line += "\x1f"
                        line += f"{key}\x1f{value}"
                        first = False
                line += "\n"
                sys.stdout.buffer.write(line.encode("ascii"))
            
            def main():
                retv = int(os.getenv("ROFI_RETV",0))
                data = os.getenv("ROFI_DATA",None)
                info = os.getenv("ROFI_INFO",None)
                args = sys.argv[1:]
                if retv == 0:
                    push_option("no-custom","true")
                    push_option("prompt","Power Option")
                    push_entry("poweroff")
                    push_entry("reboot")
                    push_entry("suspend")
                    # push_entry("hybernate") ## Disabled in QubesOS
                    push_entry("log out")
                if retv == 1:
                    if args[0] == "poweroff":
                        subprocess.run(["systemctl","poweroff"]) 
                    elif args[0] == "reboot":
                        subprocess.run(["systemctl","reboot"])
                    elif args[0] == "suspend": 
                        subprocess.run(["systemctl","suspend"])
                    elif args[0] == "hybernate":
                        subprocess.run(["systemctl","hybrid-sleep"])
                    elif args[0] == "log out":
                        subprocess.run(["log-out"])
                else: 
                    exit(1)
            if __name__ == "__main__":
                main()
            '';
            executable = true;
    };
    home.sessionPath = [
        "$HOME/.local/bin"
    ];
    programs.rofi = {
        enable = true;
        theme = "sidebar";
        font = "JetBrainsMono Nerd Font Mono";
        package = pkgs.rofi;
        modes = [
        "drun"
        "run"
        "window"
    ];
    extraConfig = {
      show-icons = true;
    };
  };
  };
}
