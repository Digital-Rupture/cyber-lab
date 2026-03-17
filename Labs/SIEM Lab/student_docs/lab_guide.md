
# SIEM Lab Guide

## Introduction

This lab is designed to provide hands-on experience with a Security Information and Event Management (SIEM) system. You will learn how to detect and analyze various types of cyber attacks.

## Objectives

- Understand the role of a SIEM in a security operations center (SOC).
- Learn to identify and analyze common attack vectors.
- Gain experience with Kibana for visualizing security data.
- Write and test detection rules.

## Part 1: Prerequisites & Setup

Before starting the lab, ensure you have the necessary tools installed and configured.

1.  **Install Container Engine:**
    - This lab uses Podman to run simulated attack containers. Install it by following the official instructions at [podman.io](https://podman.io/getting-started/installation).

2.  **Install the Elastic Stack (Elasticsearch and Kibana):**
    - Elasticsearch is the search and analytics engine where security data will be stored. Kibana is the visualization layer used to view dashboards and analyze data.
    - Download and install both from the official Elastic website: [www.elastic.co/downloads](https://www.elastic.co/downloads/). Follow the installation guide for your specific operating system.

3.  **Install Filebeat:**
    - Filebeat is a lightweight shipper for forwarding and centralizing log data.
    - Download and install it from the same Elastic downloads page: [www.elastic.co/downloads/beats/filebeat](https://www.elastic.co/downloads/beats/filebeat).

4.  **Configure Filebeat:**
    - Copy the provided `filebeat/filebeat.yml` file from the lab's `filebeat` directory to your system's Filebeat configuration directory (e.g., `/etc/filebeat/filebeat.yml` on Linux). This configures Filebeat to send syslog data to your local Elasticsearch instance.

5.  **Import Kibana Dashboards:**
    - Once Kibana is running (usually at `http://localhost:5601`), navigate to **Stack Management > Kibana > Saved Objects**.
    - Click **Import** and import the `dashboards/malware_dashboard.json` and `dashboards/shell_alerts.json` files from the lab's root directory.

## Part 2: Lab Execution

1.  **Start the Attack Scenarios:**
    - Open a terminal and run the following command to start the simulated attacks:
      ```bash
      ./start_lab.sh
      ```
2.  **Analyze the Data in Kibana:**
    - Open your web browser and navigate to your Kibana instance (e.g., `http://localhost:5601`).
    - Open the "Malware Analysis Dashboard" and "Shell Alerts Dashboard" to begin your investigation. You will need to create visualizations and add them to these dashboards to find the malicious activity.
3.  **Create Detection Rules:**
    - Navigate to the `alerts` directory.
    - Create new Suricata and Elasticsearch rules to detect the simulated attacks. Review the existing examples to understand the format.
4.  **Forensic Report:**
    - Use the `forensic_report_template.md` to document your findings.
    - Detail the evidence you found for each attack and provide recommendations for remediation.
