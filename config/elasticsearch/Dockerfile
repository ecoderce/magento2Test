FROM docker.elastic.co/elasticsearch/elasticsearch:7.8.0

RUN set -x \
    && bin/elasticsearch-plugin install analysis-icu \
    && bin/elasticsearch-plugin install analysis-phonetic
