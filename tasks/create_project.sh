#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_PATH="$1"
mkdir -p "$PROJECT_PATH"

echo "$PROJECT_PATH"
