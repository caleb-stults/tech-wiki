# Maintenance Workflows
This guide explains the primary functions automated by the repository.

## The Maintenance Playbooks
The repository is organized by "plays" that target specific segments of the infrastructure.

| Playbook | Purpose | Frequency |
| :--- | :--- | :--- |
| `site.yml` | The top-level orchestrator; runs all primary host configurations. | Weekly |
| `cluster.yml` | Manages Kubernetes-specific state and node join operations. | On-Demand |
| `security.yml` | Hardens OS settings, updates SSH keys, and manages firewall rules. | Monthly |

## Execution Workflow
To execute these maintenance tasks, follow this standard pattern:

1. **Initialize Environment:**
   ```bash
   source .venv/bin/activate
   ```
2. **Run Maintenance:**
```bash
ansible-playbook -i inventory/hosts site.yml --tags "update"
```

*Note: Always review the Git diff in the repository before running playbooks that affect production services.*