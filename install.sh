#!/bin/bash
# Installation script for yt - YouTube Terminal Browser

set -e

# Detect platform
detect_platform() {
    local os
    os=$(uname -s)
    
    case "$os" in
        Linux*)
            if grep -qi microsoft /proc/version 2>/dev/null; then
                echo "WSL"
            else
                echo "Linux"
            fi
            ;;
        Darwin*)
            echo "macOS"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            echo "Windows"
            ;;
        *)
            echo "Unknown"
            ;;
    esac
}

PLATFORM=$(detect_platform)

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Installing yt - YouTube Terminal Browser"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Platform detected: $PLATFORM"
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

# Create 'y' symlink for quick access
ln -sf "$INSTALL_DIR/yt" "$INSTALL_DIR/y"
echo "Created 'y' alias for quick access"

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

# Platform-specific dependency installation instructions
case "$PLATFORM" in
    macOS)
        echo "Install dependencies with (Homebrew):"
        echo "  brew install yt-dlp mpv fzf jq chafa"
        ;;
    Linux)
        echo "Install dependencies with:"
        echo "  # Debian/Ubuntu:"
        echo "  sudo apt update && sudo apt install yt-dlp mpv fzf jq chafa curl"
        echo ""
        echo "  # Fedora/RHEL:"
        echo "  sudo dnf install yt-dlp mpv fzf jq chafa curl"
        echo ""
        echo "  # Arch Linux:"
        echo "  sudo pacman -S yt-dlp mpv fzf jq chafa curl"
        ;;
    WSL)
        echo "Install dependencies with (WSL/Ubuntu):"
        echo "  sudo apt update && sudo apt install yt-dlp mpv fzf jq chafa curl"
        echo ""
        echo "WSL Note: For video playback, you may need:"
        echo "  • Windows mpv installed, or"
        echo "  • X server (VcXsrv/Xming) for Linux GUI apps"
        ;;
    Windows)
        echo "Install dependencies with:"
        echo "  # Chocolatey:"
        echo "  choco install yt-dlp mpv fzf jq"
        echo ""
        echo "  # Scoop:"
        echo "  scoop install yt-dlp mpv fzf jq"
        ;;
    *)
        echo "Install dependencies manually:"
        echo "  • yt-dlp: https://github.com/yt-dlp/yt-dlp#installation"
        echo "  • mpv: https://mpv.io/installation/"
        echo "  • fzf: https://github.com/junegunn/fzf#installation"
        echo "  • jq: https://stedolan.github.io/jq/download/"
        ;;
esac
echo ""
echo "Usage:"
echo "  yt or y             - Open interactive TUI (detects clipboard URL)"
echo "  yt <search term>    - Search and play YouTube videos"
echo "  yt <url>            - Play video from URL"
echo "  yt --me             - Browse your account (subs, playlists, etc.)"
echo "  yt --home           - Play from your recommendations"
echo "  yt --subs           - Play from your subscriptions"
echo "  yt --playlists      - Browse your playlists"
echo "  yt --watch-later    - Play from watch later queue"
echo "  yt --liked          - Play from liked videos"
echo "  yt --clear-cache    - Clear cached search results"
echo ""
echo "Examples:"
echo "  yt lofi hip hop"
echo "  yt --home"
echo "  yt --clear-cache"
echo "  yt https://youtube.com/watch?v=..."
echo ""
