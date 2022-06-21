#! /usr/bin/env bash
mkdir -p nr-data
CMD="set -x; npm i ./node-red-* --omit=dev --no-fund --no-audit"
CMD="$CMD; npm start --cache /data/.npm -- -v --userDir /data"
exec docker run --rm -ti -p 1990:1880 \
  -v $PWD/node-red-reimport-bug:/usr/src/node-red/node-red-reimport-bug \
  --entrypoint bash \
  --name nr-bug-reimport \
  nodered/node-red-dev:3.0.0-beta.3-16 \
  -c "$CMD"

# -v $PWD/nr-data:/data \
# -v /home/flexdash/node-red/packages/node_modules/@node-red:/usr/src/node-red/node_modules/@node-red \
