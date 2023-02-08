#!/usr/bin/env bash

set -Eeuo pipefail

darwin-rebuild switch --flake . --show-trace
