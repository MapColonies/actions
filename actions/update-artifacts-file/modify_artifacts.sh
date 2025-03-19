#!/bin/bash
# Split string by comma
echo "${{ inputs.scope }}" #| tr ',' '\n' | while read -r element; do
  # cd to directory
  # pushd helm-charts/$element
  # pushd actions/.github/workflows/$element
  # node -e "
  # const fs = require('fs');
  # const path = './artifacts.json';
  # let data = {};
  # // Check if 'artifacts.json' file already exists
  # if (fs.existsSync(path)) {
  #   data = JSON.parse(fs.readFileSync(path, 'utf8'));
  # }
  # // Ensure nested structure: docker -> registry -> scope -> artifact:tag
  # if (!data['${{ inputs.type }}']['${{ inputs.registry }}']) data['${{ inputs.type }}']['${{ inputs.registry }}'] = {};
  # const compositeKey = '${element}/${{ inputs.artifact-name }}';
  # // Assign the artifact tag to the composite key
  # data['${{ inputs.type }}']['${{ inputs.registry }}'][compositeKey] = '${{ inputs.artifact-tag }}';
  # // Writing new file contents
  # fs.writeFileSync(path, JSON.stringify(data, null, 2));
  # "
  # # go back to before pushd
  # popd
done