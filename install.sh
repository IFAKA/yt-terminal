#!/bin/bash
# Installation script for yt - YouTube Terminal Browser

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Installing yt - YouTube Terminal Browser"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Determine installation directory
INSTALL_DIR="$HOME/.local/bin"
REPO_URL="https://raw.githubusercontent.com/IFAKA/yt-terminal/main/yt"

# Create installation directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "📁 Creating $INSTALL_DIR..."
    mkdir -p "$INSTALL_DIR"
fi

# Download or copy the script
if [ -f "yt" ]; then
    # Local installation
    echo "📋 Copying yt script to $INSTALL_DIR..."
    cp yt "$INSTALL_DIR/yt"
else
    # Remote installation
    echo "📥 Downloading yt script from GitHub..."
    if command -v curl &> /dev/null; then
        curl -fsSL "$REPO_URL" -o "$INSTALL_DIR/yt"
    elif command -v wget &> /dev/null; then
        wget -q "$REPO_URL" -O "$INSTALL_DIR/yt"
    else
        echo "❌ Error: curl or wget is required for remote installation"
        exit 1
    fi
fi

chmod +x "$INSTALL_DIR/yt"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo "⚠️  WARNING: $HOME/.local/bin is not in your PATH"
    echo ""
    echo "Add this line to your shell configuration file:"
    echo ""
    
    if [ -n "$BASH_VERSION" ]; then
        echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
        echo "  source ~/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
        echo "  source ~/.zshrc"
    else
        echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    fi
    echo ""
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Installation complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Dependencies required:"
echo "  • yt-dlp    - YouTube video fetching"
echo "  • mpv       - Video playback"
echo "  • fzf       - Interactive selection"
echo "  • jq        - JSON parsing"
echo "  • chafa     - Thumbnail preview (optional)"
echo ""
echo "Install dependencies with:"
echo "  brew install yt-dlp mpv fzf jq chafa"
echo ""
echo "Usage:"
echo "  yt <search term>    - Search and play YouTube videos"
echo "  yt <url>            - Play video from URL"
echo ""
echo "Example:"
echo "  yt minecraft tutorial"
echo ""
