{
  pkgs,
  config,
  ...
}: {
  home = {
    stateVersion = "22.11";
    username = "root";
    homeDirectory = "/root";
  };

  home.packages = with pkgs; [
    alejandra
    bash
    bat
    cachix
    colordiff
    coreutils
    curl
    delta
    direnv
    exa
    fd
    fwupd
    fzf
    git
    git-lfs
    gzip
    htop
    jq
    ksh
    lfs
    mc
    ncdu
    neofetch
    nix-direnv
    p7zip
    pciutils
    pigz
    procs
    ripgrep
    rsync
    tcsh
    tmux
    tree
    unzip
    vim
    wget
    xz
    zsh
  ];

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    command-not-found.enable = true;
    dircolors.enable = true;
    htop.enable = true;
    jq.enable = true;
    starship.enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv = {enable = true;};
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    delta.enable = true;
    userName = "Robbin Bonthond";
    userEmail = "robbin@bonthond.com";
    aliases = {
      ci = "commit";
      co = "checkout";
    };
    extraConfig = {
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        ui = "auto";
      };
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

}
