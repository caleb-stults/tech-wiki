## Homelab Maintenance

# Homelab Maintenance Philosophy
The `homelab-maintenance` repository is the "Control Plane" for my home infrastructure. Rather than manually updating servers or tweaking configurations, this repository allows me to manage the environment as code.

## Why this repository is necessary
1. **Consistency:** Ensures every node in the cluster is configured identically, eliminating "configuration drift."
2. **Reproducibility:** If a host fails, I can rebuild it from scratch by running the playbooks, rather than troubleshooting individual settings.
3. **Auditability:** Every change to the infrastructure is version-controlled, allowing me to see exactly when and why a configuration was altered.
4. **Efficiency:** Automates repetitive tasks (patching, user creation, security hardening) across the entire lab with a single command.

## How to use this Wiki
Use this wiki to understand the *workflow* and *reasoning* behind the configurations. When you are ready to apply changes, refer to the [Homelab Maintenance Repository](https://github.com/caleb-stults/homelab-maintenance) for the source playbooks.