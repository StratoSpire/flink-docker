#!/bin/bash

set -e

docker build -t stratospire/flink-base:1.2.0 .
echo "SUCCESS!"
