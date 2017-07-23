#!/usr/bin/env bash

alias influxdb=docker_run_influxdb
docker_run_influxdb() {
  local host=${1:-$INFLUXDB_DEFAULT_HOSTNAME}
  local database=${2:-$INFLUXDB_DEFAULT_DATABASE}
  local username=${3:-$INFLUXDB_DEFAULT_USERNAME}
  local password=${4:-$INFLUXDB_DEFAULT_PASSWORD}
  docker run --rm -it influxdb influx -host $host -database $database -username $username -password $password
}

alias chronograf=docker_run_chronograf
docker_run_chronograf() {
  docker run --rm -p 8888:8888 -v ~/data/chronograf:/var/lib/chronograf chronograf
}

alias logstash=docker_run_logstash
docker_run_logstash() {
  docker run -t --rm -e "XPACK_MONITORING_ENABLED=false" docker.elastic.co/logstash/logstash:5.4.0
}
