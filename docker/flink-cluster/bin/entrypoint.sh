#!/bin/bash

CONF=$FLINK_HOME/conf
EXEC=$FLINK_HOME/bin


if [ -z "$FLINK_TM_SLOTS" ]; then
    FLINK_TM_SLOTS=$(nproc)
fi
sed -i -e "s/%flink_tm_slots%/$FLINK_TM_SLOTS/g" $CONF/flink-conf.yaml

#set parallelism
sed -i -e "s/%parallelism%/1/g" $CONF/flink-conf.yaml
sed -i -e "s/%flink_jm_addr%/$FLINK_JM_ADDR/g" $CONF/flink-conf.yaml
sed -i -e "s/%flink_jm_heap%/$FLINK_JM_HEAP/g" $CONF/flink-conf.yaml
sed -i -e "s/%flink_tm_heap%/$FLINK_TM_HEAP/g" $CONF/flink-conf.yaml
sed -i -e "s/%flink_tm_mem_pre_allocate%/$FLINK_TM_MEM_PRE_ALLOCATE/g" $CONF/flink-conf.yaml

# Metrics Reporter
sed -i -e "s/%statsd_reporter_host%/$STATSD_REPORTER_HOST/g" $CONF/flink-conf.yaml

echo "FLINK CONFIG"
cat $CONF/flink-conf.yaml
echo

exec "$@"
