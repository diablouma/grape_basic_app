#!/usr/bin/env bash

nohup rackup config.ru --host 0.0.0.0 --port 9292 --pid /tmp/grape.pid  > app.log &
