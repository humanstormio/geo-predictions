#!/bin/bash
# Generates a proof.json for a given prediction.md file using OpenTimestamps.
set -e
shopt -s expand_aliases
# ots-cli.js should be in PATH or alias it here
# install ots-cli.js via npm: npm install -g ots-cli.js
alias ots='ots-cli.js'
FILE="$1"
script_name="${BASH_SOURCE[0]##*/}"
if [ -z "$FILE" ]; then
  echo "Usage: ./$script_name path/to/prediction.md"
  exit 1
fi

DIR=$(dirname "$FILE")
BASENAME=$(basename "$FILE")

echo "Processing: $FILE"

# 1. SHA256 (raw, machine-safe)
SHA256=$(sha256sum "$FILE" | awk '{print $1}')

# 2. Create OTS if not exists

ots stamp "$FILE"

# 3. Timestamp
CREATED=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# 4. Derive ID from path

INPUT_FILE="$1"

# Full file path in Git Bash format
FULL_PATH="$(realpath "$INPUT_FILE")"

# Git root in Git Bash format
GIT_ROOT="$(git -C "$(dirname "$FULL_PATH")" rev-parse --show-toplevel)"

# Normalize both paths
FULL_PATH="$(cygpath -u "$FULL_PATH")"
GIT_ROOT="$(cygpath -u "$GIT_ROOT")"

# Remove repo root
RELATIVE_PATH=`dirname "${FULL_PATH#$GIT_ROOT/}"`
# Convert path separators to dots
ID=$(echo "$RELATIVE_PATH" | tr '/' '.')

# # 7. Write proof.json
cat > "$DIR/$BASENAME.proof.json" <<EOF
{
  "id": "$ID",
  "file": "$BASENAME",
  "sha256": "$SHA256",
  "ots_file": "$BASENAME.ots",
  "timestamp_method": "opentimestamps",
  "created_utc": "$CREATED"
}
EOF

echo "Done."