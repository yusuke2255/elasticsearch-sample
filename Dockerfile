FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.1
RUN elasticsearch-plugin install analysis-kuromoji