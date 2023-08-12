#! /usr/bin/env bash

# Halt on error.
set -euxo pipefail

find . -type f -print0 | xargs --verbose --null -- sed --in-place -E "s#[❴]#{¦#g" --
find . -type f -print0 | xargs --verbose --null -- sed --in-place -E "s#¦##g" --
find . -type f -print0 | xargs --verbose --null -- sed --in-place -E "s#[❵]#}#g" --

# vim: set filetype=sh fileformat=unix nowrap:
