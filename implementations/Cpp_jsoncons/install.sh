#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tag="$(cat "${script_dir}/tag")"
version="$(sed 's/^v//' <<< "$tag")"

readonly source_url="https://github.com/danielaparker/jsoncons/archive/${tag}.tar.gz"
readonly target_dir="$1"

readonly tmp_dir="/tmp/install_jsoncons.$$"

mkdir -p "$target_dir"

mkdir -p "$tmp_dir"
curl --fail -L "$source_url" -o "$tmp_dir/jsoncons.tar.gz"

tar -xzf "$tmp_dir/jsoncons.tar.gz" --directory "$tmp_dir"

mv "${tmp_dir}/jsoncons-${version}/include"/jsoncons "$target_dir"
mv "${tmp_dir}/jsoncons-${version}/include"/jsoncons_ext "$target_dir"

rm -r "${tmp_dir}/jsoncons-${version}"
rm "${tmp_dir}/jsoncons.tar.gz"
rmdir "$tmp_dir"
