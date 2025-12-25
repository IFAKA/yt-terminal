# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- MIT License
- Dependency checking with helpful error messages
- GitHub Actions CI with ShellCheck validation and installation tests
- GitHub issue templates for bug reports and feature requests
- CONTRIBUTING.md with development guidelines
- CODE_OF_CONDUCT.md
- Pull request template
- Integration test framework with bats
- Configuration file support (~/.config/yt/config)
- Better error handling throughout the script
- Modular function-based architecture
- Version number display

### Changed
- Refactored main script into smaller, testable functions
- Improved error messages with actionable guidance

### Fixed
- Better handling of missing dependencies

## [1.0.0] - 2025-12-25

### Added
- Initial release
- YouTube search functionality with yt-dlp
- Interactive video selection with fzf
- Thumbnail previews in terminal with chafa
- Video playback with mpv
- Vim-style keybindings for navigation
- Real-time search progress with spinner
- Direct URL playback support
- Installation and uninstallation scripts

[Unreleased]: https://github.com/IFAKA/yt-terminal/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/IFAKA/yt-terminal/releases/tag/v1.0.0
