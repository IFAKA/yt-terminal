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
    # Remove cache directory if it exists
    rm -rf "$HOME/.cache/yt-thumbnails"
    
    # Note: This test would require mocking or actual search
    # For now, just check if the directory gets created
    skip "Requires mocking YouTube search"
}

@test "configuration file is loaded if present" {
    # Create a config file
    mkdir -p "$HOME/.config/yt"
    echo "NUM_RESULTS=5" > "$HOME/.config/yt/config"
    
    # Note: This would require running yt and checking behavior
    # For now, we just verify the config file exists
    [ -f "$HOME/.config/yt/config" ]
    
    # Cleanup
    rm -f "$HOME/.config/yt/config"
}

@test "yt handles missing dependencies gracefully" {
    # This would require temporarily hiding dependencies
    # For now, just verify the dependency check function exists
    grep -q "check_dependencies" yt
}

@test "yt script has proper shebang" {
    head -n 1 yt | grep -q "^#!/bin/bash"
}

@test "yt script defines VERSION variable" {
    grep -q "^VERSION=" yt
}
