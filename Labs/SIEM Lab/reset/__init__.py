import os
import glob

def cleanup():
    """Stops and removes all running containers, and stops lab services."""
    
    # Stop containers
    container_yamls = glob.glob("containers/*.yml")
    for yaml_file in container_yamls:
        print(f"Stopping pod from {yaml_file}...")
        os.system(f"podman play kube --down {yaml_file}")

    # Stop Elasticsearch
    print("Stopping Elasticsearch...")
    if os.path.exists("./elasticsearch-9.1.2/es.pid"):
        with open("./elasticsearch-9.1.2/es.pid", "r") as f:
            pid = f.read().strip()
            os.system(f"kill {pid}")
        os.remove("./elasticsearch-9.1.2/es.pid")
    else:
        print("Elasticsearch PID file not found.")

    # Stop Filebeat
    print("Stopping Filebeat...")
    os.system("pkill -f 'filebeat -c filebeat/filebeat.yml'")

    print("SIEM Lab stopped and resources released.")

if __name__ == "__main__":
    cleanup()