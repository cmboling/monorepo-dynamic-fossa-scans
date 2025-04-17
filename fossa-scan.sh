#!/bin/bash

# Root directory of the monorepo (change if running from a different location)
MONOREPO_ROOT="$(pwd)"

# Loop through each subdirectory in the monorepo
for dir in "$MONOREPO_ROOT"/*/; do
  # Remove trailing slash and extract directory name
  dir=${dir%*/}
  project_name=$(basename "$dir")

  echo "Analyzing project: $project_name"

  # Create a temporary .fossa.yml file for this project
  cat > "$dir/.fossa.yml" <<EOF
version: 3

project:
  id: monorepo-$project_name
EOF

  # Run FOSSA analysis in the directory
  (cd "$dir" && fossa analyze)

  # Clean up the temporary .fossa.yml
  rm "$dir/.fossa.yml"

  echo "Cleaned up .fossa.yml for $project_name"
  echo
done
