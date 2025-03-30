# #!/bin/bash
# # Split string by comma
# echo "$SCOPE" | tr ',' '\n' | while read -r element; do
#   # Check if the directory exists
#   if [ -d "$element" ]; then
#     path="$element/artifacts.json"
#     # Create a default empty JSON if the file doesn't exist
#     [[ -f "$path" ]] || echo '{}' > "$path"
#     # Ensure nested structure and assign artifact tag
#     jq --arg type "$TYPE" \
#       --arg registry "$REGISTRY" \
#       --arg key "${element}/$ARTIFACT_NAME" \
#       --arg tag "$ARTIFACT_TAG" \
#       '.[$type][$registry][$key] = $tag' "$path" > tmp.json && mv tmp.json "$path"
#   else
#     echo "Directory $REPOSITORY/$element does not exist"
#   fi
# done

#!/bin/bash
set -e

DIR="$CONTEXT/$SCOPE"
ARTIFACTS_FILE="$DIR/artifacts.json"

if [ -d "$DIR" ]; then
  echo "📦 Updating $ARTIFACTS_FILE"

  # Create file if it doesn't exist
  [[ -f "$ARTIFACTS_FILE" ]] || echo '{}' > "$ARTIFACTS_FILE"

  # Use jq to update the artifact entry
  jq --arg type "$TYPE" \
     --arg registry "$REGISTRY" \
     --arg key "$SCOPE/$ARTIFACT_NAME" \
     --arg tag "$ARTIFACT_TAG" \
     '
     .[$type] |= . // {} |
     .[$type][$registry] |= . // {} |
     .[$type][$registry][$key] = $tag
     ' "$ARTIFACTS_FILE" > "$ARTIFACTS_FILE.tmp" && mv "$ARTIFACTS_FILE.tmp" "$ARTIFACTS_FILE"

else
  echo "❌ Directory $DIR does not exist"
  exit 1
fi
