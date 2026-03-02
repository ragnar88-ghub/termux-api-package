#!/bin/bash

# ============================================================
# Kali NetHunter Non-Root Installation Script für Termux
# Ubuntu 22.04 LTS mit proot-distro
# ============================================================

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  Kali NetHunter Non-Root Installation für Termux        ║"
echo "║  Ubuntu 22.04 LTS + Pentesting Tools                    ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Farben für Output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funktion für farbigen Output
print_status() {
    echo -e "$BLUE[*]$NC $1"
}

print_success() {
    echo -e "$GREEN[✓]$NC $1"
}

print_error() {
    echo -e "$RED[✗]$NC $1"
}

print_warning() {
    echo -e "$YELLOW[!]$NC $1"
}

# Schritt 1: Voraussetzungen prüfen
print_status "Prüfe Voraussetzungen..."

if ! command -v pkg &> /dev/null; then
    print_error "Termux nicht erkannt! Bitte stelle sicher, dass du Termux installiert hast."
    exit 1
fi

print_success "Termux erkannt"

# Schritt 2: Termux aktualisieren
print_status "Aktualisiere Termux-Pakete..."
pkg update -y
pkg upgrade -y

# Schritt 3: Erforderliche Pakete installieren
print_status "Installiere erforderliche Pakete..."
pkg install -y \
    proot-distro \
    wget \
    curl \
    git \
    openssh

if [ $? -eq 0 ]; then
    print_success "Erforderliche Pakete installiert"
} else {
    print_error "Fehler beim Installieren der Pakete"
    exit 1
}

# Schritt 4: Ubuntu 22.04 LTS mit proot-distro installieren
print_status "Installiere Ubuntu 22.04 LTS (dies dauert 15-30 Minuten)..."
echo ""
print_warning "Dies ist normal - bitte warten..."
echo ""

proot-distro install ubuntu

if [ $? -eq 0 ]; then
    print_success "Ubuntu 22.04 LTS erfolgreich installiert"
} else {
    print_error "Fehler beim Installieren von Ubuntu"
    exit 1
}

# Schritt 5: Basis-System in Ubuntu konfigurieren
print_status "Konfiguriere Ubuntu..."
proot-distro run ubuntu apt-get update
proot-distro run ubuntu apt-get upgrade -y
proot-distro run ubuntu apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    nano \
    vim \
    htop

print_success "Ubuntu konfiguriert"

# Schritt 6: Pentesting-Tools installieren
print_status "Starte Installation von Pentesting-Tools..."
print_warning "Dies kann 30-60 Minuten dauern - bitte NICHT unterbrechen!"
echo ""

proot-distro run ubuntu bash -c "
apt-get install -y \
    nmap \
    metasploit-framework \
    aircrack-ng \
    john \
    hydra \
    sqlmap \
    wireshark-common \
    gobuster \
    hashcat \
    exploitdb \
    tor \
    curl \
    wget \
    git \
    python3 \
    python3-pip
"

if [ $? -eq 0 ]; then
    print_success "Pentesting-Tools installiert"
} else {
    print_warning "Einige Tools konnten nicht installiert werden - das ist normal"
}

# Schritt 7: Firefox mit Tor konfigurieren
print_status "Installiere Firefox mit Tor-Unterstützung..."
proot-distro run ubuntu apt-get install -y firefox

print_success "Firefox installiert"

# Schritt 8: Abschluss
echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║            Installation abgeschlossen! ✓                 ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
print_success "Kali NetHunter ist jetzt installiert!"
echo ""
echo "📋 Nächste Schritte:"
echo ""
echo "1. Starte Ubuntu:"
echo "   ${BLUE}proot-distro login ubuntu${NC}"
echo ""
echo "2. Überprüfe installierte Tools:"
echo "   ${BLUE}nmap --version${NC}"
echo "   ${BLUE}msfconsole --version${NC}"
echo ""
echo "3. Weitere Tools nachinstallieren:"
echo "   ${BLUE}bash /root/add-tools.sh${NC}"
echo ""
echo "📚 Weitere Informationen: siehe setup-guide.md"
echo ""