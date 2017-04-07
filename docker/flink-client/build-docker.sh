#!/bin/bash

set -e

docker build -t stratospire/flink-client:1.2.0 .
echo "SUCCESS!"
