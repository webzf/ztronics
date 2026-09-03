---
title: "Raspberry Pi IT Projects: Practical Home Server, Pi-hole, VPN, and Network Monitoring"
layout: single
permalink: /raspberry-pi-it-projects/
sidebar:
  nav: "embedded"
excerpt: "Real Raspberry Pi IT projects for home servers, networking, storage, and self-hosting — with hardware picks, commands, and difficulty ratings for beginners through advanced users."
show_date: false
read_time: false
toc: true
toc_sticky: true
header:
  teaser: /assets/images/raspberry-pi-it-projects-teaser.jpg
  overlay_image: /assets/images/raspberry-pi-it-projects-header.jpg
  overlay_filter: 0.5
  image: /assets/images/raspberry-pi-it-projects-header.jpg
  og_image: /assets/images/raspberry-pi-it-projects-og.jpg
categories:
  - Raspberry Pi
tags:
  - raspberry pi
  - home server
  - pi-hole
  - wireguard
  - networking
  - self-hosting
  - docker
related: true
share: true
---

If you are looking for **Raspberry Pi IT projects**, you do not need another list of LED blinkers, clocks, or weather stations.

The Raspberry Pi can be much more useful as a small Linux server and home-lab platform. It can provide DNS filtering, network storage, automated backups, VPN access, monitoring, containers, and self-hosted applications.

This guide focuses on **Raspberry Pi projects that perform real IT tasks**. The goal is to help you build useful infrastructure while learning practical Linux, networking, storage, security, and system administration skills.

Think of it as a small IT laboratory you can build at home.

## What Can You Use a Raspberry Pi for in IT?

A Raspberry Pi can run many lightweight IT services, including:

- Home servers
- DNS filtering with Pi-hole
- NAS storage with Samba
- Automated backup servers
- WireGuard VPN servers
- Network monitoring
- Docker containers
- Personal cloud services
- Local DNS
- Network diagnostic tools

These projects are useful because the skills transfer directly to larger Linux servers, cloud environments, networking equipment, and professional IT administration.

---

# Raspberry Pi Hardware for IT Projects

The Raspberry Pi model you choose depends on the workload.

| Raspberry Pi | Best suited for |
|---|---|
| **Raspberry Pi 5** | Multiple services, Docker, monitoring, Nextcloud, larger home labs |
| **Raspberry Pi 4** | Home servers, Pi-hole, Samba, WireGuard, lightweight monitoring and Docker |
| **Raspberry Pi Zero 2 W** | Lightweight services such as DNS filtering and small utilities |
| **Older Raspberry Pi 3** | Basic services and lightweight servers |

For a new home-lab build, the **Raspberry Pi 5** is the strongest choice when you expect to run several services simultaneously.

## Storage

A microSD card is convenient for the operating system, but an SSD is generally a better choice for write-intensive workloads such as databases, Nextcloud, Docker volumes, and long-term monitoring.

For storage-heavy projects, consider:

- USB 3 SSD
- USB hard drive
- NVMe storage on compatible Raspberry Pi 5 hardware
- Separate storage for backups

Do not confuse storage with backup. A NAS or SSD containing your only copy of important files is not a backup.

## Power Supply

Use an appropriate power supply for your Raspberry Pi model.

An unstable power source can cause crashes, unexpected shutdowns, or filesystem problems.

## Ethernet vs Wi-Fi

For infrastructure that runs continuously, Ethernet is usually preferable.

It provides a more predictable network connection for:

- NAS storage
- Backups
- VPN servers
- Monitoring
- Home servers

Wi-Fi can work well for lightweight services, but wired Ethernet is generally the better choice for a home server.

---

# Raspberry Pi IT Projects for Beginners

These projects are good starting points if you are new to Linux servers and networking.

## 1. Raspberry Pi Home Server

**Difficulty:** Beginner  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** Raspberry Pi OS, OpenSSH, optional Samba  
**Storage:** 16–32GB microSD for a basic system; SSD for heavier workloads  
**Network:** Ethernet recommended

A Raspberry Pi home server is one of the best starting points for learning Linux administration.

You can use it as a central machine for running other services while learning:

- SSH
- Linux users and permissions
- IP addressing
- Hostnames
- systemd services
- Package management
- Storage
- Networking

