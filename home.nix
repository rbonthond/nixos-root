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

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    alejandra
    autorandr
    bash
    bat
    cachix
    colordiff
    coreutils
    curl
    delta
    direnv
    lsd
    fd
    fwupd
    fzf
    git
    git-lfs
    gzip
    htop
    just
    jq
    ksh
    lfs
    mc
    ncdu
    nerd-fonts.jetbrains-mono
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
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {enable = true;};
    };
    git = {
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
    lsd = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
