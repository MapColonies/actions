#!/bin/bash
set -e

# Split the scope input by commas and iterate over each element
echo "$1" | tr ',' '\n' | while read -r element; do
  # Navigate to the specific scope directory
  pushd helm-charts/$element
  node -e "
  const fs = require('fs');
  const path = './artifacts.json';
  let data = {};
  // Check if 'artifacts.json' exists and read its content
  if (fs.existsSync(path)) {
    data = JSON.parse(fs.readFileSync(path, 'utf8'));
  }
  // Initialize nested structure if it doesn't exist
  if (!data['$2']) data['$2'] = {};
  if (!data['$2']['$3']) {
    data['$2']['$3'] = {};
  }
  const compositeKey = '${element}/$4';
  // Update the artifact tag
  data['$2']['$3'][compositeKey] = '$5';
  // Write the updated content back to 'artifacts.json'
  fs.writeFileSync(path, JSON.stringify(data, null, 2));
  "
  # Return to the previous directory
  popd
done
