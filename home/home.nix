{ pkgs, ...}: {
  imports = [
    ./theme.nix
    ./bundle.nix
    ./packages.nix
  ];

  home = {
    # This needs to actually be set to your username
    username = "destony";
    homeDirectory = "/home/destony";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";

    sessionPath = [
        "/home/destony/Development/Apps"
    ];
  };

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "~/.local/share/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "~/.local/share/Steam/logs"
      ],
      "runtime" :
      [
        "${pkgs.opencomposite}/lib/opencomposite"
      ],
      "version" : 1
    }
  '';

  #"${pkgs.xrizer}/dev/target"
  #"${pkgs.opencomposite}/lib/opencomposite"

  programs.home-manager.enable = true;
}
