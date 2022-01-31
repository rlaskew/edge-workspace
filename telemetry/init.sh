#!/bin/bash

set -o vi
export OTEL_EXPORTER_OTLP_ENDPOINT="https://otlp.nr-data.net:4317"
#export OTEL_EXPORTER_OTLP_HEADERS="api-key=new-relic-api-key"
export OTEL_SERVICE_NAME="demo-otel-service-name"
pip3 install opentelemetry-api
pip3 install opentelemetry-sdk
pip3 install opentelemetry-exporter-otlp
./tracing.py
