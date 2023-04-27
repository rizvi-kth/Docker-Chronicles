#!/bin/bash
set -e

if [[ "$1" = "serve" ]]; then
    shift 1
    torchserve --start --ts-config /home/model-server/config.properties
    # torchserve --start --model-store /home/model-server/model-store --models xsumm=xsumm-sf.mar --ts-config config.properties
else
    eval "$@"
fi

# prevent docker exit
tail -f /dev/null
