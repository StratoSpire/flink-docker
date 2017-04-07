FROM stratospire/flink-base

MAINTAINER Ryan C Koch <ryanckoch@gmail.com>

ENV FLINK_JOBMANAGER_ADDR="flink-jobmanager" \
    FLINK_JOBMANAGER_PORT="6123"

ADD bin/* /bin/

ENTRYPOINT ["/bin/entrypoint.sh"]
