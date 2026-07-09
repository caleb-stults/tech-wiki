# Pi-hole: DNS & Ad-Blocking

This service provides network-wide ad blocking and custom local DNS resolution for the home media pipeline. You can see my setup at my [GitHub repo](https://github.com/caleb-stults/pihole-container).

## Deployment
Deployed as a Docker container using `host` networking for direct network visibility.

**Configuration (`docker-compose.yml`):**
```yaml
services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    network_mode: "host" 
    environment:
      TZ: '${TZ}'
      FTLCONF_webserver_api_password: '${ADMIN_PASSWORD}'
      WEBTHEME: 'default-dark'
    volumes:
      - './etc-pihole:/etc/pihole'
      - './etc-dnsmasq.d:/etc/dnsmasq.d'
    restart: unless-stopped
```

## Configuration
1. **Ad-Blocking**
I utilize the [Steven Black list](https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts) to filter telemetry and advertisements at the DNS level.
    * Management: Update lists via the Pi-hole Admin Interface under Group Management > Adlists.
2. **Local DNS Entries**
Custom domains are defined to resolve internal services to static local IPs.
    * **Entry:** `netflix.home`
    * **Target:** `[INSERT_SERVER_IP_HERE]`
    * **Purpose:** Provides a consistent internal hostname for the Emby media server, regardless of underlying infrastructure changes.

## Maintenance & Backup
Because the configuration is bound to the `./etc-pihole` and `./etc-dnsmasq.d` directories, backups are handled by simply backing up these host folders.
* **To Update:**
```bash
docker compose pull
docker compose up -d
```
* **Teleporter:** For a manual backup, use the Tools > Teleporter feature in the web interface to export a `.tar.gz` archive of your settings.