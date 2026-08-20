#!/usr/bin/env bash
set -euo pipefail

##############################################
# 0) Vérification des paramètres
##############################################
if [ $# -ne 2 ]; then
    echo "Usage: $0 <parent_path> <project_name>"
    exit 1
fi

PARENT_PATH="$1"
PROJECT_NAME="$2"

PROJECT_PATH="$PARENT_PATH/$PROJECT_NAME"
./tasks/create_project.sh "$PROJECT_PATH"
./tasks/init_meltano.sh "$PROJECT_PATH"
./tasks/init_dbt.sh "$PROJECT_PATH" "$PROJECT_NAME"

echo "🎉 Setup terminé pour le projet : $PROJECT_NAME"