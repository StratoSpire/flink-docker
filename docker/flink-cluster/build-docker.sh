#!/bin/bash

set -e

docker build -t stratospire/flink-cluster:1.2.0 .
echo "SUCCESS!"
