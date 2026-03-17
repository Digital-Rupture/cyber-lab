siem_lab/
├── containers/           # Podman container manifests (attack scenarios)
│   ├── malware_dropper.yml
│   ├── reverse_shell.yml
│   ├── port_scanner.yml
│   └── log_wiper.yml
├── dashboards/           # Kibana JSON exports (prebuilt views)
│   ├── malware_dashboard.ndjson
│   └── shell_alerts.json
├── alerts/               # SIEM detection rules
│   ├── suricata_rules/
│   └── elastic_rules/
├── reset/                # Cleanup logic
│   └── __init__.py
├── filebeat/             # Log forwarding configs
│   └── filebeat.yml
├── student_docs/         # Handouts, report templates
│   ├── lab_guide.md
│   └── forensic_report_template.md
└── README.md             # Overview and setup instructions