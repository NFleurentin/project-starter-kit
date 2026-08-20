#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_PATH="$1"
mkdir -p "$PROJECT_PATH"

echo "$PROJECT_PATH"

cd "$PROJECT_PATH"
mkdir -p data/dev data/staging data/prod

cat > .gitignore << 'EOF'
data/
.vscode/
EOF

mkdir .vscode
cat > .vscode/extensions.json << 'EOF'
{
  "recommendations": [
    "dbtLabsInc.dbt"
  ]
}
EOF

cat > .vscode/settings.json << 'EOF'
{
    "python.defaultInterpreterPath": "ingest/.venv/bin/python",
    "python.terminal.activateEnvironment": true,
    "python.terminal.activateEnvInCurrentTerminal": true,
}
EOF