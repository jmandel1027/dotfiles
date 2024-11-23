{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, ... }:
  let
    configuration = { pkgs, config, confidential }: {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        awscli
        aws-iam-authenticator
        ffmpeg
        git
        gh
        gnupg
        iperf
        fzf
        lua-language-server
        nil
        pass
        rclone
        ripgrep
        rustup
        sqlc
        stylua
        qmk
        trufflehog
        starship
        zoxide
        mkalias
        neovim
        obsidian
        tmux
        vim
      ];  
      
      homebrew = {
        enable = true;
        brews = [
          "brotli"
          "giflib"
          "highway"
          "imath"
          "jpeg-turbo"
          "libdeflate"
          "libpng"
          "lz4"
          "xz"
          "zstd"
          "libtiff"
          "little-cms2"
          "openexr"
          "webp"
          "jpeg-xl"
          "libvmaf"
          "aom"
          "m4"
          "autoconf"
          "automake"
          "ca-certificates"
          "pycparser"
          "cffi"
          "openssl@3"
          "cryptography"
          "mpdecimal"
          "readline"
          "sqlite"
          "python@3.12"
          "bash"
          "bash-completion"
          "bazelisk"
          "bc"
          "gettext"
          "jemalloc"
          "json-c"
          "libunistring"
          "libidn2"
          "libnghttp2"
          "libuv"
          "userspace-rcu"
          "bind"
          "c-ares"
          "freetype"
          "fontconfig"
          "pcre2"
          "python-packaging"
          "python@3.13"
          "saml2aws"
          "supervisor"
          "mas"
        ];
        casks = [
          "iina"
          "the-unarchiver"
        ];
        taps = [];
        masApps = {};
        onActivation = {
          cleanup = "zap";
        };
      };

      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.stateVersion = 5;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."jmandel" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "jmandel";
            autoMigrate = true;
          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."jmandel".pkgs;
  };
}
