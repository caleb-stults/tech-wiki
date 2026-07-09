# Remote Access: Tailscale Subnet Routing

## Overview
This is assuming you do not want your Emby instance exposed to the open Internet and have a Tailscale node installed on the same host server that Emby is running on. The intent of this is that any device on the network can use Emby without having their own Tailscale client on it. If you are looking for something like remote viewing on mobile data via Tailscale, the mobile device would still need the Tailscale app to make that connection. Don't open your server to the Internet unless you know what you're doing. If you do choose to do this, there is an Emby service called [Emby Connect](https://emby.media/support/articles/Emby-Connect.html) that they offer for help with this, but I have not used it.

## Setup Tailscale Access For All Devices on Network
1. Make sure /etc/sysctl.conf has:
    `net.ipv4.ip_forward=1`
2. Update the values
```bash
    sysctl -p
```
3. Add these iptables rules:
```bash
    sudo iptables -A FORWARD -i tailscale0 -j ACCEPT; sudo iptables -A FORWARD -o tailscale0 -j ACCEPT; sudo iptables -t nat -A POSTROUTING -o tailscale0 -j MASQUERADE
```
4. Make them persistent on reboot:
```bash
    sudo apt install iptables-persistent
```
5. Then make a static route for the emby tailscale IP to point to this server you ran these commands on.

## Tailscale Installation (Optional)
I now have Tailscale installed as a Docker container, but I did have it bare-metal to begin. Both instructions are below.

### Method 1: Bare-Metal
1. **Installation:**
`curl -fsSL https://tailscale.com/install.sh | sh`
2. **Authentication:**
`sudo tailscale up`
Follow the link provided in the terminal to log in to your Tailscale account.

### Method 2: Docker Container
1. **Docker Compose Setup**:
Create a `docker-compose.yml` file:
```yaml
services:
  tailscale:
    image: tailscale/tailscale:latest
    container_name: tailscale
    network_mode: host
    environment:
      - TS_STATE_DIR=/var/lib/tailscale
      # Ensure the node stays active
      - TS_USERSPACE=false
    volumes:
      - ./tailscale_data:/var/lib/tailscale
      - /dev/net/tun:/dev/net/tun
    cap_add:
      - NET_ADMIN
      - NET_RAW
    restart: unless-stopped
```
2. **Launching and Auth:**
Start the container:
`docker compose up -d`
Because the container runs in the background, you must execute the login command inside the container:
`docker exec tailscale tailscale up`
Click the link provided in the output to authorize the containerized node.