# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# hardware = {
#     graphics.enable = true;
# };


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


  networking.extraHosts =
    ''
      192.168.0.168 media
      192.168.0.74 rhome 
    '';

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; }) # icons
    font-awesome # icons
    #vistafonts # Consolas
	];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lt = {
    isNormalUser = true;
    extraGroups = [ "wheel" "syncthing"]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  # programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;


services.samba-wsdd = { enable = true; };
services.samba = {
  enable = true;
  settings = {
      global = {
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "guest ok" = "yes";
          "guest account" = "nobody";
          "map to guest" = "bad user";
      };
      "media" = {
      "path" = "/mnt/multi/media";
      "browseable" = "yes";
      "read only" = "yes";
      "guest ok" = "yes";
      "create mask" = "0644";
      "directory mask" = "0755";
      };
    # eva = {
    #   path = "/mnt/data/backup/eva";
    #   browseable = "yes";
    #   "read only" = "no";
    #   "guest ok" = "no";
    #   "create mask" = "0644";
    #   "directory mask" = "0755";
    #   "force user" = "lt";
    #   #"force group" = "sdfa";
    # };
  };
};


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
        wl-clipboard # need for neovim
        nodejs
        # lua
        lua51Packages.lua
        # luajit
        # luajitPackages.luasnip
        luajitPackages.luarocks
        # luajitPackages.jsregexp
        tree-sitter # need for neovim
        ctags
        gcc
        ripgrep # need for neovim
        fd # need for neovim
    pavucontrol
    vial
    hyprshot
    gnumake
    wget
    git
    waybar
    dunst # notification
    wofi
    kitty
    zoxide
    google-chrome
    telegram-desktop
    keepassxc
    obsidian
    qbittorrent
    doublecmd
    python312Full
    unzip
    celluloid
    # syncthing
    nekoray
    mc
    nemo-with-extensions
    libreoffice
  ];
programs.neovim = { defaultEditor = true; };

services.syncthing = {
  enable = true;
  dataDir = "/home/lt";
  openDefaultPorts = true;
  configDir = "/home/lt/.config/syncthing";
  user = "lt";
  group = "users";
  guiAddress = "127.0.0.1:8384";
};


services.udev = {
  packages = with pkgs; [
    qmk
    qmk-udev-rules # the only relevant
    qmk_hid
    vial
  ]; # packages
}; # udev



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.fish.enable = true;
  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};



nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
];



environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_SCALE_FACTOR = "1.5";
    GDK_DPI_SCALE = "1.5";
    GDK_SCALE = "2";
  # QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
# XCURSOR_SIZE,32
# HYPRCURSOR_SIZE,28
# EDITOR,nvim
# PAGER,subl
# HYPRCURSOR_THEME,rose-pine-hyprcursor
};


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

# services.openssh = {
#   enable = true;
#   ports = [ 22 ];
#   settings = {
#     PasswordAuthentication = true;
#     AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
#     UseDns = true;
#     X11Forwarding = false;
#     PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
#   };
# };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}

