# yt - YouTube Terminal Browser

A beautiful, fast terminal-based YouTube browser with video search, thumbnail previews, and seamless playback using mpv.

## Features

- Search YouTube directly from your terminal
- **Personal account access** - subscriptions, playlists, recommendations, watch later, liked videos
- Browse and search YouTube playlists
- Interactive video selection with `fzf`
- Thumbnail previews in the terminal (with `chafa`)
- Audio-only mode for music and podcasts
- **Smart caching** - search results cached for 1 hour
- **Seamless authentication** - uses browser cookies automatically (Brave, Firefox, Chrome, Safari, Edge)
- Real-time search progress with spinner
- Plays videos with `mpv` for the best quality
- Vim-style keybindings for navigation
- Clean and colorful terminal UI
- Play videos from URLs directly
- Autoplay related content (YouTube-style)

## Preview

![yt-terminal demo](https://via.placeholder.com/800x450.gif?text=Demo+GIF+Coming+Soon)

<!-- 
To add your own demo GIF:
1. Record your terminal with asciinema: asciinema rec demo.cast
2. Convert to GIF: https://github.com/asciinema/agg
3. Replace the placeholder above with: ![yt-terminal demo](./assets/demo.gif)
-->

**Quick Demo:**
```bash
# Search for videos with live progress updates
yt minecraft tutorial

# Navigate with vim keybindings (j/k), preview thumbnails, press Enter to play!
```

**Key Features in Action:**
- 🔍 Real-time search with progress spinner
- 🖼️ Thumbnail previews in terminal (with chafa)
- ⌨️ Vim-style navigation (j/k keys)
- 🎵 Audio-only mode for music
- 📚 Playlist support with preview
- 🏠 Personal account integration

## Requirements

- **yt-dlp** - YouTube video fetching
- **mpv** - Video playback
- **fzf** - Interactive fuzzy finder
- **jq** - JSON parsing
- **chafa** (optional) - Terminal thumbnail preview
- **curl** - Downloading thumbnails

## Installation

### Quick Install (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/IFAKA/yt-terminal/main/install.sh | bash
```

### Manual Install

1. Clone the repository:
```bash
git clone https://github.com/IFAKA/yt-terminal.git
cd yt-terminal
```

2. Run the install script:
```bash
./install.sh
```

3. Install dependencies (macOS):
```bash
brew install yt-dlp mpv fzf jq chafa
```

4. Make sure `~/.local/bin` is in your PATH:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Usage

### Search and Play Videos

**Interactive selection (default):**
```bash
yt <search term>
```

Example:
```bash
yt elrichmc
yt vim tutorial
yt lofi hip hop
```

**Auto-play first result:**
```bash
yt -f <search term>
yt --first <search term>
```

Example:
```bash
yt -f lofi hip hop          # Instantly plays first result
yt --first morning music    # Perfect for quick playback
```

### Audio-Only Mode

Play only audio (perfect for music, podcasts, or saving bandwidth):

```bash
yt -a <search term>
yt --audio-only <search term>
```

Example:
```bash
yt -a lofi hip hop          # Play audio only
yt -a -f jazz music         # Auto-play first result, audio only
```

### Play Playlists

Search for YouTube playlists and play them:

```bash
yt -p <search term>
yt --playlist <search term>
```

The tool will:
1. Search specifically for playlists (not videos)
2. Show a preview of the first 20 songs/videos in each playlist
3. Play the entire playlist when you select one

Example:
```bash
yt -p lofi                  # Search for lofi playlists
yt -p chill music           # Search for chill music playlists
yt -a -p study beats        # Search & play playlist in audio-only mode
```

### Play Video from URL

```bash
yt <youtube-url>
```

Example:
```bash
yt https://youtube.com/watch?v=dQw4w9WgXcQ
yt -a https://youtube.com/watch?v=dQw4w9WgXcQ  # Audio only from URL
```

### Search Options

- `-f, --first` - Auto-play the first search result (skip interactive selection)
- `-a, --audio-only` - Play audio only (no video)
- `-p, --playlist` - Search for playlists instead of videos
- `--no-autoplay` - Disable autoplay (play once and exit)

### Accessibility Options

- `--high-contrast` - Enable high contrast mode for better visibility
- `--screen-reader` - Enable screen reader announcements
- `--no-emojis` - Disable emoji icons for cleaner text-only display

Example:
```bash
yt --high-contrast --screen-reader lofi music
```

### Personal Account

Access your personal YouTube content:

- `--me` - Interactive menu to browse your account
- `--home` - View personalized recommendations
- `--subs` - Browse latest videos from subscriptions
- `--playlists` - Access your playlists
- `--watch-later` - View watch later queue
- `--liked` - Browse liked videos

Examples:
```bash
yt --me                    # Interactive menu
yt --subs                  # Latest from subscriptions
yt --home -a               # Recommendations in audio-only mode
yt --playlists             # Your playlists
yt --watch-later           # Watch later queue
```

### Other Options

- `--clear-cache` - Clear all cached search results and thumbnails
- `-h, --help` - Show help message

Options can be combined:
```bash
yt -a -p -f study music     # Search playlists, auto-play first, audio only
yt --subs -a                # Subscriptions in audio-only mode
```

### Caching

Search results and playlist metadata are automatically cached for 1 hour to improve performance and reduce unnecessary requests to YouTube. Cached searches load instantly!

```bash
yt lofi music              # Fetches from YouTube
yt lofi music              # Loads from cache (instant!)
yt --clear-cache           # Clear all caches
```

Cache locations:
- Search results: `~/.cache/yt-search/`
- Playlist metadata: `~/.cache/yt-playlists/`
- Thumbnails: `~/.cache/yt-thumbnails/`

### Authentication

Personal features (`--me`, `--home`, `--subs`, etc.) require authentication. The setup is **automatic and secure**:

1. On first use of a personal feature, you'll be prompted to choose your browser
2. The tool uses browser cookies (no passwords needed!)
3. Supported browsers: **Brave**, Firefox, Chrome, Safari, Edge
4. Authentication is saved to `~/.config/yt/config` - setup only once

**Note:** Make sure you're logged into YouTube in your browser before using personal features.

### Keybindings in fzf

- `j` / `k` - Navigate down/up
- `Ctrl-d` / `Ctrl-u` - Half page down/up
- `Ctrl-f` / `Ctrl-b` - Full page down/up
- `Enter` - Play selected video
- `q` or `Esc` - Quit

## Update

To update to the latest version:

```bash
cd yt-terminal
git pull
./install.sh
```

Or use the one-liner installer again to get the latest version.

## Uninstall

To completely remove yt from your system (removes all traces):

### Quick Uninstall (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/IFAKA/yt-terminal/main/uninstall.sh | bash
```

### Manual Uninstall

```bash
cd yt-terminal
./uninstall.sh
```

This will remove:
- The `yt` script from `~/.local/bin`
- The thumbnail cache from `~/.cache/yt-thumbnails`
- Configuration files from `~/.config/yt`

## How It Works

1. **Search** - Uses `yt-dlp` to search YouTube and fetch video metadata
2. **Selection** - Displays results in `fzf` with thumbnail previews
3. **Playback** - Plays selected video with `mpv` in high quality (up to 1080p)

## Configuration

The script uses sensible defaults but you can modify the `yt` script to customize:

Configuration file location: `~/.config/yt/config`

Example configuration:
```bash
# Performance
NUM_RESULTS=15                # Number of search results (default: 10)
MAX_QUALITY=1080              # Max video quality (default: 1080p)
TIMEOUT=120                   # Search timeout in seconds (default: 90)
CACHE_EXPIRY=7200            # Cache expiry in seconds (default: 3600/1hr)

# Playback
VOLUME=100                    # Default volume (default: 100)

# Accessibility
HIGH_CONTRAST_MODE=true       # Enable high contrast (default: false)
SCREEN_READER_MODE=true       # Enable screen reader (default: false)
```

You can also modify the `yt` script directly to customize:
- mpv settings (line ~1250)
- fzf color scheme (get_fzf_colors function)

## FAQ (Frequently Asked Questions)

### General Questions

**Q: Is this free?**  
A: Yes! yt-terminal is completely free and open source (MIT License).

**Q: Does this download videos?**  
A: No, it streams videos directly using mpv. No files are saved to disk (except cached thumbnails and search results).

**Q: Do I need a YouTube account?**  
A: No for basic searches. Yes for personal features (`--home`, `--subs`, `--playlists`, etc.).

**Q: Is this safe? Does it require my password?**  
A: Yes, it's safe. It uses browser cookies (no passwords needed). Your credentials never leave your machine.

**Q: What's the difference between this and youtube-dl?**  
A: yt-terminal provides an interactive UI with fzf, thumbnail previews, vim keybindings, and autoplay features.

### Usage Questions

**Q: How do I play audio only?**  
A: Use the `-a` or `--audio-only` flag:
```bash
yt -a lofi hip hop
```

**Q: Can I disable autoplay?**  
A: Yes, use `--no-autoplay`:
```bash
yt --no-autoplay relaxing music
```

**Q: How do I search for playlists?**  
A: Use the `-p` or `--playlist` flag:
```bash
yt -p study music
```

**Q: Can I combine flags?**  
A: Yes! Flags can be combined in any order:
```bash
yt -apf chill beats  # Audio-only, playlist search, auto-play first result
```

**Q: How long are searches cached?**  
A: Search results are cached for 1 hour. Clear with `yt --clear-cache`.

### Technical Questions

**Q: Which browsers are supported for authentication?**  
A: Brave, Firefox, Chrome, Safari, and Edge.

**Q: Does this work on Windows?**  
A: Yes, via WSL (Windows Subsystem for Linux). Native Windows support with Git Bash/MSYS2.

**Q: Can I use this on a headless server?**  
A: Yes, audio-only mode works great on servers. Video playback requires a display.

**Q: How do I update yt?**  
A: Run the installer again or pull latest changes:
```bash
cd yt-terminal && git pull && ./install.sh
```

**Q: Does this support 4K video?**  
A: Yes, but default is 1080p max. Modify `MAX_QUALITY` in `~/.config/yt/config`.

### Accessibility Questions

**Q: Does this work with screen readers?**  
A: Yes! Use `--screen-reader` flag for screen reader announcements.

**Q: Can I use high contrast mode?**  
A: Yes! Use `--high-contrast` flag for better visibility.

**Q: Are there keyboard-only controls?**  
A: Yes, all navigation is keyboard-based (j/k, Ctrl-d/u, Enter, q).

## Troubleshooting

### No videos showing in search results

Make sure you have the latest version of the script. The issue with only 1 video showing has been fixed.

### Thumbnails not showing

Install `chafa` for terminal image support:
```bash
brew install chafa  # macOS
sudo apt install chafa  # Linux
```

### Command not found

Make sure `~/.local/bin` is in your PATH:
```bash
echo $PATH | grep ".local/bin"
```

If not in PATH, add it:
```bash
# For zsh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# For bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### yt-dlp errors

Update yt-dlp to the latest version:
```bash
brew upgrade yt-dlp  # macOS
pip install --upgrade yt-dlp  # pip
sudo apt update && sudo apt upgrade yt-dlp  # Linux
```

### Authentication issues

If personal features (`--home`, `--subs`) fail:
1. Make sure you're logged into YouTube in your browser
2. Close your browser completely
3. Run the authentication setup again by deleting the config:
   ```bash
   rm -rf ~/.config/yt/config
   ```
4. Try the feature again

### WSL video playback issues

On Windows WSL, you may need:
- Install Windows mpv, OR
- Install X server (VcXsrv or Xming) for Linux GUI apps

For audio-only mode on WSL, no additional setup needed.

### Performance issues

If searches are slow:
- Check your internet connection
- Update yt-dlp: `brew upgrade yt-dlp` or `pip install --upgrade yt-dlp`
- Clear cache: `yt --clear-cache`
- Reduce number of results in `~/.config/yt/config`:
  ```bash
  echo "NUM_RESULTS=5" >> ~/.config/yt/config
  ```

## License

MIT

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## Author

Created with love for terminal enthusiasts.
