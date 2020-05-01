#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tag="$(cat "${script_dir}/tag")"

readonly source_url="https://github.com/javerous/SMJJSONPath/archive/${tag}.tar.gz"
readonly target_dir="$1"

readonly tmp_dir="/tmp/install_SMJJSONPath.$$"
readonly tmp_download="$tmp_dir/SMJJSONPath.tar.gz"

mkdir -p "$target_dir"

mkdir -p "$tmp_dir"
curl --fail -L "$source_url" -o "$tmp_download"

tar -xzf "$tmp_download" --directory "$tmp_dir"

mv "${tmp_dir}/SMJJSONPath-${tag}"/SMJJSONPath/ "$target_dir"

rm -r "${tmp_dir}/SMJJSONPath-${tag}"
rm "$tmp_download"
rmdir "$tmp_dir"
