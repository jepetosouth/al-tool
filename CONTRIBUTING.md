# Contributing to AL-Tool

Thank you for your interest in contributing to AL-Tool! This guide will help you get started.

## Table of Contents
- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Submission Guidelines](#submission-guidelines)
- [Style Guidelines](#style-guidelines)
- [Testing](#testing)

## Code of Conduct

### Our Standards
- Be respectful and inclusive
- Focus on constructive feedback
- Prioritize education and ethical security practices
- Remember: This tool is for authorized testing only

## How Can I Contribute?

### Reporting Bugs
Before creating bug reports, please check existing issues. When creating a bug report, include:

- **Clear title**: Summarize the problem
- **Environment details**: Termux/NetHunter version, Android version, device
- **Steps to reproduce**: Detailed steps to encounter the issue
- **Expected behavior**: What you expected to happen
- **Actual behavior**: What actually happened
- **Error messages**: Full error output
- **Screenshots**: If applicable

**Example Bug Report**:
```
Title: Installation fails on Android 11 with Termux 0.118

Environment:
- Device: Samsung Galaxy S10
- Android: 11
- Termux: 0.118.0

Steps to reproduce:
1. Run install-termux.sh
2. Script fails at git clone step

Expected: Repository clones successfully
Actual: Error "Permission denied"

Error message:
fatal: unable to access 'https://github.com/...': Permission denied
```

### Suggesting Enhancements
Enhancement suggestions are welcome! Please include:

- **Clear description**: What you want to achieve
- **Use case**: Why this would be useful
- **Proposed solution**: How you think it could work
- **Alternatives**: Other solutions you've considered

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Make your changes**: Follow style guidelines
4. **Test thoroughly**: See [Testing](#testing)
5. **Commit with clear messages**: See [Commit Messages](#commit-messages)
6. **Push to your fork**: `git push origin feature/your-feature-name`
7. **Submit a pull request**: Use the PR template

## Development Setup

### Prerequisites
- Git
- Bash (for script development)
- Text editor (VS Code, Vim, Nano, etc.)
- Access to Termux/NetHunter for testing (recommended)

### Setup Steps

1. **Fork and clone**:
```bash
git clone https://github.com/YOUR-USERNAME/al-tool.git
cd al-tool
```

2. **Create feature branch**:
```bash
git checkout -b feature/your-feature-name
```

3. **Make changes**:
- Edit scripts or documentation
- Follow existing code style
- Add comments where necessary

4. **Test changes**:
```bash
# Syntax check
bash -n install-termux.sh
bash -n install-nethunter.sh

# Run shellcheck if available
shellcheck install-termux.sh
shellcheck install-nethunter.sh
```

## Submission Guidelines

### Commit Messages

Follow conventional commits format:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples**:
```
feat(termux): add support for Android 13

- Updated package installation for Android 13
- Added compatibility checks
- Updated documentation

Closes #123
```

```
fix(nethunter): resolve git clone timeout issue

- Increased timeout for git operations
- Added retry logic
- Improved error messages

Fixes #45
```

```
docs(readme): clarify storage permission steps

Added detailed steps for granting storage permissions
including screenshots and troubleshooting tips.
```

### Pull Request Template

When creating a PR, include:

```markdown
## Description
[Clear description of changes]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Code refactoring

## Testing
- [ ] Tested on Termux
- [ ] Tested on NetHunter
- [ ] Syntax checked
- [ ] Documentation updated

## Environment Tested
- Device: [Device name]
- Android: [Version]
- Termux/NetHunter: [Version]

## Checklist
- [ ] My code follows the project style guidelines
- [ ] I have commented my code where necessary
- [ ] I have updated documentation
- [ ] My changes generate no new warnings
- [ ] I have tested my changes
- [ ] All tests pass

## Screenshots (if applicable)
[Add screenshots for UI changes]

## Additional Notes
[Any additional information]
```

## Style Guidelines

### Bash Scripts

**General**:
- Use 4 spaces for indentation
- Use meaningful variable names
- Add comments for complex logic
- Include error handling
- Use proper shebangs

**Example**:
```bash
#!/data/data/com.termux/files/usr/bin/bash
# Brief description of what the script does

set -e  # Exit on error

# Function with clear name and purpose
check_environment() {
    if [ ! -d "/data/data/com.termux" ]; then
        echo "Error: Not running in Termux"
        return 1
    fi
    return 0
}

# Clear variable names
INSTALL_DIR="$HOME/ALHacking"
REPO_URL="https://github.com/4lbH4cker/ALHacking"

# Error handling
if ! git clone "$REPO_URL" "$INSTALL_DIR"; then
    echo "Failed to clone repository"
    exit 1
fi
```

### Documentation

**Markdown**:
- Use clear headings
- Include code examples
- Add links where relevant
- Keep language simple and clear
- Use tables for comparisons
- Include emojis sparingly for visual breaks

**Example**:
```markdown
## Installation

### Quick Install

Run this single command:

\`\`\`bash
pkg install wget -y && wget -O - https://example.com/install.sh | bash
\`\`\`

### Manual Install

If you prefer manual installation:

1. **Update packages**:
\`\`\`bash
pkg update -y
\`\`\`

2. **Install dependencies**:
\`\`\`bash
pkg install git -y
\`\`\`
```

### Web Files (HTML/CSS/JS)

**HTML**:
- Use semantic HTML5
- Include proper meta tags
- Ensure accessibility

**CSS**:
- Use consistent naming
- Comment sections
- Mobile-first approach

**JavaScript**:
- Use ES6+ features
- Add comments for complex logic
- Handle errors gracefully

## Testing

Before submitting:

1. **Syntax check**:
```bash
bash -n your-script.sh
```

2. **Shellcheck** (if available):
```bash
shellcheck your-script.sh
```

3. **Manual testing**:
- Test on actual Termux/NetHunter if possible
- Test error scenarios
- Verify documentation accuracy

4. **Documentation review**:
- Check all links work
- Verify commands are accurate
- Ensure examples are clear

See [TESTING.md](TESTING.md) for comprehensive testing guide.

## Areas for Contribution

### High Priority
- Testing on various Android versions
- Testing on different devices
- Additional error handling
- Performance improvements

### Medium Priority
- Additional language support
- Enhanced UI/UX
- More detailed troubleshooting guides
- Video tutorials

### Low Priority
- Alternative installation methods
- Integration with other tools
- Additional documentation
- Code optimization

## Getting Help

- **Documentation**: Check [README.md](README.md), [QUICKSTART.md](QUICKSTART.md)
- **Issues**: Search existing issues or create new one
- **Discussions**: Use GitHub Discussions for questions

## Recognition

Contributors will be recognized in:
- CHANGELOG.md
- GitHub contributors page
- Special mentions for significant contributions

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## Questions?

Feel free to open an issue with the "question" label or start a discussion.

Thank you for contributing to AL-Tool! 🚀
