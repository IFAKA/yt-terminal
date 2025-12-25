# How to Create Demo GIF

## Quick Method (Recommended)

### Using asciinema + agg

1. **Install asciinema and agg:**
   ```bash
   # macOS
   brew install asciinema
   
   # Install agg (asciinema gif generator)
   cargo install --git https://github.com/asciinema/agg
   ```

2. **Record your terminal session:**
   ```bash
   asciinema rec demo.cast
   
   # Now perform a demo:
   # - Type: yt lofi hip hop
   # - Navigate with j/k
   # - Show thumbnail preview
   # - Press Enter to select
   # - Exit with Ctrl+C
   
   # Press Ctrl+D when done
   ```

3. **Convert to GIF:**
   ```bash
   agg demo.cast demo.gif
   
   # With options for better quality:
   agg --font-size 14 --cols 100 --rows 30 demo.cast demo.gif
   ```

4. **Move to assets folder:**
   ```bash
   mv demo.gif assets/
   ```

5. **Update README.md:**
   Replace the placeholder image URL with:
   ```markdown
   ![yt-terminal demo](./assets/demo.gif)
   ```

## Alternative Methods

### Using Terminalizer

```bash
# Install
npm install -g terminalizer

# Record
terminalizer record demo

# Render
terminalizer render demo -o demo.gif

# Move to assets
mv demo.gif assets/
```

### Using ttygif

```bash
# macOS
brew install ttygif

# Record
ttyrec myrecording

# Convert
ttygif myrecording

# Concatenate frames
convert -delay 10 *.gif demo.gif
mv demo.gif assets/
```

## Tips for Good Demo

1. **Keep it short** (30-60 seconds)
2. **Show key features:**
   - Search command
   - Interactive selection (j/k navigation)
   - Thumbnail preview
   - Video selection
3. **Use clear terminal settings:**
   - Font size: 14-16pt
   - Color scheme: high contrast
   - Terminal size: 100x30 columns
4. **Add captions** if needed using video editing tools

## Recommended Demo Script

```bash
# 1. Show help
yt --help

# 2. Simple search
yt lofi hip hop

# 3. Navigate and select
# (use j/k to move, show thumbnails)

# 4. Show audio-only
yt -a relaxing music

# 5. Show personal feature
yt --home

# 6. Exit
```

## Final Steps

After creating the GIF:
1. Optimize size: Use https://ezgif.com/optimize
2. Keep under 10MB for GitHub
3. Update README.md with actual path
4. Commit and push to repository
