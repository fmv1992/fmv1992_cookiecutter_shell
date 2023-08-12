#! /usr/bin/env bash

# Halt on error.
set -euo pipefail

# Go to execution directory.
{ cd "$(dirname $(readlink -f "${0}"))" && git rev-parse --is-inside-work-tree > /dev/null 2>&1 && cd "$(git rev-parse --show-toplevel)"; } || cd "$(dirname "$(readlink -f ${0})")"
# Close identation: }
test -d ./.git

# Remove previous runs.
rm -rf /tmp/tmp.cookiecutter.* || true

# Run `make all`.
tmpdir=$(mktemp --directory --tmpdir=/tmp/ tmp.cookiecutter.$(date '+%s').XXXXXX)
echo '
{
    "project_name": "xyzabc"
}
' | jq > ${tmpdir}/replay.json
cd ${tmpdir}
cookiecutter --no-input $HOME/dev/pud/fmv1992_cookiecutter_shell $(jq -r 'to_entries[] | [.key, .value] | @tsv' < ${tmpdir}/replay.json | sed -E 's#\t#=#g' | paste --serial)
cd ${tmpdir}/*/
git init . && git comm --allow-empty -m "first (empty) commit"
git add --all && git comm --allow-empty -m "just cloned"
rm readme.md
make readme.md
git add --all && git comm --allow-empty -m 'update `readme.md` due to naming/templating'
make all
rm ./output/deb/*.deb
make down package build test
git_check_clean

tree "${tmpdir}"
echo "${tmpdir}" > /dev/stderr

# vim: set filetype=sh fileformat=unix nowrap:
