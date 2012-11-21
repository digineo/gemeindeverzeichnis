#!/bin/bash -e
# 
# Lädt die Suchergebnisse als HTML herunter und legt sie unter /html ab.
# 

# Ausgabe-Verzeichnis erstellen, wenn es noch nicht existiert
[ -d html ] || mkdir html

# Download der Daten
for c in `bash -c 'printf "%s " {a..z}'`; do
  curl --data "gemeinde=$c&gemeindesuchen=1" "https://www.destatis.de/cgi-bin/gv2000_suche.pl" > html/$c.html
done

