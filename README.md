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

Search for videos with live progress updates:
```
yt minecraft tutorial
```

Navigate results with vim keybindings (`j`/`k`), preview thumbnails, and press Enter to play!

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

- Video quality (default: 1080p max)
- Number of search results (default: 10)
- mpv settings
- fzf color scheme

## Troubleshooting

**No videos showing in search results**

Make sure you have the latest version of the script. The issue with only 1 video showing has been fixed.

**Thumbnails not showing**

Install `chafa` for terminal image support:
```bash
brew install chafa
```

**Command not found**

Make sure `~/.local/bin` is in your PATH:
```bash
echo $PATH | grep ".local/bin"
```

**yt-dlp errors**

Update yt-dlp to the latest version:
```bash
brew upgrade yt-dlp
```

## License

MIT

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## Author

Created with love for terminal enthusiasts.
