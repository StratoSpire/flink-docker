#!/bin/bash

echo "Job: $FLINK_JOB_NAME"

if [ -z "$FLINK_JOB_NAME" ]; then
    echo "FLINK_JOB_NAME variable is not set! Exiting!"
    exit 1
fi

RUNNING=$($FLINK_HOME/bin/flink list -r -m $FLINK_JOBMANAGER_ADDR:$FLINK_JOBMANAGER_PORT | grep -o "[[:alnum:]]\{32\} : $FLINK_JOB_NAME")

echo "Currently running: $RUNNING"

if [ -n "$RUNNING" ]; then
  echo "Job $FLINK_JOB_NAME is already running, cancelling..."
  JOBIDS=$(echo $RUNNING | grep -o "[[:alnum:]]\{32\}")
  for ID in ${JOBIDS// / }; do
    echo "Cancelling JobID: $ID"
    $FLINK_HOME/bin/flink cancel $ID -m $FLINK_JOBMANAGER_ADDR:$FLINK_JOBMANAGER_PORT
  done
fi

echo "Starting Job: $FLINK_JOB_NAME"

exec $@
