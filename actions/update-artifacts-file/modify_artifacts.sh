#!/bin/bash
# Split string by comma
echo "$SCOPE" | tr ',' '\n' | while read -r element; do
  # Check if the directory exists
  if [ -d "$element" ]; then
    echo "Changing directory to $REPOSITORY/$element"
    pushd "$element"
    node -e "
    const fs = require('fs');
    const path = './artifacts.json';
    let data = {};
    // Check if 'artifacts.json' file already exists
    if (fs.existsSync(path)) {
      data = JSON.parse(fs.readFileSync(path, 'utf8'));
    }
    // Ensure nested structure: docker -> registry -> scope -> artifact:tag
    if (!data['$TYPE']['$REGISTRY']) data['$TYPE']['$REGISTRY'] = {};
    const compositeKey = '${element}/$ARTIFACT_NAME';
    // Assign the artifact tag to the composite key
    data['$TYPE']['$REGISTRY'][compositeKey] = '$ARTIFACT_TAG';
    // Writing new file contents
    fs.writeFileSync(path, JSON.stringify(data, null, 2));
    "
    # go back to before pushd
    popd
  else
    echo "Directory $REPOSITORY/$element does not exist"
  fi
done
