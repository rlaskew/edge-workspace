#!/bin/bash

set -o vi
pip3 install newrelic

NEW_RELIC_CONFIG_FILE=newrelic.ini 
NEW_RELIC_LICENSE_KEY=ADD_ME_HERE
newrelic-admin run-program ./newrelic-apm-demo.py 

## from https://docs.newrelic.com/docs/apm/agents/python-agent/custom-instrumentation/python-custom-instrumentation-config-file/
