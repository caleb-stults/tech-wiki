# Tech Wiki

The central knowledge base for my home laboratory and technical infrastructure. This repository contains the source documentation for my self-hosted services, maintenance procedures, and network configurations.

## About
This wiki is built using [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) and is automatically deployed via GitHub Actions. It serves as an evolving reference point for my technical stack.

## Structure
- **/docs/homelab:** Standard operating procedures for infrastructure maintenance.
- **/docs/media-pipeline:** How-to guides for setting up my media pipeline

## Contributing
To add new documentation or update existing guides:

1. **Create a new page:**
   ```bash
   ./new_post.sh "Your Title Here" [optional-directory]
   ./deploy.sh "Commit message"
   ```