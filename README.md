# MSYS Hook Conda

A patch for conda activation in MSYS2/Git Bash on Windows.

## Problem

Conda environments don't work properly in MSYS2/Git Bash on Windows due to:
- Carriage return issues
- PS1 prompt escaping problems with Unicode characters

## Solution

This patch provides a custom `__conda_activate` function that:
- Removes carriage returns
- Properly escapes PS1 prompts with Unicode character support
- Ensures conda environments activate correctly in MSYS2/Git Bash

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

- Windows with MSYS2/Git Bash
- Miniconda3/Anaconda
