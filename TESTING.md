# Testing Guide for AL-Tool

This document provides comprehensive testing instructions for the AL-Tool installation scripts and documentation.

## Testing Environment Setup

### Prerequisites
- Android device with Termux or NetHunter installed
- Active internet connection
- Terminal emulator
- At least 500MB free storage

## Test Plan

### 1. Termux Installation Script Testing

#### Test Case 1.1: Fresh Installation
**Objective**: Test installation on a clean Termux environment

**Steps**:
1. Launch Termux
2. Run: `pkg update && pkg upgrade -y`
3. Run: `pkg install wget -y`
4. Run: `wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh`
5. Run: `chmod +x install-termux.sh`
6. Run: `./install-termux.sh`

**Expected Results**:
- ✓ Script detects Termux environment
- ✓ All dependencies install successfully
- ✓ ALHacking repository clones without errors
- ✓ Success message displays with next steps
- ✓ `~/ALHacking` directory exists
- ✓ `alhack.sh` is executable

**Verification Commands**:
```bash
ls -la ~/ALHacking
test -f ~/ALHacking/alhack.sh && echo "alhack.sh exists"
test -x ~/ALHacking/alhack.sh && echo "alhack.sh is executable"
```

#### Test Case 1.2: Reinstallation
**Objective**: Test reinstallation when ALHacking already exists

**Steps**:
1. Run installation script again: `./install-termux.sh`
2. When prompted, choose 'y' to reinstall
3. Verify successful reinstallation

**Expected Results**:
- ✓ Script detects existing installation
- ✓ Prompts user for confirmation
- ✓ Removes old installation
- ✓ Successfully reinstalls

#### Test Case 1.3: Declined Reinstallation
**Objective**: Test cancellation during reinstallation

**Steps**:
1. Run installation script: `./install-termux.sh`
2. When prompted, choose 'n' to cancel
3. Verify script exits gracefully

**Expected Results**:
- ✓ Script exits without errors
- ✓ Existing installation remains intact
- ✓ Warning message displayed

### 2. NetHunter Installation Script Testing

#### Test Case 2.1: NetHunter Environment
**Objective**: Test installation on NetHunter

**Steps**:
1. Launch NetHunter terminal
2. Run: `pkg update && pkg upgrade -y`
3. Run: `pkg install wget -y`
4. Run: `wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh`
5. Run: `chmod +x install-nethunter.sh`
6. Run: `./install-nethunter.sh`

**Expected Results**:
- ✓ Script detects NetHunter environment
- ✓ All dependencies install successfully
- ✓ ALHacking repository clones without errors
- ✓ Success message displays
- ✓ NetHunter-specific notes displayed

#### Test Case 2.2: Termux Fallback
**Objective**: Verify NetHunter script works on standard Termux

**Steps**:
1. Run NetHunter script on Termux: `./install-nethunter.sh`

**Expected Results**:
- ✓ Script detects Termux environment
- ✓ Displays appropriate environment message
- ✓ Installation proceeds successfully

### 3. One-Liner Installation Testing

#### Test Case 3.1: Direct Execution
**Objective**: Test piped installation method

**Steps**:
1. Run: `pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash`

**Expected Results**:
- ✓ Downloads and executes script
- ✓ Installation completes successfully
- ✓ No manual chmod needed

### 4. ALHacking Execution Testing

#### Test Case 4.1: Run ALHacking Tool
**Objective**: Verify installed tool executes

**Steps**:
1. Navigate: `cd ~/ALHacking`
2. Execute: `bash alhack.sh`

**Expected Results**:
- ✓ Script executes without errors
- ✓ Menu or interface displays
- ✓ Tool is functional

### 5. Error Handling Testing

#### Test Case 5.1: No Internet Connection
**Objective**: Test behavior without internet

**Steps**:
1. Disable internet connection
2. Run installation script
3. Observe error handling

**Expected Results**:
- ✓ Appropriate error message displayed
- ✓ Script exits gracefully
- ✓ User informed about connectivity requirement

#### Test Case 5.2: Insufficient Storage
**Objective**: Test behavior with low storage

**Steps**:
1. Ensure device has less than 50MB free
2. Run installation script
3. Observe behavior

**Expected Results**:
- ✓ Installation may fail with storage error
- ✓ Error message is informative

