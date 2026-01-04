# Automated secure GCP network lab

Dieses Projekt demonstriert die automatisierte Bereitstellung einer sicheren und segmentierten Netzwerkinfrastruktur in der Google Cloud Platform (GCP). Es wurde entwickelt, um moderne Sicherheitsprinzipien wie Zero Trust und kontrollierten Egress-Traffic zu veranschaulichen.

## Kernfunktionen

- **Infrastruktur als Code (IaC):** Vollständige Automatisierung mit **Terraform** zur Gewährleistung von Konsistenz und Stabilität.
- **Netzwerksegmentierung:** Trennung von Management- und Produktions-Subnetzen zur Reduzierung der Angriffsfläche.
- **Zero-Trust-Zugriff:** Implementierung von **Identity-Aware Proxy (IAP)** für sicheren SSH-Zugriff ohne öffentliche IP-Adressen oder offene Ports.
- **Egress-Management:** Nutzung von **Cloud NAT**, damit private Instanzen sicher Updates beziehen können, ohne aus dem Internet erreichbar zu sein.
- **Automatisierte Konfiguration:** Nutzung von **Bash-Skripten** (Startup-Scripts) zur automatischen Systemhärtung und Dienstinstallation (Nginx, Monitoring-Tools).

## Architektur

Das Setup besteht aus:
1.  Einem maßgeschneiderten **VPC** (industrial-vpc).
2.  Zwei isolierten **Subnetzen** (Management & Production).
3.  Einem **Cloud Router** und **Cloud NAT** für sicheren ausgehenden Traffic.
4.  Speziellen **Firewall-Regeln**, die den Zugriff strikt auf den IAP-Bereich von Google beschränken.

## Technologien
- **Cloud:** Google Cloud Platform (GCP)
- **IaC:** Terraform
- **Scripting:** Bash
- **Sicherheit:** Identity-Aware Proxy (IAP), Firewall Rules, Cloud NAT

## Installation & Deployment

1. Repository klonen:
   `git clone https://github.com/kruno-kartus/gcp-terraform-network-lab.git`
2. Terraform initialisieren:
   `terraform init`
3. Infrastruktur planen und prüfen:
   `terraform plan`
4. Deployment durchführen:
   `terraform apply`
