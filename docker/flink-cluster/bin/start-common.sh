#!/usr/bin/env bash

DAEMON=$1
ARGS=("${@:2}") # get remaining arguments as array
JMX_PORT="9010"

FLINK_BIN_DIR="$FLINK_HOME/bin"
FLINK_CONF_DIR="$FLINK_HOME/conf"
FLINK_LIB_DIR="$FLINK_HOME/lib"
FLINK_MASTER_WEBUI_PORT="8081"

. "${FLINK_BIN_DIR}"/config.sh

case $DAEMON in
    (jobmanager)
        CLASS_TO_RUN=org.apache.flink.runtime.jobmanager.JobManager
        JMX_ARGS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=${JMX_PORT} -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
    ;;

    (taskmanager)
        CLASS_TO_RUN=org.apache.flink.runtime.taskmanager.TaskManager
        JMX_ARGS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=${JMX_PORT} -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
    ;;

    (*)
        echo "Unknown daemon '${DAEMON}'."
        exit 1
    ;;
esac

log_setting=("-Dlog4j.configuration=file:${FLINK_CONF_DIR}/log4j.properties" "-Dlogback.configurationFile=file:${FLINK_CONF_DIR}/logback.xml")

$JAVA_RUN $JVM_ARGS ${FLINK_ENV_JAVA_OPTS} ${JMX_ARGS} "${log_setting[@]}" -classpath "`manglePathList "$FLINK_TM_CLASSPATH:$INTERNAL_HADOOP_CLASSPATHS"`" ${CLASS_TO_RUN} "${ARGS[@]}"
