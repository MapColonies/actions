#!/bin/bash
echo "Hello, World!"


# echo "${{ inputs.scope }}" | tr ',' '\n' | while read -r element; do
#     # Navigate to the specific scope directory
#     pushd helm-charts/$element
#     node -e "
#     const fs = require('fs');
#     const path = './artifacts.json';
#     let data = {};
#     // Check if 'artifacts.json' exists and read its content
#     if (fs.existsSync(path)) {
#     data = JSON.parse(fs.readFileSync(path, 'utf8'));
#     }
#     // Initialize nested structure if it doesn't exist
#     if (!data['${{ inputs.type }}']) data['${{ inputs.type }}'] = {};
#     if (!data['${{ inputs.type }}']['${{ inputs.registry }}']) {
#     data['${{ inputs.type }}']['${{ inputs.registry }}'] = {};
#     }
#     const compositeKey = '${element}/${{ inputs.artifact-name }}';
#     // Update the artifact tag
#     data['${{ inputs.type }}']['${{ inputs.registry }}'][compositeKey] = '${{ inputs.artifact-tag }}';
#     // Write the updated content back to 'artifacts.json'
#     fs.writeFileSync(path, JSON.stringify(data, null, 2));
#     "
#     # Return to the previous directory
#     popd
# done
