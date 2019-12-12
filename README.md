# docker-elasticsearch-elasticpress
optimised elasticsearch server for owncloud elasticsearch plugin

## Notes
* elasticsearch/elasticsearch:5.6.16
* added healthcheck
* still uses default entrypoint and cmd

## Plugins
* ingest-attachment : attachment (document/pdf) support
* analysis-smartcn : support for chinese users or mixed english/chinese in posts.
* analysis-phonetic : ignore spelling (support for mispelt keywords)

## Todo
Add support for ReadonlyREST Suite
https://github.com/beshu-tech/readonlyrest-docs/blob/master/elasticsearch.md
