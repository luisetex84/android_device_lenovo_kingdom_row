#!/bin/sh

set -e

export VENDOR=lenovo
export DEVICE=kingdom_row
./../../$VENDOR/kingdom_row-common/extract-files.sh $@
