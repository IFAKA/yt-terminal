# yt - YouTube Terminal Browser

🚀 **A beautiful, blazing-fast terminal YouTube browser** - Search, browse, and play videos instantly from your terminal with stunning visuals and zero distractions.

## ✨ Why You'll Love It

**⚡ Lightning Fast**
- Instant results with smart caching
- Real-time search with live progress
- Zero wait time - cached searches load in milliseconds

**🎨 Gorgeous Interface**
- Beautiful Unicode borders and modern design
- Colorful, easy-to-scan results
- Thumbnail previews right in your terminal
- Distraction-free focus mode

**🎯 Simple & Powerful**
- Type what you want, press Enter - that's it
- Keyboard shortcuts you already know (j/k/Enter)
- Auto-play for uninterrupted listening
- One command to rule them all

**🔐 Your Personal YouTube**
- Access subscriptions, playlists, recommendations
- Seamless browser cookie authentication (no passwords!)
- Watch later queue at your fingertips
- All your liked videos in one place

**🎵 Music Mode**
- Audio-only mode - perfect for background music
- Browse entire playlists instantly
- Autoplay keeps the vibe going
- Save bandwidth while coding

## Preview

![Search and browse](https://github.com/user-attachments/assets/1565c7c3-4121-4df6-8e94-c89e792720aa)

![Interactive selection](https://github.com/user-attachments/assets/bef138d9-e929-4d55-8ad9-ee5170d5628c)

![Audio mode](https://github.com/user-attachments/assets/e1beda58-1b42-488a-954f-f5cbd381177a)

![Playlist browsing](https://github.com/user-attachments/assets/4844783a-e879-4ac1-a523-fb8721ac86b6)

## 🚀 Quick Start

```bash
# 1. Search anything
yt lofi hip hop

# 2. Browse with j/k, see thumbnails, hit Enter to play
# That's it! 🎉
```

### Common Use Cases

**Focus Music While Coding**
```bash
yt -a -f lofi study beats    # Instant audio, first result
```

**Watch Tutorials**
```bash
yt vim tutorial              # Browse results, pick your favorite
```

**Your Subscription Feed**
```bash
yt --subs                    # Latest from channels you follow
```

**Playlist Marathon**
```bash
yt -p chill playlists        # Browse playlists, autoplay enabled
```

## Requirements

- **yt-dlp** - YouTube video fetching
- **mpv** - Video playback
- **fzf** - Interactive fuzzy finder
- **jq** - JSON parsing
- **chafa** (optional) - Terminal thumbnail preview
- **cava** (optional) - Audio visualizer for terminal mode
- **curl** - Downloading thumbnails

## 📦 Installation (2 Minutes)

### One-Line Install
```bash
curl -fsSL https://raw.githubusercontent.com/IFAKA/yt-terminal/main/install.sh | bash
```

**That's it!** The installer handles everything automatically.

---

### What You Need

The installer will check for these (and guide you if missing):

| Tool | What it does | Install |
|------|--------------|---------|
| **yt-dlp** | Fetches videos | `brew install yt-dlp` |
| **mpv** | Plays videos | `brew install mpv` |
| **fzf** | Interactive menu | `brew install fzf` |
| **jq** | Parses data | `brew install jq` |
| **chafa** | Shows thumbnails *(optional)* | `brew install chafa` |
| **cava** | Audio visualizer *(optional)* | `brew install cava` |

**macOS One-Liner:**
```bash
brew install yt-dlp mpv fzf jq chafa
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install yt-dlp mpv fzf jq chafa
```

---

### Manual Install (If You Prefer)

```bash
git clone https://github.com/IFAKA/yt-terminal.git
cd yt-terminal
./install.sh
```

## 🎮 Usage (It's Really Simple)

### Basic Commands

| What You Want | Command | Example |
|---------------|---------|---------|
| Search videos | `yt <term>` | `yt minecraft` |
| Play first result instantly | `yt -f <term>` | `yt -f lofi music` |
| Audio only | `yt -a <term>` | `yt -a jazz` |
| Search playlists | `yt -p <term>` | `yt -p study music` |
| Play any URL | `yt <url>` | `yt https://youtube.com/...` |
| Your subscriptions | `yt --subs` | `yt --subs` |
| Your playlists | `yt --playlists` | `yt --playlists` |

---

### Flags You'll Use

**Speed Flags** ⚡
- `-f` - Skip browsing, play first result instantly
- `-a` - Audio only (save bandwidth, great for music)
- `-p` - Search playlists instead of videos
- `-t` - Terminal mode (video/audio plays in terminal)

**Personal Flags** 🏠
- `--subs` - Latest from your subscriptions
- `--home` - Your personalized feed
- `--playlists` - Your saved playlists
- `--watch-later` - Your watch later queue
- `--liked` - Your liked videos

**Control Flags** 🎛️
- `--no-autoplay` - Play once and stop (no related videos)
- `--high-contrast` - Better visibility
- `--clear-cache` - Fresh start

---

### Mix & Match Flags

Flags work together in any order:

```bash
yt -af chill beats         # Audio + First result
yt -apf study music        # Audio + Playlist + First result
yt --subs -a               # Subscriptions in audio mode
yt -p lofi                 # Browse lofi playlists
yt -t lofi                 # Video plays in terminal (ASCII)
yt -at music               # Audio with cava visualizer
```

---

### Real Examples (Copy & Paste These)

**Morning Routine**
```bash
yt -af morning jazz        # Wake up to instant jazz
```

**Coding Session**
```bash
yt -a lofi hip hop         # Browse & pick your vibe
yt -p study playlists      # Find the perfect playlist
```

**Learning Mode**
```bash
yt rust tutorial           # Browse tutorials interactively
yt -f quick vim tip        # Learn one thing fast
```

**Your Personal Feed**
```bash
yt --subs                  # What's new from your channels
yt --watch-later           # Catch up on saved videos
```

**Quick URL Play**
```bash
yt https://youtube.com/watch?v=...
yt -a https://youtube.com/...      # Audio only
```

---

### ⌨️ Keyboard Controls (Easy!)

**In the video browser:**
- `j` or `↓` - Down
- `k` or `↑` - Up  
- `Ctrl-d` - Jump down fast
- `Ctrl-u` - Jump up fast
- `Enter` - Play this one
- `q` or `Esc` - Exit

**While playing video:**
- `d` - Show description & links
- `q` - Stop playback
- All mpv controls work (space to pause, arrow keys, etc.)

---

### 🎯 Smart Features

**Auto-Caching (Zero Config)**
- First search: Fetches from YouTube
- Same search again: Instant! (cached for 1 hour)
- Clear when you want: `yt --clear-cache`

**Autoplay Mode (YouTube-Style)**
- Enabled by default - videos continue automatically
- Related content plays next
- Press `Ctrl+C` during countdown to stop
- Disable: `yt --no-autoplay`

**Personal Account (One-Time Setup)**
- First use: Pick your browser (Brave, Firefox, Chrome, Safari, Edge)
- Uses cookies - no passwords needed
- Setup once, works forever
- Make sure you're logged into YouTube in your browser first

---

### 🎨 Accessibility Features

**High Contrast Mode**
```bash
yt --high-contrast lofi music
```

**Screen Reader Support**
```bash
yt --screen-reader tutorials
```

**Text-Only Mode**
```bash
yt --no-emojis clean search
```

**All Keyboard Navigation**
- No mouse needed
- Vim-style keybindings (j/k)
- Full keyboard control everywhere

## 🔄 Update

**Easy way (recommended):**
```bash
curl -fsSL https://raw.githubusercontent.com/IFAKA/yt-terminal/main/install.sh | bash
```

**Or manually:**
```bash
cd yt-terminal && git pull && ./install.sh
```

## 🗑️ Uninstall

**One-liner:**
```bash
curl -fsSL https://raw.githubusercontent.com/IFAKA/yt-terminal/main/uninstall.sh | bash
```

This removes everything cleanly (script, cache, config).

---

## ⚙️ How It Works (For the Curious)

1. **Search** - `yt-dlp` fetches results from YouTube
2. **Display** - `fzf` shows beautiful interactive menu with thumbnails
3. **Play** - `mpv` streams in high quality (up to 1080p)
4. **Cache** - Smart caching makes repeat searches instant

## 🛠️ Configuration (Optional)

**File location:** `~/.config/yt/config`

**Useful tweaks:**
```bash
NUM_RESULTS=20                # More results (default: 10)
MAX_QUALITY=1080              # Video quality (default: 1080p)
CACHE_EXPIRY=7200             # Longer cache (default: 1hr)
VOLUME=80                     # Lower volume (default: 100)
HIGH_CONTRAST_MODE=true       # Better visibility
TERMINAL_MODE=true            # Always use terminal output (video/audio in terminal)
```

**Default settings work great for most people** - only change if you want to!

---

## ❓ Quick Questions

**Is it free?**  
Yes! Completely free and open source (MIT License).

**Does it download videos?**  
No, it streams like Netflix. Nothing saved except cache for speed.

**Need a YouTube account?**  
Nope! Only for personal features (subscriptions, playlists, etc.).

**Is it safe?**  
Yes! Uses browser cookies. No passwords. Everything stays on your machine.

**Audio-only mode?**
`yt -a <search>` - Perfect for music while coding.

**Terminal mode?**
`yt -t <search>` - Video/audio plays directly in terminal. Needs `cava` for audio visualizer.

**Disable autoplay?**  
`yt --no-autoplay <search>` - Play once and stop.

**Search playlists?**  
`yt -p <search>` - Find and play entire playlists.

**Combine flags?**  
Yes! Mix and match: `yt -apf study beats` works perfectly.

**Cache duration?**  
1 hour. Clear anytime: `yt --clear-cache`

**Supported browsers?**  
Brave, Firefox, Chrome, Safari, Edge

**Works on Windows?**  
Yes! Via WSL or Git Bash.

**Works on servers?**  
Yes! Audio mode works without a display.

**4K support?**  
Yes! Edit `MAX_QUALITY` in `~/.config/yt/config`

**Keyboard only?**  
100%! j/k navigation, Enter to select, q to quit.

---

## 🔧 Troubleshooting (Quick Fixes)

**"Command not found"**
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**No thumbnails showing?**
```bash
brew install chafa  # macOS
sudo apt install chafa  # Linux
```

**yt-dlp errors?**
```bash
brew upgrade yt-dlp  # Update to latest
```

**Personal features not working?**
1. Make sure you're logged into YouTube in your browser
2. Close browser completely
3. Reset: `rm -rf ~/.config/yt/config`
4. Try again

**Slow searches?**
```bash
yt --clear-cache  # Fresh start
brew upgrade yt-dlp  # Update extractor
```

**WSL video issues?**
- Install Windows mpv, OR
- Use audio mode: `yt -a`

**Need help?**
[Open an issue](https://github.com/IFAKA/yt-terminal/issues) - we respond fast!

---

## 💖 Contributing

Found a bug? Want a feature? Have an idea?

**We'd love to hear from you!**
- [Open an issue](https://github.com/IFAKA/yt-terminal/issues)
- [Submit a PR](https://github.com/IFAKA/yt-terminal/pulls)
- Star the repo if you like it! ⭐

---

## 📄 License

MIT - Use it, modify it, share it!

---

## 🙌 Credits

Built with love for terminal enthusiasts who value speed, simplicity, and beauty.

**Powered by:**
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The best YouTube downloader
- [mpv](https://mpv.io/) - The best video player
- [fzf](https://github.com/junegunn/fzf) - The best fuzzy finder
- [chafa](https://hpjansson.org/chafa/) - Terminal graphics magic

---

<div align="center">

**Made something cool with yt-terminal?**  
[Share it with us!](https://github.com/IFAKA/yt-terminal/discussions)

**Enjoying yt-terminal?**  
⭐ Star us on GitHub!

</div>
