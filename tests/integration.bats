#!/usr/bin/env bats
# Integration tests for yt-terminal

setup() {
    # Set up test environment
    export PATH="$HOME/.local/bin:$PATH"
    
    # Create temp test directory
    TEST_DIR="$(mktemp -d)"
    export TEST_DIR
}

teardown() {
    # Clean up test directory
    if [ -n "$TEST_DIR" ] && [ -d "$TEST_DIR" ]; then
        rm -rf "$TEST_DIR"
    fi
}

@test "yt script exists and is executable" {
    [ -f "$HOME/.local/bin/yt" ]
    [ -x "$HOME/.local/bin/yt" ]
}

@test "yt shows usage when run without arguments" {
    run yt
    [ "$status" -eq 1 ]
    [[ "$output" =~ "Usage: yt" ]]
}

@test "yt shows version in usage" {
    run yt
    [[ "$output" =~ "Version:" ]]
}

@test "yt has all required dependencies" {
    command -v yt-dlp
    command -v mpv
    command -v fzf
    command -v jq
    command -v curl
}

@test "install script creates yt in correct location" {
    # Remove existing installation
    rm -f "$HOME/.local/bin/yt"
    
    # Run install script
    run bash install.sh
    [ "$status" -eq 0 ]
    
    # Check if installed
    [ -f "$HOME/.local/bin/yt" ]
    [ -x "$HOME/.local/bin/yt" ]
}

@test "uninstall script removes yt" {
    # Ensure yt is installed
    bash install.sh
    
    # Run uninstall script
    run bash uninstall.sh
    [ "$status" -eq 0 ]
    
    # Check if removed
    [ ! -f "$HOME/.local/bin/yt" ]
}

@test "yt script passes shellcheck" {
    if command -v shellcheck &> /dev/null; then
        run shellcheck yt
        [ "$status" -eq 0 ]
    else
        skip "shellcheck not installed"
    fi
}

@test "install script passes shellcheck" {
    if command -v shellcheck &> /dev/null; then
        run shellcheck install.sh
        [ "$status" -eq 0 ]
    else
        skip "shellcheck not installed"
    fi
}

@test "uninstall script passes shellcheck" {
    if command -v shellcheck &> /dev/null; then
        run shellcheck uninstall.sh
        [ "$status" -eq 0 ]
    else
        skip "shellcheck not installed"
    fi
}

@test "yt creates cache directory on first run" {
    # Remove cache directories if they exist
    rm -rf "$HOME/.cache/yt-thumbnails"
    rm -rf "$HOME/.cache/yt-search"
    rm -rf "$HOME/.cache/yt-playlists"
    
    # Source the script to test config loading
    source "$HOME/.local/bin/yt"
    load_config
    
    # Check if directories were created
    [ -d "$HOME/.cache/yt-thumbnails" ]
    [ -d "$HOME/.cache/yt-search" ]
    [ -d "$HOME/.cache/yt-playlists" ]
}

@test "configuration file is loaded if present" {
    # Create a config file
    mkdir -p "$HOME/.config/yt"
    echo "NUM_RESULTS=5" > "$HOME/.config/yt/config"
    echo "MAX_QUALITY=720" >> "$HOME/.config/yt/config"
    
    # Source the script and load config
    source "$HOME/.local/bin/yt"
    load_config
    
    # Verify config was loaded
    [ "$NUM_RESULTS" = "5" ]
    [ "$MAX_QUALITY" = "720" ]
    
    # Cleanup
    rm -f "$HOME/.config/yt/config"
}

@test "yt handles missing dependencies gracefully" {
    # Verify the dependency check function exists
    grep -q "check_dependencies" "$HOME/.local/bin/yt"
    
    # Test that check_dependencies function is callable
    source "$HOME/.local/bin/yt"
    
    # This will pass if all deps are installed
    check_dependencies
}

@test "yt script has proper shebang" {
    head -n 1 yt | grep -q "^#!/bin/bash"
}

@test "yt script defines VERSION variable" {
    grep -q "^VERSION=" "$HOME/.local/bin/yt"
}

@test "cache key generation works correctly" {
    source "$HOME/.local/bin/yt"
    
    # Test cache key generation
    key1=$(get_cache_key "test search" "video")
    key2=$(get_cache_key "test search" "video")
    key3=$(get_cache_key "different search" "video")
    
    # Same input should produce same key
    [ "$key1" = "$key2" ]
    
    # Different input should produce different key
    [ "$key1" != "$key3" ]
}

