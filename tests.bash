#!/usr/bin/env bash
set -eo pipefail

nix-build

./result/bin/esbuild
