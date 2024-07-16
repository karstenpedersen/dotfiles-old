SOPS_FILE := './ignored/secrets/secrets.yaml'

# displays help menu
default:
  @just --list

# rebuild flake
rebuild host='':
  scripts/rebuild-flake.sh {{host}}

update:
  nix flake update

diff:
  git diff ':!flake.lock'

check-sops:
  scripts/check-sops.sh
