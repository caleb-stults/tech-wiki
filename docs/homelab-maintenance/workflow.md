# Maintenance Workflows
This guide explains the primary maintenance operations automated by the `homelab-maintenance` repository.

## Repository Structure
The repository is designed with a master orchestrator (`main_playbook.yaml`) and specialized plays located in the `plays/` directory.

| Playbook | Purpose |
| :--- | :--- |
| `main_playbook.yaml` | The master orchestrator; executes the full maintenance suite. |
| `plays/network_check.yaml` | Audits current firmware versions across network devices. |
| `plays/network_controller.yaml` | Manages OS updates for the network controller. |
| `plays/media_server.yaml` | Handles Linux patching and service health checks. |
| `plays/network_hardware.yaml` | Deploys firmware updates to Ubiquiti hardware. |
| `plays/synology_nas.yaml` | Performs storage API health checks and maintenance. |

## Execution
To run maintenance tasks, use the inventory defined in `inventory.ini`.

1. **Verify Connectivity:** Ensure your workstation has SSH access to the targets.
2. **Execute Orchestrator:**
   ```bash
   ansible-playbook -i inventory.ini main_playbook.yaml
   ```
3. **Execute Specific Play:**
    ```bash
    ansible-playbook -i inventory.ini plays/synology_nas.yaml
    ```
## Configuration Notes
* **Secrets:** Sensitive data is managed in `group_vars/all/vault.yaml`. Ensure you have the vault password available when running plays that require authentication.  
* **Inventory:** All host definitions and connection variables are centralized in `inventory.ini`.  