### Basic setup

After installing Raspberry Pi OS, update the system:

```bash
sudo apt update
sudo apt upgrade
```

Enable SSH using the current Raspberry Pi OS configuration tools.

Check the hostname:

```bash
hostname
```

Check the network address:

```bash
hostname -I
```

For a server, you normally want a **predictable IP address**. A DHCP reservation configured on your router is often simpler than manually configuring a static IP on the Raspberry Pi.

### Adding Samba

Install Samba:

```bash
sudo apt update
sudo apt install samba
```

Create a directory:

```bash
sudo mkdir -p /srv/shared
```

Assign ownership:

```bash
sudo chown yourusername:yourusername /srv/shared
```

Edit `/etc/samba/smb.conf` and add:

```ini
[Shared]
    path = /srv/shared
    browseable = yes
    read only = no
    valid users = yourusername
```

Add the Samba password:

```bash
sudo smbpasswd -a yourusername
```

Check the configuration:

```bash
testparm
```

Restart Samba:

```bash
sudo systemctl restart smbd
```

This simple setup gives you a useful Linux server while introducing concepts that apply to larger environments.

### Why this is an IT project

Instead of treating the Raspberry Pi as a microcontroller, you are using it as infrastructure.

You are managing:

- A Linux operating system
- Network services
- User accounts
- Permissions
- Server processes
- Shared storage

### Possible upgrades

You can later add:

- Pi-hole
- WireGuard
- Docker
- Network monitoring
- Automated backups
- Additional storage

---

## 2. Pi-hole DNS Ad Blocker

**Difficulty:** Beginner  
**Recommended hardware:** Raspberry Pi 3 or newer, including Zero 2 W for lightweight installations  
**Main software:** Pi-hole  
**Storage:** Small  
**Network:** Ethernet recommended

Pi-hole turns the Raspberry Pi into a network-wide DNS filtering service.

Instead of configuring every device individually, your router can send DNS requests to Pi-hole.

The basic flow is:

```text
Device
   |
   v
Router
   |
   v
Pi-hole
   |
   v
DNS resolver
   |
   v
Internet
```

Pi-hole can block domains using configured blocklists and provide useful DNS statistics.

Because installation procedures can change, use the **current official Pi-hole installation instructions** rather than relying on an old installation command copied from a tutorial.

You should also give the Raspberry Pi a predictable network address, typically using a DHCP reservation or another appropriate network configuration.

### Useful troubleshooting commands

Test network connectivity:

```bash
ping 1.1.1.1
```

Test DNS:

```bash
dig example.com
```

If DNS filtering appears not to work, check whether clients are actually using Pi-hole for DNS.

Some devices and applications can use encrypted DNS such as DNS-over-HTTPS, which can bypass network-level DNS filtering depending on their configuration.

### What you learn

Pi-hole teaches:

- DNS
- Client/server communication
- DHCP
- Network configuration
- DNS filtering
- Troubleshooting

### Possible upgrades

- Local DNS names
- Different filtering groups
- Multiple DNS servers
- VPN integration
- Monitoring

---

## 3. Raspberry Pi NAS with Samba

**Difficulty:** Beginner–Intermediate  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** Samba  
**Storage:** USB 3 SSD or HDD  
**Network:** Ethernet strongly recommended

A Raspberry Pi can provide network storage for computers on your home network.

Typical uses include:

- Shared documents
- Media storage
- Project files
- Local archives
- Development files

A basic architecture looks like:

```text
Laptop ─────┐
Desktop ────┼── Ethernet ── Raspberry Pi ── SSD/HDD
Phone ──────┘
```

The Raspberry Pi runs Samba and exposes selected directories over the network.

### Important: NAS is not backup

If the Raspberry Pi contains the only copy of your files, the system is not a backup solution.

A better design is:

```text
Computers
    |
    v
Raspberry Pi NAS
    |
    v
Backup storage
```

### What you learn

- Linux filesystems
- Mount points
- File permissions
- Network shares
- Samba
- Storage management

### Possible upgrades

- SSD storage
- Automated backups
- Multiple users
- Monitoring
- Off-site backups

---

## 4. Automated Backup Server with rsync

**Difficulty:** Intermediate  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** rsync and cron  
**Storage:** Depends on source data and retention strategy  
**Network:** Ethernet recommended

