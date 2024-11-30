set shell := ["/bin/sh", "-c"]

# Extra flags to pass to the nix command, e.g. '--print-build-logs' or
# '--keep-going'

extra_nix_flags := ""

# Override this to use a nix not in the PATH

nix_executable := "nix"

# The final nix command

nix_command := nix_executable + " --experimental-features 'nix-command flakes'" + (if extra_nix_flags != "" { " " + extra_nix_flags } else { "" })

# Show this list
_list-recipes:
    @just --list --unsorted --list-prefix '    '
    @echo "Variables:"
    @just --evaluate | while IFS= read line; do echo "    $line"; done

# Run a darwin-rebuild command on block (note that activate requires using darwin-rebuild from target)
block command="build":
    {{ quote(if command == "activate" { `nix --experimental-features 'nix-command flakes' build --no-link --print-out-paths '.#darwinConfigurations.block.system'` / "sw" / "bin" / "darwin-rebuild" } else { 'darwin-rebuild' }) }} --flake '.#block' {{ quote(command) }}

# Fetch new versions of all flake inputs and regenerate the flake.lock
update-inputs:
    {{ nix_command }} flake update --commit-lock-file

# Pin an input in the flake.lock to a specific flake reference
override-input input flake:
    {{ nix_command }} flake lock --override-input {{ quote(input) }} {{ quote(flake) }}

# Check flake evaluation and run all checks
check-flake:
    {{ nix_command }} flake check

# Check formatting
check-formatting:
    {{ nix_command }} build '.#checks.{{ `nix eval --impure --expr 'builtins.currentSystem'` }}.check-format'
    just --unstable --fmt --check

# Run the formatter
reformat:
    {{ nix_command }} fmt
    just --unstable --fmt

# List image formats supported by nixos-generators
list-image-formats:
    {{ nix_command }} run 'github:nix-community/nixos-generators#nixos-generate' -- --list

# Use nixos-generate to build an image for the given system
build-nixos-image format system configuration:
    {{ nix_command }} run 'github:nix-community/nixos-generators#nixos-generate' -- --format {{ quote(format) }} --system {{ quote(system) }} --configuration ./installers/configuration.nix

# Build a custom installer with nixos-generators
build-nixos-installer system configuration="./installers/configuration.nix":
    just build-nixos-image {{ if system =~ "^aarch64-" { "sd-aarch64-installer" } else { "install-iso" } }} {{ quote(system) }} {{ quote(configuration) }}

# Rebuild the nix-index index
reindex:
    {{ nix_command }} build --no-link --print-out-paths 'nixpkgs#nix-index'
    {{ nix_command }} run 'nixpkgs#nix-index'

# Run the nix installer
install-nix force="false":
    if {{ if force == "true" { "true" } else { "! command -v nix" } }}; then {{ "curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install" }}; fi

# Bootstrap block
bootstrap-block: install-nix (block "switch")
