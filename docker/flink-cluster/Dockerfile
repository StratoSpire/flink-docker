FROM stratospire/flink-base

MAINTAINER Ryan C Koch <ryanckoch@gmail.com>

ENV FLINK_TM_HEAP="256" \
    FLINK_JM_HEAP="256" \
    FLINK_TM_MEM_PRE_ALLOCATE="true"

ADD conf/* $FLINK_HOME/conf/

ADD /bin/* /usr/bin/

ENTRYPOINT ["entrypoint.sh"]
