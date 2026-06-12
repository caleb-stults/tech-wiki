# Remote Access: Tailscale Subnet Routing

## Overview
My setup allows you to access your Emby server (on Server A) via a Tailscale subnet router (on Server B) without installing Tailscale on the Emby server itself. I have mine setup so that any devices on my network (such as a Chromecast) can utilize the Emby server over the Tailscale connection.

## 1. Configure the Subnet Router (Server B)
On the machine running Tailscale that is on the same local network as your Emby server:

1. **Enable IP Forwarding:**
   * Linux: Run these commands to enable packet forwarding persistently:
```bash
     echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
     echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
     sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
```

2. **Advertise the Route:**
   * Run the following command (replace `192.168.1.0/24` with your actual local network subnet):
```bash
     sudo tailscale set --advertise-routes=192.168.1.0/24
```

3. **Enable in Admin Console:**
   * Log in to your [Tailscale Admin Console](https://login.tailscale.com/admin/machines).
   * Find your Server B device, click the **three-dot (...) menu** > **Edit route settings**.
   * Check the box for your subnet and click **Save**.

## 2. Configure Emby (Server A)
Emby needs to know that requests coming from the Tailscale IP range are "local" to avoid connection issues.

1. Open the Emby Web UI.
2. Navigate to **Settings** > **Advanced** > **Networking**.
3. Under **LAN networks**, add the Tailscale subnet mask:
   * `100.64.0.0/10`
4. Click **Save**.

## 3. Client Access
* Install the Tailscale client on your remote device (laptop, phone, etc.).
* Connect to Tailscale.
* Access Emby using the internal LAN IP of the Emby server: `http://192.168.1.X:8096`.

## 4. Setup Tailscale Access For All Devices on Network (Optional)
* Make sure /etc/sysctl.conf has:
    `net.ipv4.ip_forward=1`
* Update the values
```bash
    sysctl -p
```
* Add these iptables rules:
```bash
    sudo iptables -A FORWARD -i tailscale0 -j ACCEPT; sudo iptables -A FORWARD -o tailscale0 -j ACCEPT; sudo iptables -t nat -A POSTROUTING -o tailscale0 -j MASQUERADE
```
* Make them persistent on reboot:
```bash
    sudo apt install iptables-persistent
```
* Then make a static route for the emby tailscale IP to point to this server you ran these commands on.