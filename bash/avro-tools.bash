#!/bin/bash

AVRO_VERSION=1.9.1
#AVRO_VERSION=1.8.2

if [ -f /opt/avro-tools/avro-tools-${AVRO_VERSION}.jar ]; then
  alias avro-tools='java -jar /opt/avro-tools/avro-tools-'$AVRO_VERSION'.jar'
fi
