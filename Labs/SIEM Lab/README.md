
# SIEM Lab

This lab provides a simulated environment for learning about Security Information and Event Management (SIEM) systems.

## Setup

1.  **Install Podman:**
    - Follow the instructions for your operating system to install Podman.

2.  **Install Filebeat:**
    - Follow the instructions for your operating system to install Filebeat.

3.  **Install Elasticsearch and Kibana:**
    - Follow the instructions for your operating system to install Elasticsearch and Kibana.

4.  **Configure Filebeat:**
    - Copy the `filebeat/filebeat.yml` file to your Filebeat configuration directory.

5.  **Import Kibana Dashboards:**
    - In Kibana, navigate to **Management > Saved Objects** and import the `dashboards/malware_dashboard.json` and `dashboards/shell_alerts.json` files.

## Running the Lab

To start the lab, run the following command:

```bash
./start_lab.sh
```

See the `student_docs/lab_guide.md` file for more detailed instructions.

## Cleanup

To stop and remove the containers, run the following command:

```bash
./stop_lab.sh
```
