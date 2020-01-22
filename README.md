# docker-elasticsearch-elasticpress
optimised elasticsearch server for owncloud elasticsearch plugin

## Notes
* elasticsearch/elasticsearch:5.6.16
* added healthcheck
* still uses default entrypoint and cmd
* runs by default as a single node
* xpack disabled

## Plugins
* ingest-attachment : attachment (document/pdf) support
* analysis-smartcn : support for chinese users or mixed english/chinese in posts.
* analysis-phonetic : ignore spelling (support for mispelt keywords)
