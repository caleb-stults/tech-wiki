# Troubleshooting Automation
Common issues encountered when running the `homelab-maintenance` infrastructure playbooks.

## Common Errors
* **SSH Connectivity:** If a playbook fails to connect, verify that the `ansible_user` in `inventory.ini` has valid SSH key access to the target host.
* **Vault Decryption Errors:** If `plays/` fail due to secrets, ensure your `ansible-vault` password is provided or stored in your local configuration. Secrets are strictly managed in `group_vars/all/vault.yaml`.
* **Hardware Firmware Mismatches:** If `plays/network_hardware.yaml` fails, ensure the target device is reachable and the firmware version defined in your variables matches the repository's expected release.
* **Storage API Timeouts:** If `plays/synology_nas.yaml` fails, check the Synology DSM status page to ensure the API service is responsive and the credentials in your vault are up to date.
* **Permission Denied:** Ensure your execution user configured in `inventory.ini` has proper `sudo` privileges on the target hosts.

## Debugging Workflow
If a play fails, you can isolate the issue by running the specific file with increased verbosity:

```bash
# Debugging a specific play with verbose output
ansible-playbook -i inventory.ini plays/media_server.yaml -vvv
```