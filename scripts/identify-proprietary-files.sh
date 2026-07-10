#!/bin/bash

# Identify Proprietary Files Script
# This script helps identify files that contain proprietary code
# and should NOT be included in the public repository

echo "🔍 Scanning for proprietary code patterns..."
echo "=================================================="
echo ""

# Define search patterns
declare -a PATTERNS=(
    "firebase"
    "generative_ai\|gemini\|google_ai"
    "purchases\|revenuecat\|payment"
    "google_mobile_ads\|admob"
    "analytics\|crashlytics\|tracking"
    "api_key\|secret\|credentials"
    "cloud_functions\|firestore"
    "google_sign_in"
)

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# Search in lib directory
if [ -d "lib" ]; then
    echo -e "${YELLOW}Searching in lib/ directory:${NC}"
    echo ""
    
    FOUND_ISSUES=0
    
    for pattern in "${PATTERNS[@]}"; do
        RESULTS=$(grep -r -i "$pattern" lib/ 2>/dev/null | grep -v ".dart" | head -20)
        if [ ! -z "$RESULTS" ]; then
            echo -e "${RED}Pattern: $pattern${NC}"
            echo "$RESULTS" | head -5
            echo ""
            FOUND_ISSUES=$((FOUND_ISSUES + 1))
        fi
    done
    
    # Search for specific files
    echo -e "${YELLOW}Looking for common proprietary files:${NC}"
    echo ""
    
    PROPRIETARY_FILES=(
        "lib/services/firebase_service.dart"
        "lib/services/ai_service.dart"
        "lib/services/gemini_service.dart"
        "lib/services/payment_service.dart"
        "lib/providers/ai_solver.dart"
        "lib/providers/firebase_provider.dart"
        "lib/config/firebase_config.dart"
        "google-services.json"
        "GoogleService-Info.plist"
    )
    
    for file in "${PROPRIETARY_FILES[@]}"; do
        if [ -f "$file" ]; then
            echo -e "${RED}✗ Found: $file${NC}"
            FOUND_ISSUES=$((FOUND_ISSUES + 1))
        fi
    done
    
    echo ""
    
    if [ $FOUND_ISSUES -eq 0 ]; then
        echo -e "${GREEN}✓ No obvious proprietary code found!${NC}"
    else
        echo -e "${RED}⚠️  Found $FOUND_ISSUES potential proprietary code areas${NC}"
        echo "Review these files before syncing to the public repository."
    fi
else
    echo -e "${YELLOW}lib/ directory not found. Run this script in the repository root.${NC}"
fi

echo ""
echo "=================================================="
echo "Common files to EXCLUDE from public repository:"
echo "=================================================="
echo ""
echo "Configuration files:"
echo "  - lib/config/firebase_config.dart"
echo "  - lib/config/constants.dart (if contains API keys)"
echo "  - google-services.json"
echo "  - GoogleService-Info.plist"
echo ""
echo "Service files:"
echo "  - lib/services/ai_service.dart"
echo "  - lib/services/gemini_service.dart"
echo "  - lib/services/firebase_service.dart"
echo "  - lib/services/payment_service.dart"
echo "  - lib/services/analytics_service.dart"
echo ""
echo "Provider files:"
echo "  - lib/providers/ai_solver.dart"
echo "  - lib/providers/firebase_provider.dart"
echo ""
echo "For more info, see: SYNC_GUIDELINES.md"
