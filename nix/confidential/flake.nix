{
  description = "Minimal flake to output Homebrew configuration";

  outputs = { self, ... }: {
    homebrewConfig = {
      brews = [
        "square/formula/aws-creds"
        "square/formula/sq"
        "square/formula/sq-codesearch"
      ];

      casks = [];

      taps = [
        {
          name = "square/formula";
          clone_target = "git+ssh://git@github.com/squareup/homebrew-formulas.git";
          force_auto_update = true;
        }
      ];
    };
  };
}