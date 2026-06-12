# Infrastructure Setup
This is how to install Emby on a Linux server and connect it to an external NAS via NFS. For my setup I have an Ubuntu server and a Synology DS923 NAS. 

## Emby Server Installation
* **Version:** 4.9.5.0
* **OS:** Ubuntu Server 22.04 LTS

### Installation Steps
1. Update repositories: `sudo apt update && sudo apt upgrade -y`
2. Download the `.deb` package from the [official Emby download page](https://emby.media/download.html).
3. Install: `sudo dpkg -i emby-server-deb_4.9.5.0_amd64.deb`
4. Enable service: `sudo systemctl enable emby-server && sudo systemctl start emby-server`

## Synology NAS NFS Mounting
1. **NAS Prep:** Control Panel > Shared Folder > Edit > NFS Permissions. Grant access to your server's IP.
2. **Client Setup:** `sudo apt install nfs-common`
3. **Mount Point:** Create directory `sudo mkdir -p /path/to/nas`
4. **Persistent Mount:** Add to `/etc/fstab`:
   `[NAS_IP]:/volume1/media /path/to/nas nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0`
5. **Verify:** `sudo mount -a`
6. **Set Permissions** Set the `emby` user to have `755` permissions on the directories within the NFS mount (`sudo chown -R emby:emby /mnt/media`
`sudo chmod -R 755 /mnt/media`)
7. **Setup NFS Mount on Local Machine**
    * **Windows** 
        * **Enable NFS** Control Panel > Programs > "Turn Windows features on or off" > Check "Services for NFS".
        * **Mount:** Open Command Prompt as Administrator.
            `mount -o anon \\NAS_IP\volume1\media Z:`
    * **Linux**
        * **Install Utils:** `sudo dnf install nfs-utils`
        * **Mount:** `sudo mount -t nfs NAS_IP:/volume1/media /path/to/nas`