# Hook conda
_hook_conda=$("$HOME/miniconda3/Scripts/conda.exe" "shell.posix" "hook")
_hook_conda=$(printf '%s' "$_hook_conda" | tr -d '\r')
eval "$_hook_conda"
unset _hook_conda

unset __conda_activate
# Patch __conda_activate
__conda_activate() {
    if [ -n "${CONDA_PS1_BACKUP:+x}" ]; then
        PS1="$CONDA_PS1_BACKUP"
        \unset CONDA_PS1_BACKUP
    fi
    \local escaped_ps1
    \local ask_conda
    # Escape PS1
    escaped_ps1=$(
        printf '%s' "$PS1" |
            "$CONDA_PYTHON_EXE" -c 'import sys; print(sys.stdin.buffer.read().decode("utf-8").encode("unicode_escape").decode().replace("$", "\\$"))'
    )
    ask_conda="$(PS1="${escaped_ps1:-}" __conda_exe shell.posix "$@")" || \return
    # Remove trailing return carriage and echo eval $PS1
    ask_conda=$(printf '%s' "$ask_conda" | tr -d '\r' | sed '/^PS1=/s/.*/echo -e "&"/e')
    eval "$ask_conda"
    __conda_hashr
}
