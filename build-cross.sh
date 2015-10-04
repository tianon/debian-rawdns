#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

docker build -f Dockerfile.cross -t tianon/rawdns:cross .

rm -f rawdns*
docker run --rm tianon/rawdns:cross bash -c 'cd /go/bin && tar -c rawdns*' | tar -xv
ls -lAFh rawdns*
