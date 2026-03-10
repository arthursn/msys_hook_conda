# MSYS Hook Conda

A patch for conda activation in MSYS2/Git Bash and other shells on Windows.

## Problem

Conda environments don't work properly in MSYS2/Git Bash on Windows due to:
- Carriage return issues
- PS1 prompt escaping problems with Unicode characters

## Solution

This patch provides a custom `__conda_activate` function that:
- Removes carriage returns
- Properly escapes PS1 prompts with Unicode character support
- Ensures conda environments activate correctly in MSYS2/Git Bash, zsh, and potentially other shells

## Usage

Add to your `.bashrc`:
```bash
source "/path/to/msys_hook_conda/hook_conda.sh"
```

Then use conda normally:
```bash
conda activate myenv
```

## Requirements

- Windows with MSYS2/Git Bash or zsh
- Miniconda3/Anaconda

## Compatibility

This patch has been tested with:
- Git Bash (MSYS2)
- Zsh on Windows
- May work with other POSIX-compliant shells
