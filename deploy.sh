#!/usr/bin/env bash
# Cocoon × Calvin Klein — Casa Luz ROS
# Deploy to GitHub Pages
# Run from this folder: bash deploy.sh

set -e

REPO_NAME="cocoon-calvin-klein-casa-luz"
ORG="cocoonflexspaces"

cd "$(dirname "$0")"

echo "→ Initialising git..."
git init -q
git add .
git commit -q -m "Calvin Klein × Casa Luz — Run of Show (Aug 11–12, 2026)"

echo "→ Creating GitHub repo ${ORG}/${REPO_NAME}..."
gh repo create "${ORG}/${REPO_NAME}" \
  --public \
  --source=. \
  --remote=origin \
  --push \
  --description "Run of Show — Calvin Klein Holiday Campaign Dinner, Casa Luz, Aug 11–12 2026"

echo "→ Enabling GitHub Pages (main branch / root)..."
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  "/repos/${ORG}/${REPO_NAME}/pages" \
  -f source='{"branch":"main","path":"/"}' 2>/dev/null || true

echo ""
echo "✓ Done! Live in ~60 seconds at:"
echo "  https://${ORG}.github.io/${REPO_NAME}/"
