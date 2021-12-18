#!/bin/bash

echo "Starting Kong Plugins..."

/usr/local/kong/go-plugins/go-powered-by &
/usr/local/kong/go-plugins/go-seminaries-address &

echo "Kong Plugins started"

kong start 2>&1