#!/bin/sh
set -eu

project_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
bin_dir=${ANI_CAT_INSTALL_DIR:-$HOME/.local/bin}

mkdir -p "$bin_dir"
install -m 755 "$project_dir/ani-cat" "$bin_dir/ani-cat"
printf 'ani-cat instalado en %s/ani-cat\n' "$bin_dir"

if command -v omarchy >/dev/null 2>&1; then
    omarchy tui install ani-cat "$bin_dir/ani-cat" tile mpv
    printf 'Acceso añadido a Apps de Omarchy.\n'
fi
