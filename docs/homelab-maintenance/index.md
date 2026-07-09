## Homelab Maintenance

# Overview
This is so I can (attempt) to be hands-off in updating my homelab infrastructure, from the hardware to the software. I utilize Ansible on my local machine to orchestrate all this. I'm still struggling to get the firmware on my access point and router to work as intended, but otherwise this works fairly well. Here is my [Homelab Maintenance Repository](https://github.com/caleb-stults/homelab-maintenance) if you want to look at the actual yaml files.

# Playbooks
| Playbook File | Category | Description |
| :--- | :--- | :--- |
| `network_check.yaml` | Network | Performs audits on firmware versions across the infrastructure. |
| `network_controller.yaml` | Network | Manages the Unifi and Pihole installations as well as OS updates on the server |
| `network_hardware.yaml` | Network | Orchestrates firmware deployments for Ubiquiti hardware. |
| `media_server.yaml` | Systems | Manages the Tailscale and Emby installations as well as OS updates on the server |
| `synology_nas.yaml` | Storage | Executes API checks and maintenance tasks for the NAS. |