A Raspberry Pi can become an automated backup server.

The simplest architecture is:

```text
PCs / Servers
      |
      | rsync
      v
Raspberry Pi
      |
      v
Backup storage
```

A basic rsync example is:

```bash
rsync -av --delete /source/ user@server:/backup/
```

Be careful with `--delete`: files removed from the source can also be removed from the destination.

For recurring backups, cron can run rsync automatically.

The amount of storage required depends on:

- Source data size
- Number of systems
- Retention period
- Backup frequency
- Whether historical versions are retained

For more advanced backup designs, `rsync --link-dest` can reduce additional storage requirements when many files remain unchanged between backup runs.

### What you learn

- rsync
- Scheduling
- Backup strategies
- Retention
- Recovery
- Linux permissions

A backup is only useful if you can restore from it, so test your recovery process.

---

# Intermediate Raspberry Pi IT Projects

## 5. WireGuard VPN Server

**Difficulty:** Intermediate  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** WireGuard  
**Storage:** Minimal  
**Network:** Ethernet recommended

A Raspberry Pi can provide secure remote access to your home network using WireGuard.

A simplified architecture is:

```text
Phone / Laptop
      |
   Internet
      |
      v
Home Router
      |
      v
Raspberry Pi
  WireGuard
      |
      v
Home Network
```

WireGuard uses cryptographic keys to authenticate peers.

Generate a private key and public key with:

```bash
umask 077
wg genkey > privatekey
wg pubkey < privatekey > publickey
```

A representative server configuration might look like:

```ini
[Interface]
Address = 10.8.0.1/24
ListenPort = 51820
PrivateKey = SERVER_PRIVATE_KEY

[Peer]
PublicKey = CLIENT_PUBLIC_KEY
AllowedIPs = 10.8.0.2/32
```

Bring up the interface:

```bash
sudo wg-quick up wg0
```

Check its status:

```bash
sudo wg show
```

Your router normally needs to forward the WireGuard UDP port to the Raspberry Pi.

If your public IP changes, dynamic DNS can provide a stable hostname.

### Important routing detail

A VPN does not automatically make every connection behave as if the client were physically plugged into the LAN.

The result depends on the WireGuard configuration, particularly:

- `AllowedIPs`
- Routing
- NAT
- Firewall rules
- Split-tunnel or full-tunnel design

### Security

Only expose the VPN port that you actually need. Do not expose SSH directly to the Internet just because you are running a VPN server.

### What you learn

- VPNs
- Public/private keys
- Routing
- NAT
- Firewall concepts
- Remote access

---

## 6. Raspberry Pi Network Monitoring with Prometheus and Grafana

**Difficulty:** Intermediate–Advanced  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** Prometheus, Node Exporter, Grafana  
**Storage:** Depends on targets, scrape interval, and retention  
**Network:** Ethernet recommended

A Raspberry Pi can become a small observability server.

Prometheus collects metrics, while Grafana can visualize them in dashboards.

A typical setup is:

```text
Raspberry Pi
    |
    +---- Prometheus
    |
    +---- Grafana
    |
    +---- Node Exporter
              |
              v
       System metrics
```

You can also monitor multiple machines:

```text
Pi 1 ──┐
Pi 2 ──┤
Server ┼──> Prometheus ──> Grafana
PC  ───┘
```

A representative Prometheus configuration is:

```yaml
scrape_configs:
  - job_name: "raspberry-pi"
    static_configs:
      - targets:
          - "192.168.1.50:9100"
```

Multiple targets can be added:

```yaml
scrape_configs:
  - job_name: "home-lab"
    static_configs:
      - targets:
          - "192.168.1.50:9100"
          - "192.168.1.51:9100"
          - "192.168.1.52:9100"
```

Grafana includes a Prometheus data source, which can be configured to use an address such as:

```text
http://localhost:9090
```

when Prometheus and Grafana are running on the same Raspberry Pi.

Use the current official documentation for installation commands because package versions and installation methods can change.

### What you learn

- Metrics
- Time-series databases
- PromQL
- Dashboards
- System monitoring
- Observability

### Possible upgrades

