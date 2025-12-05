# To run : nix-shell <filename>


{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Port scanners & recon
    nmap masscan zmap
    gobuster ffuf python3Packages.dirsearch

    # Exploitation frameworks
    metasploit sqlmap

    # Web app testing
    burpsuite nikto whatweb wpscan

    # Password cracking
    john hashcat hydra

    # Wireless & network
    aircrack-ng wireshark tshark


    # Utilities
    netcat dnsutils whois
  ];

  shellHook = ''
    echo "Red Team Cyber Environment Loaded!"
    export PS1="🔴 \w \$ "
  '';
}
