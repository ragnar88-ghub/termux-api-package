# Kali NetHunter Non-Root Setup für Termux

Dieses Projekt ermöglicht die Installation von Kali NetHunter mit essentiellen Pentesting-Tools in Termux **ohne Root-Zugriff** unter Verwendung von `proot-distro`.

## 🎯 Features

- **Non-Root Installation** – Keine Root-Berechtigungen erforderlich
- **Ubuntu 22.04 LTS** – Stabile Basis mit vollständiger Glibc-Kompatibilität
- **Essenzielle Pentesting-Tools:**
  - Nmap (Netzwerk-Scanning)
  - Metasploit Framework (Exploitation)
  - Aircrack-ng (WLAN-Pentesting)
  - John the Ripper (Password Cracking)
  - Hydra (Brute-Force)
  - SQLMap (SQL Injection)
  - Wireshark (Packet Analysis)
  - Und weitere...

## 📋 Voraussetzungen

- **Android-Gerät** mit Termux installiert
- **Min. 11 GB** freier Speicherplatz
- **RAM:** Min. 2 GB (4+ empfohlen)
- **Termux App** (aus F-Droid oder GitHub Releases)

## 🚀 Schnellstart

```bash
# 1. Termux öffnen und aktualisieren
pkg update && pkg upgrade -y

# 2. Dieses Repository klonen
git clone https://github.com/ragnar88-ghub/termux-api-package.git
cd termux-api-package

# 3. Installationsskript ausführen
bash install-kali-nethunter.sh

# 4. Nach Installation in Ubuntu-Container wechseln
proot-distro login ubuntu

# 5. Kali-Tools in Ubuntu installieren
bash /root/install-tools.sh
```

## 📖 Detaillierte Anleitung

Siehe [setup-guide.md](setup-guide.md) für:
- Schritt-für-Schritt Installation
- Fehlerbehandlung
- Tipps & Tricks
- Häufig gestellte Fragen

## 🛠️ Dateien in diesem Repository

- `README.md` – Diese Datei
- `install-kali-nethunter.sh` – Hauptinstallationsskript
- `setup-guide.md` – Detaillierte Anleitung
- `scripts/install-tools.sh` – Installiert alle Pentesting-Tools
- `scripts/configure-proot.sh` – Konfiguriert proot-distro

## ⚠️ Wichtige Hinweise

1. **Erste Installation dauert lange** (30-60 Min je nach Internet)
2. **Speicherplatz:** Nach Installation ~4-5 GB Speicher belegt
3. **Performance:** Non-Root ist langsamer als Root-Variante
4. **Netzwerk-Tools:** Einige erweiterte Features brauchen Root

## 🔧 Troubleshooting

**Problem:** Installation friert ein
→ Siehe [setup-guide.md](setup-guide.md#troubleshooting)

**Problem:** Tools funktionieren nicht
→ Prüfe die Abhängigkeiten: `apt-get install -f`

## 📝 Lizenz

MIT License - Siehe LICENSE Datei

## 🤝 Beiträge

Fehler gefunden? Verbesserungen? Pull Requests sind willkommen!

---

**Hinweis:** Dieses Projekt wird nur für legale Penetrationstests und Lernzwecke verwendet.