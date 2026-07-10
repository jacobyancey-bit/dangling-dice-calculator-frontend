#!/bin/bash

# Sync Script: Private Repo → Public Repo
# This script pulls code from the private repository and pushes cleaned code to public
# IMPORTANT: Review and manually clean proprietary code before running

set -e

echo "🔄 Dangling Dice Calculator - Private to Public Sync Script"
echo "=========================================================="
echo ""

# Configuration
PRIVATE_REPO="https://github.com/jacobyancey-bit/dangling-dice-ai-calculator.git"
PUBLIC_REPO="https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend.git"
PRIVATE_BRANCH="main"
PUBLIC_BRANCH="main"
TEMP_DIR="temp_sync_$$"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        echo -e "${YELLOW}✓ Cleaned up temporary directory${NC}"
    fi
}

# Trap errors and cleanup
trap cleanup EXIT

# Step 1: Clone private repo to temp directory
echo -e "${YELLOW}Step 1: Fetching from private repository...${NC}"
if ! git clone --depth 1 --branch "$PRIVATE_BRANCH" "$PRIVATE_REPO" "$TEMP_DIR"; then
    echo -e "${RED}✗ Failed to clone private repository${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Private repository cloned${NC}"
echo ""

# Step 2: Copy files to sync
echo -e "${YELLOW}Step 2: Preparing files for sync...${NC}"
echo "Files/directories to copy:"
echo "  - lib/         (UI and business logic)"
echo "  - test/        (tests)"
echo "  - assets/      (images and fonts)"
echo ""

# Create sync directory
SYNC_DIR="sync_staging"
rm -rf "$SYNC_DIR"
mkdir -p "$SYNC_DIR"

# Copy files
if [ -d "$TEMP_DIR/lib" ]; then
    cp -r "$TEMP_DIR/lib" "$SYNC_DIR/" && echo -e "${GREEN}✓ Copied lib/${NC}" || echo -e "${RED}✗ Failed to copy lib/${NC}"
fi

if [ -d "$TEMP_DIR/test" ]; then
    cp -r "$TEMP_DIR/test" "$SYNC_DIR/" && echo -e "${GREEN}✓ Copied test/${NC}" || echo -e "${RED}✗ Failed to copy test/${NC}"
fi

if [ -d "$TEMP_DIR/assets" ]; then
    cp -r "$TEMP_DIR/assets" "$SYNC_DIR/" && echo -e "${GREEN}✓ Copied assets/${NC}" || echo -e "${RED}✗ Failed to copy assets/${NC}"
fi

echo ""
echo -e "${YELLOW}⚠️  MANUAL REVIEW REQUIRED${NC}"
echo "=========================================================="
echo "Before proceeding, please review the staged files in:"
echo "  ${SYNC_DIR}/"
echo ""
echo "Remove or clean any files containing:"
echo "  - Firebase initialization or config"
echo "  - Google Generative AI / Gemini API integration"
echo "  - RevenueCat payment SDK"
echo "  - Google Mobile Ads"
echo "  - Analytics tracking code"
echo "  - API keys or credentials"
echo "  - Internal business logic"
echo ""
echo -e "${YELLOW}Commands to clean files:${NC}"
echo "  rm -rf sync_staging/lib/services/firebase_service.dart"
echo "  rm -rf sync_staging/lib/services/ai_service.dart"
echo "  rm -rf sync_staging/lib/providers/ai_solver.dart"
echo ""
read -p "Press ENTER after cleaning files, or Ctrl+C to cancel..."
echo ""

# Step 3: Copy cleaned files to public repo
echo -e "${YELLOW}Step 3: Moving cleaned files to public repository...${NC}"

# Copy lib files
if [ -d "$SYNC_DIR/lib" ]; then
    cp -r "$SYNC_DIR/lib"/* . 2>/dev/null || true
    echo -e "${GREEN}✓ Updated lib/ directory${NC}"
fi

# Copy test files
if [ -d "$SYNC_DIR/test" ]; then
    cp -r "$SYNC_DIR/test"/* . 2>/dev/null || true
    echo -e "${GREEN}✓ Updated test/ directory${NC}"
fi

# Copy assets
if [ -d "$SYNC_DIR/assets" ]; then
    cp -r "$SYNC_DIR/assets"/* . 2>/dev/null || true
    echo -e "${GREEN}✓ Updated assets/ directory${NC}"
fi

echo ""

# Step 4: Verify changes
echo -e "${YELLOW}Step 4: Review changes before committing...${NC}"
echo ""
git status
echo ""
echo -e "${YELLOW}Files ready to commit:${NC}"
git diff --cached --name-only 2>/dev/null || git status --short

echo ""
read -p "Proceed with commit and push? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo -e "${YELLOW}Sync cancelled. Changes not committed.${NC}"
    git reset
    exit 0
fi

# Step 5: Commit and push
echo -e "${YELLOW}Step 5: Committing and pushing changes...${NC}"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
COMMIT_MESSAGE="Sync from private repo - $TIMESTAMP

- Updated frontend code from private repository
- All proprietary code removed
- Ready for public release"

git add lib/ test/ assets/ 2>/dev/null || true
git commit -m "$COMMIT_MESSAGE" 2>/dev/null || echo "No changes to commit"

if git push origin "$PUBLIC_BRANCH"; then
    echo -e "${GREEN}✓ Successfully pushed to public repository${NC}"
else
    echo -e "${RED}✗ Failed to push to public repository${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}=========================================================="
echo "✓ Sync completed successfully!"
echo "===========================================================${NC}"
echo ""
echo "Next steps:"
echo "  1. Verify changes on GitHub:"
echo "     ${PUBLIC_REPO}"
echo "  2. Review and test the public repository"
echo "  3. Create a GitHub issue if you need to document changes"
echo ""

# Cleanup staging directory
rm -rf "$SYNC_DIR"
echo -e "${GREEN}✓ Cleanup complete${NC}"
