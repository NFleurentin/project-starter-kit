#!/usr/bin/env bash
set -euo pipefail

# Autoriser tous les scripts .sh dans pipeline/ et tasks/
find pipelines tasks -type f -name "*.sh" -exec echo "Executable: {}" \; -exec chmod +x {} \;

echo "Permissions des scripts mises à jour."