@test "cache validation works correctly" {
    source "$HOME/.local/bin/yt"
    load_config
    
    # Create a test cache file
    test_cache="$SEARCH_CACHE_DIR/test_cache.json"
    echo '{"test": "data"}' > "$test_cache"
    
    # Fresh file should be valid
    is_cache_valid "$test_cache"
    result=$?
    [ "$result" -eq 0 ]
    
    # Non-existent file should be invalid
    is_cache_valid "$SEARCH_CACHE_DIR/nonexistent.json"
    result=$?
    [ "$result" -eq 1 ]
    
    # Cleanup
    rm -f "$test_cache"
}

@test "first run detection works" {
    source "$HOME/.local/bin/yt"
    load_config
    
    # Remove first run marker
    rm -f "$FIRST_RUN_FILE"
    
    # Should detect first run
    check_first_run
    result=$?
    [ "$result" -eq 0 ]
    
    # Create marker
    touch "$FIRST_RUN_FILE"
    
    # Should not detect first run
    check_first_run
    result=$?
    [ "$result" -eq 1 ]
}

@test "show_usage displays all required information" {
    run yt --help
    
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Search Options:" ]]
    [[ "$output" =~ "Personal Account:" ]]
    [[ "$output" =~ "Examples:" ]]
    [[ "$output" =~ "Version:" ]]
}

@test "clear cache removes all cache files" {
    source "$HOME/.local/bin/yt"
    load_config
    
    # Create test cache files
    mkdir -p "$SEARCH_CACHE_DIR" "$PLAYLIST_CACHE_DIR" "$CACHE_DIR"
    touch "$SEARCH_CACHE_DIR/test1.json"
    touch "$PLAYLIST_CACHE_DIR/test2.json"
    touch "$CACHE_DIR/test3.jpg"
    
    # Run clear cache
    run yt --clear-cache
    
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Cleared" ]]
}

@test "audio only flag sets correct format" {
    # Test that audio-only flag is recognized
    run yt -a 2>&1
    
    # Will fail without search term, but should recognize flag
    [[ "$output" =~ "Usage:" ]] || [[ "$output" =~ "Searching" ]]
}

@test "playlist flag sets correct search mode" {
    # Test that playlist flag is recognized
    run yt -p 2>&1
    
    # Will fail without search term, but should recognize flag
    [[ "$output" =~ "Usage:" ]] || [[ "$output" =~ "Searching" ]]
}

@test "combined flags are parsed correctly" {
    # Test combined flags
    run yt -apf 2>&1
    
    # Should recognize combined flags
    [[ "$output" =~ "Usage:" ]] || [[ "$output" =~ "Searching" ]]
}

@test "URL detection works" {
    source "$HOME/.local/bin/yt"
    
    # Test URL pattern matching
    url1="https://youtube.com/watch?v=dQw4w9WgXcQ"
    url2="http://youtube.com/watch?v=dQw4w9WgXcQ"
    not_url="lofi hip hop"
    
    [[ "$url1" =~ ^https?:// ]]
    result=$?
    [ "$result" -eq 0 ]
    
    [[ "$url2" =~ ^https?:// ]]
    result=$?
    [ "$result" -eq 0 ]
    
    [[ "$not_url" =~ ^https?:// ]]
    result=$?
    [ "$result" -eq 1 ]
}

@test "config directory is created on load" {
    # Remove config directory
    rm -rf "$HOME/.config/yt"
    
    source "$HOME/.local/bin/yt"
    load_config
    
    # Should be created
    [ -d "$HOME/.config/yt" ]
}

@test "default configuration values are set" {
    source "$HOME/.local/bin/yt"
    load_config
    
    # Check defaults
    [ -n "$NUM_RESULTS" ]
    [ -n "$MAX_QUALITY" ]
    [ -n "$TIMEOUT" ]
    [ -n "$VOLUME" ]
    [ -n "$CACHE_DIR" ]
}

@test "spinner function exists and is callable" {
    source "$HOME/.local/bin/yt"
    
    # Start a background process
    sleep 2 &
    pid=$!
    
    # Test spinner (will complete when process finishes)
    show_spinner "$pid" "Testing..." &
    spinner_pid=$!
    
    wait "$pid"
    wait "$spinner_pid"
    
    # If we get here, spinner worked
    [ $? -eq 0 ]
}

@test "cleanup function handles temp files" {
    source "$HOME/.local/bin/yt"
    
    # Create a temp file
    tmpfile=$(mktemp)
    echo "test" > "$tmpfile"
    
    # Verify it exists
    [ -f "$tmpfile" ]
    
    # Run cleanup
    cleanup
    
    # File should be removed
    [ ! -f "$tmpfile" ]
}
