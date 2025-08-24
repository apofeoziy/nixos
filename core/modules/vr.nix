{ pkgs, lib, ... }: {
  environment.systemPackages = [
    pkgs.wlx-overlay-s
    pkgs.oscavmgr
    pkgs.motoc
    pkgs.dotnet-sdk_9
    pkgs.dotnet-aspnetcore_9
    pkgs.dotnet-runtime_9
    pkgs.openxr-loader
    pkgs.lighthouse-steamvr
  ];
  programs.adb.enable = true;
  nixpkgs.config.cudaSupport = true;
  environment.sessionVariables = {
    WIVRN_USE_STEAMVR_LH = "1";
  };
  services.wivrn = {
    package = pkgs.wivrn.overrideAttrs (old: {
      version = "v25.6";
      src = pkgs.fetchFromGitHub {
        owner = "wivrn";
        repo = "wivrn";
        rev = "8691be26774de2ceb85b1a8ef7672c0f2ea9f85d";
        hash = "sha256-bn7W63s2gIvG1DYA3lSfqZIeqCH9QqKYZfqzjV6W1qI=";
      };
      cmakeFlags = old.cmakeFlags ++ [
        (lib.cmakeBool "WIVRN_FEATURE_STEAMVR_LIGHTHOUSE" true)
      ];
      #postUnpack = ''
      #    echo "e8f9a069f1d26ffa857846356d581edffd3ec4a9" > $sourceRoot/monado-rev
      #  '';
      postFixup = ''
        wrapProgram $out/bin/wivrn-dashboard \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pkgs.vulkan-loader ]}
        wrapProgram $out/bin/wivrn-server \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pkgs.SDL2 pkgs.libudev-zero ]}
      '';
    });
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = true;
  };
}