- Alertmanager
- Multiple Raspberry Pis
- Network device monitoring
- Docker monitoring
- Disk-space alerts
- Temperature monitoring

---

## 7. Raspberry Pi Docker Home Server

**Difficulty:** Intermediate  
**Recommended hardware:** Raspberry Pi 4 or Raspberry Pi 5  
**Main software:** Docker and Docker Compose  
**Storage:** Depends on containers and application data  
**Network:** Ethernet recommended

Docker makes it easier to run multiple applications on one Raspberry Pi.

Instead of installing every application directly into the operating system, you can isolate services into containers.

For example:

```text
Raspberry Pi
│
├── Pi-hole
├── Grafana
├── Prometheus
├── Home Assistant
└── Other services
```

Docker introduces important concepts:

- Images
- Containers
- Volumes
- Networks
- Environment variables
- Compose files
- Application deployment

An SSD is particularly useful if containers write frequently to disk.

### Possible upgrades

A Docker home server can later include:

- Reverse proxy
- Monitoring
- Centralized logs
- Automatic updates
- Multiple application stacks

---

## 8. Raspberry Pi Local DNS Server

**Difficulty:** Intermediate  
**Recommended hardware:** Raspberry Pi 3 or newer  
**Main software:** dnsmasq or Pi-hole  
**Storage:** Minimal  
**Network:** Ethernet recommended

A local DNS server can make devices and services easier to access.

Instead of remembering addresses such as:

```text
192.168.1.50
192.168.1.51
192.168.1.52
```

you can use meaningful hostnames.

For example:

```text
nas.home
server.home
monitor.home
```

A local DNS service can provide name resolution for your internal network.

### What you learn

- DNS records
- Name resolution
- DNS caching
- DHCP/DNS relationships
- Internal networking

This project also works particularly well alongside Pi-hole or a home server.

---

# Advanced Raspberry Pi IT Projects

## 9. Nextcloud Personal Cloud

**Difficulty:** Advanced  
**Recommended hardware:** Raspberry Pi 5 preferred; Raspberry Pi 4 for smaller installations  
**Main software:** Nextcloud plus a supported web server, PHP, and database  
**Storage:** SSD strongly recommended  
**Network:** Ethernet strongly recommended

Nextcloud can turn a Raspberry Pi into a self-hosted personal cloud.

Depending on the deployment, it can provide:

- File synchronization
- File sharing
- Calendars
- Contacts
- Collaboration features

A simplified architecture is:

```text
Phone / Laptop
      |
   Internet
      |
      v
Reverse Proxy / Web Server
      |
      v
   Nextcloud
      |
      +---- Database
      |
      +---- SSD Storage
```

For a serious installation, use a supported 64-bit operating system and pay attention to the current Nextcloud system requirements.

An SSD is strongly recommended because Nextcloud can generate substantial filesystem and database activity.

### What you learn

- Web servers
- PHP
- Databases
- Authentication
- HTTPS
- Storage
- Application administration

### Possible upgrades

- Reverse proxy
- HTTPS
- Automated backups
- Monitoring
- External storage
- VPN access

---

## 10. Raspberry Pi Network Utility and Diagnostic Server

**Difficulty:** Intermediate  
**Recommended hardware:** Raspberry Pi 3 or newer  
**Main software:** iperf3, nmap, Smokeping, and Linux networking tools  
**Storage:** Small  
**Network:** Ethernet strongly recommended

A Raspberry Pi can be kept permanently connected to your network as a diagnostic appliance.

Useful tools include:

- `ping`
- `dig`
- `ss`
- `ip`
- `traceroute`
- `iperf3`
- `nmap`
- Smokeping

For example, `iperf3` can help measure network throughput between two endpoints.

You can also use the Raspberry Pi to investigate:

- DNS problems
- Open ports
- Latency
- Packet loss
- Network throughput
- Connectivity issues

This is particularly useful in a home lab because the diagnostic machine is always available.

---

# Raspberry Pi IT Projects Comparison

