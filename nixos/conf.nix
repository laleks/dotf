# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }: {

  imports = [./hardware.nix];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #security.polkit.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Configure keymap in X11
  #services.xserver = {
 #   enable = true;
    #videoDrivers = [ "amdgpu" ];
    #layout = "us";
    #xkbVariant = "";
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lt = {
    isNormalUser = true;
    description = "Aleks";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
              ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      neovim
      waybar
      wofi
      qalculate-gtk
      brave
      pavucontrol
      wl-clipboard
      cliphist
      telegram-desktop
      foot
      grim #for screen shot under wayland 
      git
      wtype
      keepassxc
      htop
      libreoffice
      mpv
      obsidian
      qbittorrent
      syncthing
      doublecmd
      lua
      luajit
      ctags
      gcc
      ripgrep
      lua-language-server
      swaybg
      gparted
      vscodium
      python311Full
      poetry
  ];


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; }) # icons
    font-awesome # icons
    #vistafonts # Consolas
	];




  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.steam.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  sound.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	pulse.enable = true;
	jack.enable = true;
	};

  services.gnome.gnome-keyring.enable = true;
  services.flatpak.enable = true;

services.samba-wsdd.enable = true;
services.samba = {
  enable = true;
  securityType = "user";
  extraConfig = ''
    workgroup = WORKGROUP
    server string = smbnix
    netbios name = smbnix
    security = user 
    guest ok = yes
    guest account = nobody
    map to guest = bad user
    load printers = no
  '';
  shares = {
    media = {
      path = "/mnt/multi/media";
      browseable = "yes";
      "read only" = "yes";
      "guest ok" = "yes";
      "create mask" = "0644";
      "directory mask" = "0755";
    };
    eva = {
      path = "/mnt/data/backup/eva";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "no";
      "create mask" = "0644";
      "directory mask" = "0755";
      "force user" = "lt";
      #"force group" = "sdfa";
    };
  };
};


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.11"; # Did you read the comment?

}

