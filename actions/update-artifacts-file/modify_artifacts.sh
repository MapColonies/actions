#!/bin/bash
# Check if the directory exists
if [ -d "$SCOPE" ]; then
  path="$SCOPE/artifacts.json"
  # Create a default empty JSON if the file doesn't exist
  [[ -f "$path" ]] || echo '{}' > "$path"
  # Ensure nested structure and assign artifact tag
  jq --arg type "$TYPE" \
    --arg registry "$REGISTRY" \
    --arg key "${element}/$ARTIFACT_NAME" \
    --arg tag "$ARTIFACT_TAG" \
    '.[$type][$registry][$key] = $tag' "$path" > tmp.json && mv tmp.json "$path"
else
  echo "Directory $REPOSITORY/$SCOPE does not exist"
fi
