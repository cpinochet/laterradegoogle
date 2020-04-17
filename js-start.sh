#!/bin/bash
numer=`ps aux | grep node | wc -l`
if [[ $numer -lt 2 ]]; then
	cd /root
	echo "starting json-server"
	json-server -H 0.0.0.0 --watch peliculas.json --port 80 
else 
	echo "json-server is already running"
fi