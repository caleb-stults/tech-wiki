# Troubleshooting Automation
Common issues encountered when running infrastructure playbooks.

## Common Errors
* **SSH Connectivity:** If a playbook fails to connect, verify that the `ansible_user` in `inventory/hosts` has current SSH key access.
* **Service Rollbacks:** If an update causes a service (e.g., UniFi) to crash, check the logs for version mismatches. You may need to manually pin the software version in the corresponding variables file.
* **Permission Denied:** Ensure your execution user has proper `sudo` privileges configured on the target hosts.

## Getting Help
If the automated playbooks are consistently failing, check the repository's [Issue Tracker](https://github.com/caleb-stults/homelab-maintenance/issues) to see if others have reported the bug or to file a new report with your error logs.