SOPS_FILE := './ignored/secrets/secrets.yaml'
HOST_FILE := './ignored/host'

# displays help menu
default:
  @just --list

init host='':
  scripts/init.sh {{host}} {{HOST_FILE}}

# rebuild flake
rebuild host='':
  scripts/rebuild-flake.sh {{host}} {{HOST_FILE}}

update:
  nix flake update

diff:
  git diff ':!flake.lock'

check-sops:
  scripts/check-sops.sh
