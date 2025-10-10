# Smart Home Pi Full Deployer

**Automated full-stack Smart Home installer for Raspberry Pi (NVMe boot)**

This project provides a ready-to-use, automated deployment of a complete smart home system on a Raspberry Pi 5 with NVMe. It sets up all essential services so you can have an operational smart home. It includes a local storage server Nextcloud and a local proxy Squid for automated and securized updates of services.

---

## Key Features

- **Home Assistant** — IoT automation hub for managing devices and scenes  
- **Nextcloud** — personal cloud, file sync, and media storage  
- **Mosquitto MQTT broker** — central hub for ESP devices and sensors  
- **ESPHome** — easy configuration for ESP-based devices  
- **Squid Proxy** — caching and access control  
- **Firewall & security** — UFW, secure defaults, SSL support guidance  
- **Docker & Docker Compose** — containerized, reproducible deployment  

---

## How It Works

1. **Boot your Raspberry Pi** from SD card with NVMe attached (or just SD).  
2. **Run the installation script**: it detects the NVMe, formats it if necessary, and installs the OS, Docker, and all services.  
3. **Configuration is automatic**, including firewall, Docker containers, and essential services.  
4. **Passwords and credentials** are generated automatically and stored locally on your PC — **never pushed to GitHub**.

> Optional: future versions may support **network-based detection and automated deployment** across multiple Pis.

---

## Why This Project Stands Out

- Professional, modular, and production-ready deployment  
- Demonstrates expertise in **Linux, Raspberry Pi, Docker, IoT, automation, and security**  
- Ready for extensions (add more containers or services easily)  
- Ideal for recruiters looking for candidates with **embedded systems, home automation, and cloud-ready deployment** skills  

---

## Repository Topics / Tags

