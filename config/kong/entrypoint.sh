#!/bin/bash

echo "Starting Kong Plugins..."

/usr/local/kong/go-plugins/go-powered-by &
/usr/local/kong/go-plugins/go-seminarios-address &

echo "Kong Plugins started"

kong start