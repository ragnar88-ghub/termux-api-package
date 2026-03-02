#!/bin/bash
# Skript zur Installation zusätzlicher Tools für Termux

# Benötigte Pakete installieren
pkg update && pkg upgrade

# Vorbereitung der Installation der Tools
packages=(
  "gobuster" 
  "hashcat" 
  "searchsploit" 
  "torfox" 
  "Claude-Code"
)

# Überprüfen und Installieren der Pakete
for package in "${packages[@]}"; do
  echo "Installiere $package..."
  pkg install $package -y
  if [ $? -eq 0 ]; then
    echo "$package wurde erfolgreich installiert."
  else
    echo "Fehler bei der Installation von $package."
  fi
done

# Abschlussmitteilung
echo "Alle Tools wurden installiert. Sie können jetzt Termux verwenden, um Ihre Aufgaben zu erfüllen!"