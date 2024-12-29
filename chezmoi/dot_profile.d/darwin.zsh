# Add Apple Font Tools to path
export PATH="${PATH}:/Library/Apple/usr/bin"

# Set `USER` for login shells which somehow don't have it in macOS
USER="$(id -un)"
export USER