#### Test Case 5.3: Missing Dependencies
**Objective**: Test script's ability to install dependencies

**Steps**:
1. Ensure `git` is not installed: `pkg uninstall git -y`
2. Run installation script
3. Verify git gets installed

**Expected Results**:
- ✓ Script detects missing git
- ✓ Installs git automatically
- ✓ Proceeds with installation

### 6. Documentation Testing

#### Test Case 6.1: README Accuracy
**Objective**: Verify README instructions work

**Steps**:
1. Follow each installation method in README
2. Verify all commands execute correctly
3. Check links are valid

**Expected Results**:
- ✓ All commands work as documented
- ✓ All links are accessible
- ✓ Instructions are clear and accurate

#### Test Case 6.2: Quick Start Guide
**Objective**: Verify 5-minute setup works

**Steps**:
1. Follow QUICKSTART.md from beginning to end
2. Time the process
3. Verify all steps work

**Expected Results**:
- ✓ Setup completes in under 5 minutes (with good internet)
- ✓ All commands execute successfully
- ✓ Tool is ready to use

### 7. Web Interface Testing

#### Test Case 7.1: GitHub Pages Display
**Objective**: Test web interface

**Steps**:
1. Visit: https://jepetosouth.github.io/al-tool/
2. Verify page loads correctly
3. Check command syntax is correct

**Expected Results**:
- ✓ Page loads without errors
- ✓ UI is visually appealing
- ✓ All commands are properly formatted
- ✓ Commands are copy-paste ready

#### Test Case 7.2: JavaScript Disabled
**Objective**: Test fallback when JS is off

**Steps**:
1. Disable JavaScript in browser
2. Visit the page
3. Verify fallback styles work

**Expected Results**:
- ✓ Page still displays content
- ✓ Fallback CSS provides basic styling

### 8. Permission Testing

#### Test Case 8.1: Storage Permission
**Objective**: Test storage access setup

**Steps**:
1. Run: `termux-setup-storage`
2. Grant permission when prompted
3. Verify access: `ls ~/storage`

**Expected Results**:
- ✓ Permission prompt appears
- ✓ After granting, storage is accessible
- ✓ ~/storage directory appears

## Testing Checklist

Use this checklist to track testing progress:

### Installation Scripts
- [ ] Termux fresh installation
- [ ] Termux reinstallation
- [ ] NetHunter installation
- [ ] One-liner installation
- [ ] Error handling: no internet
- [ ] Error handling: low storage

### Functionality
- [ ] ALHacking executes correctly
- [ ] All dependencies installed
- [ ] Storage permissions work
- [ ] Scripts are executable

### Documentation
- [ ] README instructions accurate
- [ ] Quick Start Guide works
- [ ] Requirements document accurate
- [ ] Troubleshooting tips effective

### Web Interface
- [ ] GitHub Pages loads correctly
- [ ] Commands display properly
- [ ] UI is responsive
- [ ] Links work

## Automated Testing

While full automated testing requires actual Android devices, you can perform syntax validation:

```bash
# Syntax check
bash -n install-termux.sh
bash -n install-nethunter.sh

# Shellcheck (if available)
shellcheck install-termux.sh
shellcheck install-nethunter.sh
```

## Reporting Issues

When reporting test failures, include:
1. Test case number and name
2. Environment details (Termux/NetHunter version, Android version)
3. Full error messages
4. Steps to reproduce
5. Expected vs actual results
6. Screenshots if applicable

## Test Results Template

```
Test Environment:
- Device: [Device Name]
- Android Version: [Version]
- Termux/NetHunter Version: [Version]
- Date: [YYYY-MM-DD]

Test Results:
- Test Case 1.1: [PASS/FAIL] - Notes: ...
- Test Case 1.2: [PASS/FAIL] - Notes: ...
...

Overall Status: [ALL PASS / X FAILURES]

Additional Notes:
[Any observations, suggestions, or issues encountered]
```

## Continuous Testing

Recommended testing schedule:
- **Before each release**: Full test suite
- **After dependency updates**: Installation and execution tests
- **Monthly**: Spot checks on various devices
- **After ALHacking updates**: Execution tests

## Contributing Test Results

Help improve AL-Tool by sharing your test results:
1. Complete the testing checklist
2. Document any issues found
3. Submit results via GitHub Issues
4. Include environment details

Thank you for helping test and improve AL-Tool! 🚀
