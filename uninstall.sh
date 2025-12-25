#!/bin/bash
# Uninstallation script for yt - YouTube Terminal Browser

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🗑️  Uninstalling yt - YouTube Terminal Browser"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

INSTALL_DIR="$HOME/.local/bin"
CACHE_DIR="$HOME/.cache/yt-thumbnails"

# Remove the script
if [ -f "$INSTALL_DIR/yt" ]; then
    echo "🗑️  Removing yt script from $INSTALL_DIR..."
    rm -f "$INSTALL_DIR/yt"
    echo "✅ Script removed"
else
    echo "⚠️  yt script not found in $INSTALL_DIR"
fi

# Remove cache directory
if [ -d "$CACHE_DIR" ]; then
    echo "🗑️  Removing thumbnail cache from $CACHE_DIR..."
    rm -rf "$CACHE_DIR"
    echo "✅ Cache removed"
else
    echo "ℹ️  No cache directory found"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Uninstallation complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "All traces of yt have been removed from your system."
echo ""
