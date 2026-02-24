#!/bin/bash
# Run this script in Git Bash to push Preethi Naroju portfolio to GitHub
# Repo: https://github.com/preethi-naroju/My-portfolio

set -e
SOURCE_DIR="/c/Users/CSC/Downloads/Preethi Naroju"
REPO_URL="https://github.com/preethi-naroju/My-portfolio.git"
WORK_DIR="/c/Users/CSC/Downloads"
REPO_DIR="$WORK_DIR/My-portfolio"

echo "Source folder: $SOURCE_DIR"
echo "Repo: $REPO_URL"
echo ""

# Clone if repo doesn't exist
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "Cloning repository..."
  cd "$WORK_DIR"
  git clone "$REPO_URL"
  cd "$REPO_DIR"
else
  echo "Repository already cloned. Updating..."
  cd "$REPO_DIR"
  git fetch origin
  git pull origin main 2>/dev/null || git pull origin master 2>/dev/null || true
fi

# Copy all portfolio files into repo (overwrite)
echo "Copying portfolio files..."
cp -r "$SOURCE_DIR"/* "$REPO_DIR/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/.??* "$REPO_DIR/" 2>/dev/null || true
# Remove script and instructions from repo so we don't commit them
rm -f "$REPO_DIR/push-to-github.sh" "$REPO_DIR/PUSH-INSTRUCTIONS.txt" 2>/dev/null || true

# Add, commit, push
echo "Staging all files..."
git add -A
echo "Committing..."
git commit -m "Add Preethi Naroju portfolio site" || echo "Nothing new to commit."
echo "Pushing to GitHub..."
git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null || git push origin main 2>/dev/null || git push origin master

echo ""
echo "Done! Check https://github.com/preethi-naroju/My-portfolio"