| Project | Difficulty | Main software | Storage | Best for |
|---|---|---|---|---|
| Home Server | Beginner | Raspberry Pi OS, SSH, Samba | Low–Medium | Learning Linux administration |
| Pi-hole | Beginner | Pi-hole | Low | DNS filtering |
| NAS | Beginner–Intermediate | Samba | High | Network storage |
| Backup Server | Intermediate | rsync, cron | High | Automated backups |
| WireGuard VPN | Intermediate | WireGuard | Low | Secure remote access |
| Monitoring | Intermediate–Advanced | Prometheus, Grafana | Medium | Observability |
| Docker Server | Intermediate | Docker | Medium–High | Running multiple services |
| Local DNS | Intermediate | dnsmasq/Pi-hole | Low | Internal networking |
| Nextcloud | Advanced | Nextcloud, PHP, database | High | Self-hosted cloud |
| Network Utility Server | Intermediate | iperf3, nmap, Smokeping | Low | Network diagnostics |

---

# Build a Raspberry Pi Home Lab

The most interesting approach is not necessarily to run every service on one Raspberry Pi.

You can gradually build a small home laboratory.

For example:

```text
                    Home Network
                         |
                 ┌───────┴───────┐
                 |               |
              Router          Switch
                 |               |
             Pi-hole        ┌─────┴─────┐
                            |           |
                         Server       NAS
                            |
                    ┌───────┼────────┐
                    |       |        |
                 Docker  Monitoring  VPN
```

You can start with one Raspberry Pi and add services as you learn.

A more advanced setup could use multiple Raspberry Pis:

```text
Pi 1 → DNS / Pi-hole
Pi 2 → Docker services
Pi 3 → Monitoring
Pi 4 → Storage / backups
```

This gives you experience with distributed services, networking, monitoring, and failure isolation.

---

# Raspberry Pi IT Projects and Security

A useful server should also be a secure server.

At minimum:

### Keep the operating system updated

```bash
sudo apt update
sudo apt upgrade
```

### Protect SSH

Use strong authentication and avoid exposing SSH directly to the public Internet unless you have a specific reason and understand the risks.

### Minimize Internet exposure

Only expose services that need external access.

For remote access, a VPN is generally preferable to exposing multiple internal services.

### Back up configuration

Depending on your setup, important backup targets can include:

- `/etc/`
- Docker Compose files
- Application configuration
- Database backups
- Samba configuration
- WireGuard configuration
- Prometheus configuration

### Monitor the server

A service that silently fails is difficult to trust.

Monitoring can help detect:

- Disk-space problems
- High CPU usage
- Memory pressure
- Network failures
- Service failures
- Temperature problems

---

# Raspberry Pi Server Troubleshooting

When something stops working, troubleshoot from the bottom up.

A useful model is:

```text
Hardware
   ↓
Operating System
   ↓
Network
   ↓
Service
   ↓
Application
```

Start with basic checks.

### Check uptime

```bash
uptime
```

### Check the IP address

```bash
hostname -I
```

### Test the router

```bash
ping 192.168.1.1
```

### Test DNS

```bash
dig example.com
```

### Check a service

```bash
systemctl status SERVICE_NAME
```

### Check listening ports

```bash
ss -tulpn
```

### Check service logs

```bash
journalctl -u SERVICE_NAME
```

This layered approach prevents you from debugging an application when the actual problem is a network connection or operating-system failure.

---

# Connecting Raspberry Pi IT Projects with Embedded Nerd

The strongest approach for Embedded Nerd is to use this article as a **pillar page**.

This page answers:

> **What Raspberry Pi IT project should I build?**

Individual tutorials can then answer:

> **How exactly do I build it?**

That creates a natural content cluster.

For example:

```text
Raspberry Pi IT Projects
│
├── Raspberry Pi Home Server Setup
├── Raspberry Pi NAS with Samba
├── Raspberry Pi WireGuard VPN
├── Pi-hole Installation
├── Prometheus + Grafana Monitoring
├── Raspberry Pi Docker Home Server
├── Raspberry Pi rsync Backup Server
├── Raspberry Pi Local DNS
└── Raspberry Pi Network Diagnostics
```

Add internal links when they genuinely help the reader, including relevant Embedded Nerd content such as:

- `[Internal Link: Raspberry Pi Pico Projects]`
- `[Internal Link: Raspberry Pi GPIO Guide]`
- `[Internal Link: ESP32 Projects]`
- `[Internal Link: MPU6050 Calibration]`
- `[Internal Link: I2C Pull-up Resistor Calculator]`

