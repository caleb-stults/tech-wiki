#!/bin/bash
# Example: ./new_post.sh "Network Setup" networking

TITLE="$1"
DIR="$2"
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
FILEPATH="docs/${DIR}/${FILENAME}.md"

# Ensure directory exists
mkdir -p "docs/${DIR}"

echo "Creating new wiki page: $FILEPATH"

cat <<EOF > "$FILEPATH"
# $TITLE

## Objective
[Briefly describe the purpose of this topic]

## Procedure
[Step-by-step guide]
EOF

echo "File created. Please open $FILEPATH to add your content."