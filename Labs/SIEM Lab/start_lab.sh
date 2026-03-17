#!/bin/bash

# Start Elasticsearch
echo "Starting Elasticsearch..."
if [ -f ./elasticsearch-9.1.2/es.pid ]; then
    echo "Elasticsearch already running."
else
    ./elasticsearch-9.1.2/bin/elasticsearch -d -p ./elasticsearch-9.1.2/es.pid
fi

# Start Filebeat
echo "Starting Filebeat..."
if pgrep -f "filebeat -c filebeat/filebeat.yml" > /dev/null; then
    echo "Filebeat already running."
else
    filebeat -c filebeat/filebeat.yml -e &
fi

# Start Suricata
echo "Starting Suricata container..."
podman play kube containers/suricata.yml &

# Start simulation containers
echo "Starting simulation containers..."
podman play kube containers/port_scanner.yml &
podman play kube containers/malware_dropper.yml &
podman play kube containers/reverse_shell.yml &
podman play kube containers/log_wiper.yml &

echo "SIEM Lab started."
