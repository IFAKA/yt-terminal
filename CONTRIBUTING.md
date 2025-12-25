# Contributing to yt-terminal

Thank you for your interest in contributing to yt-terminal! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Coding Standards](#coding-standards)

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for everyone. Please be kind and constructive in your interactions.

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/yt-terminal.git
   cd yt-terminal
   ```
3. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/IFAKA/yt-terminal.git
   ```

## Development Setup

### Prerequisites

- **Required**:
  - `yt-dlp` - YouTube video fetching
  - `mpv` - Video playback
  - `fzf` - Interactive fuzzy finder
  - `jq` - JSON parsing
  - `curl` - Downloading thumbnails
  
- **Optional**:
  - `chafa` - Terminal thumbnail preview
  - `shellcheck` - Shell script linting (for development)
  - `bats` - Bash Automated Testing System (for testing)

### Install Dependencies

**macOS:**
```bash
brew install yt-dlp mpv fzf jq chafa shellcheck
```

**Ubuntu/Debian:**
```bash
sudo apt-get install yt-dlp mpv fzf jq curl shellcheck
```

### Install the Development Version

```bash
./install.sh
```

This installs the `yt` script to `~/.local/bin/yt`.

## Making Changes

### Create a Branch

Always create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

Use descriptive branch names:
- `feature/` - for new features
- `fix/` - for bug fixes
- `docs/` - for documentation updates
- `refactor/` - for code refactoring

### Keep Your Fork Updated

```bash
git fetch upstream
git rebase upstream/main
```

## Testing

### Manual Testing

Before submitting changes, test the following scenarios:

1. **Search functionality**:
   ```bash
   yt test search
   ```

2. **URL playback**:
   ```bash
   yt https://youtube.com/watch?v=dQw4w9WgXcQ
   ```

3. **Error handling** (missing dependencies, no results, etc.)

4. **Installation and uninstallation**:
   ```bash
   ./install.sh
   ./uninstall.sh
   ```

### Linting

Run shellcheck to validate your bash code:

```bash
shellcheck yt install.sh uninstall.sh
```

### Integration Tests

If you've added integration tests (recommended):

```bash
bats tests/integration.bats
```

## Submitting Changes

### Before Submitting

1. Ensure your code follows the [coding standards](#coding-standards)
2. Run shellcheck on all modified scripts
3. Test your changes manually
4. Update documentation if needed
5. Add your changes to CHANGELOG.md (if it exists)

### Commit Messages

Write clear, descriptive commit messages:

```
Add support for playlist downloads

- Implement playlist parsing using yt-dlp
- Add --playlist flag to CLI
- Update documentation with playlist examples
```

**Format**:
- First line: brief summary (50 chars or less)
- Blank line
- Detailed description of changes
- Reference issues if applicable: `Fixes #123`

### Creating a Pull Request

1. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. Go to GitHub and create a Pull Request

3. Fill out the PR template with:
   - Clear description of changes
   - Related issue numbers (if applicable)
   - Screenshots/examples (if applicable)
   - Testing checklist

4. Wait for review and address any feedback

## Coding Standards

### Shell Script Guidelines

1. **Use bash shebangs**: Always start scripts with `#!/bin/bash`

2. **Error handling**: Use `set -e` when appropriate, check command exit codes

3. **Quoting**: Always quote variables to prevent word splitting
   ```bash
   # Good
   mpv "$url"
   
   # Bad
   mpv $url
   ```

4. **Functions**: Extract complex logic into functions with clear names
   ```bash
   check_dependencies() {
       # Implementation
   }
   ```

5. **Comments**: Add comments for complex logic, but prefer self-documenting code

6. **Shellcheck**: All scripts should pass shellcheck with no warnings

### Code Style

- Use 4 spaces for indentation (no tabs)
- Keep lines under 100 characters when possible
- Use meaningful variable names: `video_id` not `vid`
- Group related code together
- Add blank lines between logical sections

### Documentation

- Update README.md if you add new features or change behavior
- Add inline comments for complex logic
- Document any new command-line flags or options
- Include usage examples for new features

## Questions?

If you have questions:
- Open a [discussion](https://github.com/IFAKA/yt-terminal/discussions)
- Ask in an existing issue
- Open a new issue with the `question` label

Thank you for contributing!
