#!/usr/bin/env bash

PID_FILE=/tmp/grape.pid

if [ -f $PID_FILE ]; then
	kill -SIGINT `cat $PID_FILE`
else
	echo "App is not running. Bye."
fi

