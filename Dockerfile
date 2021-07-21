FROM elasticsearch:5.6-alpine AS BUILD

#FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.16 AS BUILD

LABEL mantainer="Adrian Kriel <admin@extremeshok.com>" vendor="eXtremeSHOK.com"

ENV OS_LOCALE="en_US.UTF-8"

ENV LANG=${OS_LOCALE}
ENV LANGUAGE=${OS_LOCALE}
ENV LC_ALL=${OS_LOCALE}

RUN echo "**** Install packages ****" \
# attachment doc/pdf/etc support
  && elasticsearch-plugin install -s ingest-attachment \
# CN users
  && elasticsearch-plugin install -s analysis-smartcn \
# ignore spelling
  && elasticsearch-plugin install -s analysis-phonetic

HEALTHCHECK CMD curl --fail http://127.0.0.1:9200 || exit 1

# Disable xpack and save some resources
ENV xpack.security.enabled=false
ENV xpack.watcher.enabled=false
ENV xpack.monitoring.enabled=false
ENV xpack.ml.enabled=false

# Single Node
ENV bootstrap.memory_lock=true
ENV discovery.type=single-node
ENV cluster.routing.allocation.disk.threshold_enabled=false
