#!/bin/bash

/usr/local/sbin/wfantund $@ &

node /app/ti-wisun-webapp/server/src/index.js