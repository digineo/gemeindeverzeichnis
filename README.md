Gemeindeverzeichnis
===================

Das [Gemeindeverzeichnis-Informationssystem](https://www.destatis.de/DE/ZahlenFakten/LaenderRegionen/Regionales/Gemeindeverzeichnis/Gemeindeverzeichnis.html) (GV-ISys) des Statistischen Bundesamts führt jede politisch selbständige Gemeinde Deutschlands (ohne Ortsteildaten) u.a. mit den Merkmalen:

* Amtlicher Gemeindeschlüssel (AGS)
* Gemeindenamen
* Die Postleitzahl des Verwaltungssitzes der Gemeinde bzw. Stadt
* Fläche in km²
* Einwohnerzahl (insgesamt/männlich/weiblich)
* Siedlungsstrukturelle Typisierungen, wie z.B. Raumordnungsregionen oder auch EU-Stadt-Land-Gliederung

Leider bietet das Statistische Bundesamt keinen kostenlosen Download des Gemeindeverzeichnisses an.
Es kann im Excel-Format für 108,- € erworben werden. Aus diesem Grund wurde dieses freie Repository geschaffen.
Die kostenlose CSV-Datei gibt es [hier](https://github.com/downloads/digineo/gemeindeverzeichnis/gemeindeverzeichnis.csv).

Aktualisierung der Daten
------------------------

Für die Aktualisierung der Daten wird [Ruby 1.9](http://www.ruby-lang.org/) und der HTML-Parser [Nokogiri](http://rubygems.org/gems/nokogiri) benötigt.

Die `./download.sh` lädt die Suchergebnisse als HTML herunter und legt sie unter /html ab.

Die `./convert.rb` wandelt die heruntergeladenen Suchergebnisse ins [YAML](http://de.wikipedia.org/wiki/YAML)-Format um und legt sie unter /data ab.

Die `./update.sh` führt den Download und die Umwandlung durch, commitet die Änderungen und pusht diese.

Die `./csv.rb` gibt die YAML-Dateien im CSV-Format auf der Standardausgabe aus.


Lizenz
------
[WTFPL](http://sam.zoy.org/wtfpl/)

