let
  # We pin to a specific nixpkgs commit for reproducibility.
  # Last updated: 2024-04-29. Check for new commits at https://status.nixos.org.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae.tar.gz") {};
in pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      pandas
      requests
      pwntools
      pip
      pyngrok
      binwalk
      pyshark
      ropper
      pycryptodome
      onetimepad
      sympy
      beautifulsoup4
      selenium
      gmpy2
    ]))
  ];

  buildInputs = with pkgs; [
    python3
  ];

  shellHook = ''
    YELLOW='\033[1;33m'
    NC="$(printf '\033[0m')"

    echo -e "''${YELLOW}Creating python environment...''${NC}"
    echo "installed packages:"
    echo "pandas, requests, pwntools, pip, pyngrok, binwalk, pyshark, ropper, pycryptodome, onetimepad,"
    echo "sympy, beautfulsoup4, selenium"
    '';
}
