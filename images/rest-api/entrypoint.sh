#!/usr/bin/env bash

java -jar jetty-runner.jar --port 8081 --path /zts-rest-api /wars/zts-rest-api.war
