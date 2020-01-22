FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.16 AS BUILD

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
  && elasticsearch-plugin install -s analysis-phonetic \
# remove x-pack
  && elasticsearch-plugin remove -s x-pack

HEALTHCHECK CMD curl --fail http://127.0.0.1:9200 || exit 1

#EXPOSE 9200 9300

#WORKDIR /usr/share/elasticsearch

# add local files
#COPY rootfs/ /

#USER root

#RUN chmod 777 /docker-entrypoint.sh

#ENTRYPOINT ["/docker-entrypoint.sh"]

# Dummy overridable parameter parsed by entrypoint
#CMD ["eswrapper"]
