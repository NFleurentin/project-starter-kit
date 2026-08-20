#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <project_path>" "<project_name>"
    exit 1
fi

PROJECT_PATH="$1"
PROJECT_NAME="$2"


cd "$PROJECT_PATH"
dbt init --project-name=transform --skip-profile-setup

cd transform

rm -rf seeds/* macros/* models/staging/* models/marts/*
touch seeds/.gitkeep
touch macros/.gitkeep
touch models/staging/.gitkeep
touch models/marts/.gitkeep

cat > dbt_project.yml <<EOF
name: ${PROJECT_NAME}

profile: ${PROJECT_NAME}

seed-paths: ["seeds"]
model-paths: ["models"]
macro-paths: ["macros"]
clean-targets:
  - "target"
  - "dbt_packages"

seeds:
  # Builds seeds into '<your_schema_name>_raw'
  transform:
    +schema: raw

models:
  transform:
    +static_analysis: strict
    # Materialize staging models as views, and marts as tables
    staging:
      +materialized: view
    marts:
      +materialized: table
EOF