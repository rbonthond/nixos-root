#!/usr/bin/env nix-shell
#!nix-shell -i bash -p figlet
set -euo pipefail

function banner {
  echo
  figlet -k -w 132 -f standard "$1" | sed -e 's/^/# /'
  echo
}

# update flakes
banner 'Flake Update'
nix flake update

# update home manager
banner 'Home Manager'
home-manager switch -v --keep-going

# show changes
banner 'Update Changes'
nixStateDir="${NIX_STATE_DIR:-/nix/var/nix}"
profilesPath="$nixStateDir/profiles/per-user/$USER"
nix store diff-closures $(~/.nix-profile/bin/ls -dv $profilesPath/profile-*-link | tail -2)