Do not add unrelated links simply to increase the number of internal links.

---

# Future Raspberry Pi IT Articles

This pillar page can support several focused tutorials:

1. **Raspberry Pi Home Server Setup: Complete Beginner's Guide**
2. **Raspberry Pi NAS with Samba: Step-by-Step Guide**
3. **Raspberry Pi WireGuard VPN Server: Complete Tutorial**
4. **How to Install Pi-hole on Raspberry Pi**
5. **Raspberry Pi Prometheus and Grafana Monitoring Tutorial**
6. **Raspberry Pi Docker Home Server: Beginner's Guide**
7. **Raspberry Pi Backup Server with rsync**
8. **Raspberry Pi Local DNS Server for Home Networks**
9. **Raspberry Pi Network Monitoring and Diagnostic Tools**
10. **Raspberry Pi SSD Storage and Boot Guide**
11. **Raspberry Pi Home Lab: Build a Mini IT Laboratory**
12. **Raspberry Pi Server Security: SSH, Firewall, Updates and Backups**

These individual articles can link back to this pillar page and to each other where relevant.

---

# Which Raspberry Pi IT Project Should You Start With?

Choose the project based on what you want to learn.

**New to Linux?**  
Start with a **Raspberry Pi Home Server**.

**Want something useful for the entire household?**  
Build **Pi-hole**.

**Need centralized file storage?**  
Build a **Raspberry Pi NAS with Samba**.

**Want automated backups?**  
Build an **rsync backup server**.

**Need secure remote access?**  
Build a **WireGuard VPN server**.

**Want to learn observability?**  
Build **Prometheus and Grafana monitoring**.

**Want to run multiple services?**  
Build a **Docker home server**.

**Want your own cloud?**  
Try **Nextcloud**.

The important part is not how many services you install. Start with one project, understand how it works, secure it, monitor it, and then build outward.

---

# Conclusion

The Raspberry Pi is capable of being much more than an electronics project platform.

With the right software and storage, it can become:

- A Linux home server
- A DNS filtering appliance
- A NAS
- A backup server
- A WireGuard VPN endpoint
- A monitoring platform
- A Docker host
- A personal cloud
- A local DNS server
- A network diagnostic appliance

These **Raspberry Pi IT projects** are valuable because they teach skills that extend beyond the Raspberry Pi itself.

You learn Linux administration, networking, storage, security, automation, monitoring, and self-hosting while building infrastructure that can actually be useful at home.

Start small, build one service properly, and turn your Raspberry Pi into your own little IT laboratory.

---

# FAQ

## What can a Raspberry Pi be used for in IT?

A Raspberry Pi can run lightweight servers and infrastructure services such as DNS filtering, network storage, backups, VPNs, monitoring, Docker containers, local DNS, and self-hosted applications.

## Can a Raspberry Pi be used as a server?

Yes. Raspberry Pi computers can run Linux server software and provide services over a local network or, with appropriate security and configuration, remotely.

## Can Raspberry Pi run Pi-hole?

Yes. Pi-hole is designed to run on supported Raspberry Pi hardware and can provide DNS-based network filtering.

## Can Raspberry Pi run a VPN?

Yes. WireGuard is one option for running a VPN endpoint on a Raspberry Pi. The exact setup depends on routing, firewall, NAT, and whether you want split-tunnel or full-tunnel access.

## Is Raspberry Pi good for network monitoring?

Yes. A Raspberry Pi 4 or Raspberry Pi 5 can run lightweight monitoring stacks such as Prometheus and Grafana, depending on the number of monitored targets, retention settings, and workload.

## Do I need a static IP for these Raspberry Pi projects?

Not necessarily. Many home networks can use a **DHCP reservation** so the Raspberry Pi receives the same address. The important requirement for many server applications is having a predictable address.

## Is a microSD card reliable enough for a Raspberry Pi server?

A microSD card can be suitable for light workloads, but an SSD is generally preferable for write-intensive services such as databases, Nextcloud, Docker volumes, and long-term monitoring.

## Can I run multiple Raspberry Pi IT projects on the same Raspberry Pi?

Yes, provided the hardware has enough CPU, RAM, storage, and network capacity. Docker can make managing multiple services easier, but combining many workloads on one machine also creates a larger single point of failure.
