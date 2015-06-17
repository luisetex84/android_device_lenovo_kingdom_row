#!/bin/bash

set -e

export VENDOR=lenovo
export DEVICE=kingdom_row
./../../$VENDOR/kingdom_row-common/setup-makefiles.sh $@
