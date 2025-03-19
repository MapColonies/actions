#!/bin/bash
cd helm-charts
git config --global user.name "mapcolonies[bot]"
git config --global user.email "devops[bot]@mapcolonies.com"

git add .
# Add "|| true" for not failing on this line
git commit -m "chore: update artifacts.json for ${{ inputs.scope }}" -m "with ${{ inputs.type }} artifact: ${{ inputs.artifact-name }}:${{ inputs.artifact-tag }}" || true

success=false
for ((i=1; i<=5; i++)); do
  echo "Attempt number $i"
  if git push; then
    success=true
    break
  else
    sleep 5
    # --ff for fast-forward
    git pull origin master --ff
  fi
done

if [ "$success" = false ]; then
  echo "Failed to push changes."
  exit 1
fi
